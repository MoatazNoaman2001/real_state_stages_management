import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state_management_stages/presentation/widgets/simple_stage_notice.dart';

import '../../../core/di/service_locator.dart';
import '../../../data/repositories/execution_stage_repository.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../../domain/services/execution_stage_service.dart';
import '../../blocs/execution_stage/execution_stage_bloc.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';

class ExecutionStageScreen extends StatelessWidget {
  final int? initialCustomerId;

  const ExecutionStageScreen({super.key, this.initialCustomerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExecutionStageBloc(
        getIt<ExecutionStageService>(),
        getIt<ExecutionStageRepository>(),
      ),
      child: ExecutionStageScreenView(initialCustomerId: initialCustomerId),
    );
  }
}

class ExecutionStageScreenView extends StatefulWidget {
  final int? initialCustomerId;

  const ExecutionStageScreenView({super.key, this.initialCustomerId});

  @override
  State<ExecutionStageScreenView> createState() => _ExecutionStageScreenViewState();
}

class _ExecutionStageScreenViewState extends State<ExecutionStageScreenView> {
  Customer? _selectedCustomer;
  List<Customer> _customers = [];
  bool _loadingCustomers = true;

  // Step names in order
  static const _stepNames = [
    'survey_1',
    'excavation',
    'replacement',
    'survey_2',
    'plain_concrete',
    'reinforced_concrete',
    'basement_columns',
    'basement_ceiling',
    'ground_columns',
    'ground_ceiling',
    'first_columns',
    'first_ceiling',
    'second_columns',
    'second_ceiling',
    'third_columns',
    'third_ceiling',
    'fourth_columns',
    'fourth_ceiling',
    'fifth_columns',
    'fifth_ceiling',
  ];

  static const _stepDisplayNames = {
    'survey_1': 'مساحة (1)',
    'excavation': 'حفر',
    'replacement': 'إحلال',
    'survey_2': 'مساحة (2)',
    'plain_concrete': 'خرسانة عادية',
    'reinforced_concrete': 'خرسانة مسلحة',
    'basement_columns': 'أعمدة البدروم',
    'basement_ceiling': 'سقف البدروم',
    'ground_columns': 'أعمدة الأرضي',
    'ground_ceiling': 'سقف الأرضي',
    'first_columns': 'أعمدة الأول علوي',
    'first_ceiling': 'سقف الأول علوي',
    'second_columns': 'أعمدة الثاني علوي',
    'second_ceiling': 'سقف الثاني علوي',
    'third_columns': 'أعمدة الثالث علوي',
    'third_ceiling': 'سقف الثالث علوي',
    'fourth_columns': 'أعمدة الرابع علوي',
    'fourth_ceiling': 'سقف الرابع علوي',
    'fifth_columns': 'أعمدة الخامس علوي',
    'fifth_ceiling': 'سقف الخامس علوي',
  };

  @override
  void initState() {
    super.initState();
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    try {
      final customers = await getIt<CustomerService>().getAllCustomers();
      setState(() {
        _customers = customers;
        _loadingCustomers = false;

        // Auto-select customer if initialCustomerId is provided
        if (widget.initialCustomerId != null) {
          final initial = customers.where((c) => c.id == widget.initialCustomerId).firstOrNull;
          if (initial != null) {
            _selectedCustomer = initial;
            context.read<ExecutionStageBloc>().add(
              LoadExecutionStageForCustomer(initial.id),
            );
          }
        }
      });
    } catch (e) {
      setState(() => _loadingCustomers = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const AppPageHeader(
            title: 'مراحل التنفيذ',
            subtitle: 'متابعة خطوات التنفيذ حسب العميل',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildCustomerSelector(),

                      const SizedBox(height: 16),
                      _buildContent(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildCustomerSelector() {
    return AppSectionCard(
      title: 'اختيار العميل',
      icon: Icons.person_outline,
      child: _loadingCustomers
          ? const LinearProgressIndicator()
          : DropdownButtonFormField<Customer>(
              decoration: const InputDecoration(
                labelText: 'اختر العميل',
                border: OutlineInputBorder(),
              ),
              value: _selectedCustomer,
              items: _customers.map((c) {
                return DropdownMenuItem(
                  value: c,
                  child: Text('${c.customerName} - قطعة ${c.plotNumber}'),
                );
              }).toList(),
              onChanged: (customer) {
                setState(() => _selectedCustomer = customer);
                if (customer != null) {
                  context.read<ExecutionStageBloc>().add(
                        LoadExecutionStageForCustomer(customer.id),
                      );
                }
              },
            ),
    );
  }

  Widget _buildContent() {
    if (_selectedCustomer == null) {
      return const AppEmptyState(
        icon: Icons.engineering_outlined,
        title: 'اختر عميل لعرض مراحل التنفيذ',
        message: 'حدد العميل أولاً لعرض قائمة المراحل وتحديثها.',
      );
    }

    return BlocConsumer<ExecutionStageBloc, ExecutionStageState>(
      listener: (context, state) {
        if (state is ExecutionStageStepUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ExecutionStageOperationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ExecutionStageError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ExecutionStageLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ExecutionStageNotFound) {
          return _buildNoStageView(context, state.customerId);
        }

        if (state is ExecutionStageLoaded) {
          return _buildStageView(context, state);
        }

        if (state is ExecutionStageError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildNoStageView(BuildContext context, int customerId) {
    return AppSectionCard(
      title: 'لا توجد مرحلة تنفيذ',
      icon: Icons.engineering_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('يجب إصدار تصريح الحفر أولاً لإنشاء مرحلة التنفيذ.'),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton(
              text: 'إنشاء مرحلة تنفيذ جديدة',
              icon: Icons.add,
              onPressed: () {
                context.read<ExecutionStageBloc>().add(CreateExecutionStage(customerId));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageView(BuildContext context, ExecutionStageLoaded state) {
    final stage = state.stage;
    final json = stage.toJson();

    return Column(
      children: [
        // Stage Notice
        SimpleStageNotice(
          notice: stage.stageNotes,
          onEdit: () async {
            final note = await SimpleStageNotice.showEditDialog(context, stage.stageNotes);
            if (note != null && context.mounted) {
              final repo = getIt<ExecutionStageRepository>();
              await repo.update(stage.id, stage.copyWith(stageNotes: note));
              // Reload to show updated note
              context.read<ExecutionStageBloc>().add(
                LoadExecutionStageForCustomer(_selectedCustomer!.id),
              );
            }
          },
        ),
        const SizedBox(height: 16),

        AppSectionCard(
          title: 'ملخص التنفيذ',
          icon: Icons.timeline,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'الخطوة الحالية',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      state.currentStep,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.withOpacity(0.2)),
                ),
                child: Text(
                  '${state.completedSteps.length} / ${_stepNames.length}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppSectionCard(
          title: 'قائمة المراحل',
          icon: Icons.checklist,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _stepNames.length,
            itemBuilder: (context, index) {
              final stepName = _stepNames[index];
              final displayName = _stepDisplayNames[stepName]!;
              final isCompleted = json[stepName] == true;
              final dateKey = '${stepName}_date';
              final notesKey = '${stepName}_notes';
              final date = json[dateKey];
              final notes = json[notesKey] as String?;
              final isUpdating = state.updatingStep == stepName;

              return _ExecutionStepTile(
                index: index,
                stepName: stepName,
                displayName: displayName,
                isCompleted: isCompleted,
                date: date,
                notes: notes,
                stageId: stage.id,
                isUpdating: isUpdating,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ExecutionStepTile extends StatefulWidget {
  final int index;
  final String stepName;
  final String displayName;
  final bool isCompleted;
  final dynamic date;
  final String? notes;
  final int stageId;
  final bool isUpdating;

  const _ExecutionStepTile({
    required this.index,
    required this.stepName,
    required this.displayName,
    required this.isCompleted,
    required this.date,
    required this.notes,
    required this.stageId,
    this.isUpdating = false,
  });

  @override
  State<_ExecutionStepTile> createState() => _ExecutionStepTileState();
}

class _ExecutionStepTileState extends State<_ExecutionStepTile> {
  bool _isExpanded = false;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void didUpdateWidget(_ExecutionStepTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.notes != widget.notes) {
      _notesController.text = widget.notes ?? '';
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  String _formatDate(dynamic date) {
    if (date == null) return '';
    if (date is String) {
      final dt = DateTime.tryParse(date);
      if (dt != null) {
        return '${dt.day}/${dt.month}/${dt.year}';
      }
    }
    if (date is DateTime) {
      return '${date.day}/${date.month}/${date.year}';
    }
    return date.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main tile
        InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: widget.isCompleted ? Colors.green.shade50 : null,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Row(
              children: [
                // Step number
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: widget.isCompleted ? Colors.green : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: widget.isUpdating
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : widget.isCompleted
                            ? const Icon(Icons.check, color: Colors.white, size: 18)
                            : Text(
                                '${widget.index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                  ),
                ),
                const SizedBox(width: 16),

                // Step info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.displayName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: widget.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: widget.isCompleted
                              ? Colors.grey
                              : Colors.black87,
                        ),
                      ),
                      if (widget.date != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(widget.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                      if (widget.notes != null && widget.notes!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.note, size: 14, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                widget.notes!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),

                // Checkbox
                Checkbox(
                  value: widget.isCompleted,
                  onChanged: widget.isUpdating
                      ? null
                      : (value) {
                          context.read<ExecutionStageBloc>().add(
                                UpdateExecutionStep(
                                  stageId: widget.stageId,
                                  stepName: widget.stepName,
                                  value: value ?? false,
                                ),
                              );
                        },
                  activeColor: Colors.green,
                ),

                // Expand icon
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),

        // Expanded notes section
        if (_isExpanded)
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'ملاحظات',
                    hintText: 'أضف ملاحظات لهذه الخطوة...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.note_add),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _notesController.text = widget.notes ?? '';
                        setState(() => _isExpanded = false);
                      },
                      child: const Text('إلغاء'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ExecutionStageBloc>().add(
                              UpdateExecutionStepNotes(
                                stageId: widget.stageId,
                                stepName: widget.stepName,
                                notes: _notesController.text.isEmpty
                                    ? null
                                    : _notesController.text,
                              ),
                            );
                        setState(() => _isExpanded = false);
                      },
                      icon: const Icon(Icons.save, size: 18),
                      label: const Text('حفظ الملاحظات'),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
