import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../data/repositories/excavation_permit_repository.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../../domain/services/excavation_permit_service.dart';
import '../../blocs/excavation_permit/excavation_permit_bloc.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/customer_search_field.dart';
import '../../widgets/simple_stage_notice.dart';

class ExcavationPermitScreen extends StatelessWidget {
  final int? initialCustomerId;

  const ExcavationPermitScreen({super.key, this.initialCustomerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExcavationPermitBloc(
        getIt<ExcavationPermitService>(),
        getIt<ExcavationPermitRepository>(),
      ),
      child: ExcavationPermitScreenView(initialCustomerId: initialCustomerId),
    );
  }
}

class ExcavationPermitScreenView extends StatefulWidget {
  final int? initialCustomerId;

  const ExcavationPermitScreenView({super.key, this.initialCustomerId});

  @override
  State<ExcavationPermitScreenView> createState() => _ExcavationPermitScreenViewState();
}

class _ExcavationPermitScreenViewState extends State<ExcavationPermitScreenView> {
  Customer? _selectedCustomer;

  // Step names in order
  static const _stepNames = [
    'supervision_certificate',
    'contract_agreement',
    'approve_contract_from_union',
    'supply_to_union',
    'issue_excavation_permit',
    'army_permit',
    'equipment_permit',
  ];

  static const _stepDisplayNames = {
    'supervision_certificate': 'شهادة الإشراف',
    'contract_agreement': 'عقد مقاولة',
    'approve_contract_from_union': 'اعتماد عقد المقاولة من النقابة',
    'supply_to_union': 'توريد النقابة',
    'issue_excavation_permit': 'إصدار تصريح الحفر',
    'army_permit': 'تصريح الجيش',
    'equipment_permit': 'تصريح معدات',
  };

  @override
  void initState() {
    super.initState();
    _loadInitialCustomer();
  }

  Future<void> _loadInitialCustomer() async {
    if (widget.initialCustomerId == null) return;
    try {
      final customer = await getIt<CustomerService>().getCustomer(widget.initialCustomerId!);
      if (customer != null && mounted) {
        setState(() => _selectedCustomer = customer);
        context.read<ExcavationPermitBloc>().add(
          LoadExcavationPermitForCustomer(customer.id),
        );
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppPageHeader(
          title: 'تصريح الحفر',
          subtitle: 'متابعة خطوات تصريح الحفر حسب العميل',
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
      child: CustomerSearchField(
        initialCustomer: _selectedCustomer,
        onSelected: (customer) {
          setState(() => _selectedCustomer = customer);
          if (customer != null) {
            context.read<ExcavationPermitBloc>().add(
                  LoadExcavationPermitForCustomer(customer.id),
                );
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedCustomer == null) {
      return const AppEmptyState(
        icon: Icons.construction_outlined,
        title: 'اختر عميل لعرض تصريح الحفر',
        message: 'حدد العميل أولاً لعرض الخطوات.',
      );
    }

    return BlocConsumer<ExcavationPermitBloc, ExcavationPermitState>(
      listener: (context, state) {
        if (state is ExcavationPermitStepUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ExcavationPermitOperationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ExcavationPermitError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ExcavationPermitLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ExcavationPermitNotFound) {
          return _buildNoPermitView(context, state.customerId);
        }

        if (state is ExcavationPermitLoaded) {
          return _buildPermitView(context, state);
        }

        if (state is ExcavationPermitError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildNoPermitView(BuildContext context, int customerId) {
    return AppSectionCard(
      title: 'لا يوجد تصريح حفر لهذا العميل',
      icon: Icons.construction_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('يجب إصدار الترخيص أولاً لإنشاء تصريح الحفر.'),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton(
              text: 'إنشاء تصريح حفر جديد',
              icon: Icons.add,
              onPressed: () {
                context.read<ExcavationPermitBloc>().add(CreateExcavationPermit(customerId));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermitView(BuildContext context, ExcavationPermitLoaded state) {
    final permit = state.permit;
    final json = permit.toJson();

    return Column(
      children: [
        // Stage Notice
        SimpleStageNotice(
          notice: permit.stageNotes,
          onEdit: () async {
            final note = await SimpleStageNotice.showEditDialog(
              context,
              permit.stageNotes,
            );
            if (note != null && context.mounted) {
              final repo = getIt<ExcavationPermitRepository>();
              await repo.update(
                permit.id,
                permit.copyWith(stageNotes: note),
              );
              // Reload to show updated note
              context.read<ExcavationPermitBloc>().add(
                LoadExcavationPermitForCustomer(_selectedCustomer!.id),
              );
            }
          },
        ),
        const SizedBox(height: 16),

        AppSectionCard(
          title: 'ملخص تصريح الحفر',
          icon: Icons.timeline,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('نسبة الإنجاز', style: TextStyle(fontSize: 14)),
                  Text(
                    '${state.progress.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: state.progress / 100,
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              if (state.nextStep != null) ...[
                const SizedBox(height: 8),
                Text(
                  'الخطوة التالية: ${_stepDisplayNames[state.nextStep]}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppSectionCard(
          title: 'خطوات التصريح',
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

              if (stepName == 'supply_to_union') {
                return _SupplyStepTile(
                  index: index,
                  stepName: stepName,
                  displayName: displayName,
                  isCompleted: isCompleted,
                  date: date,
                  notes: notes,
                  amount: permit.unionSupplyAmount,
                  permitId: permit.id,
                  isUpdating: isUpdating,
                );
              }

              return _PermitStepTile(
                index: index,
                stepName: stepName,
                displayName: displayName,
                isCompleted: isCompleted,
                date: date,
                notes: notes,
                permitId: permit.id,
                isUpdating: isUpdating,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PermitStepTile extends StatefulWidget {
  final int index;
  final String stepName;
  final String displayName;
  final bool isCompleted;
  final dynamic date;
  final String? notes;
  final int permitId;
  final bool isUpdating;

  const _PermitStepTile({
    required this.index,
    required this.stepName,
    required this.displayName,
    required this.isCompleted,
    required this.date,
    required this.notes,
    required this.permitId,
    this.isUpdating = false,
  });

  @override
  State<_PermitStepTile> createState() => _PermitStepTileState();
}

class _PermitStepTileState extends State<_PermitStepTile> {
  bool _isExpanded = false;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void didUpdateWidget(_PermitStepTile oldWidget) {
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.displayName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: widget.isCompleted ? Colors.grey : Colors.black87,
                        ),
                      ),
                      if (widget.date != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(widget.date),
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ],
                  ),
                ),
                // Notes indicator
                if (widget.notes != null && widget.notes!.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.note, size: 14, color: Colors.orange.shade700),
                        const SizedBox(width: 4),
                        Text(
                          'ملاحظة',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                Checkbox(
                  value: widget.isCompleted,
                  onChanged: widget.isUpdating
                      ? null
                      : (value) {
                          context.read<ExcavationPermitBloc>().add(
                                UpdateExcavationPermitStep(
                                  permitId: widget.permitId,
                                  stepName: widget.stepName,
                                  value: value ?? false,
                                ),
                              );
                        },
                  activeColor: Colors.green,
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
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
                  maxLines: 2,
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
                        context.read<ExcavationPermitBloc>().add(
                              UpdateExcavationPermitStepNotes(
                                permitId: widget.permitId,
                                stepName: widget.stepName,
                                notes: _notesController.text.isEmpty
                                    ? null
                                    : _notesController.text,
                              ),
                            );
                        setState(() => _isExpanded = false);
                      },
                      icon: const Icon(Icons.save, size: 18),
                      label: const Text('حفظ'),
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

class _SupplyStepTile extends StatefulWidget {
  final int index;
  final String stepName;
  final String displayName;
  final bool isCompleted;
  final dynamic date;
  final String? notes;
  final double? amount;
  final int permitId;
  final bool isUpdating;

  const _SupplyStepTile({
    required this.index,
    required this.stepName,
    required this.displayName,
    required this.isCompleted,
    required this.date,
    required this.notes,
    required this.amount,
    required this.permitId,
    this.isUpdating = false,
  });

  @override
  State<_SupplyStepTile> createState() => _SupplyStepTileState();
}

class _SupplyStepTileState extends State<_SupplyStepTile> {
  bool _isExpanded = false;
  late TextEditingController _notesController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes);
    _amountController = TextEditingController(
      text: widget.amount?.toStringAsFixed(2) ?? '',
    );
  }

  @override
  void didUpdateWidget(_SupplyStepTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.notes != widget.notes) {
      _notesController.text = widget.notes ?? '';
    }
    if (oldWidget.amount != widget.amount) {
      _amountController.text = widget.amount?.toStringAsFixed(2) ?? '';
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    _amountController.dispose();
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.displayName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: widget.isCompleted ? Colors.grey : Colors.black87,
                        ),
                      ),
                      if (widget.amount != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          '${widget.amount!.toStringAsFixed(2)} ج.م',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                      if (widget.date != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(widget.date),
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ],
                  ),
                ),
                // Notes indicator
                if (widget.notes != null && widget.notes!.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.note, size: 14, color: Colors.orange.shade700),
                        const SizedBox(width: 4),
                        Text(
                          'ملاحظة',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                Checkbox(
                  value: widget.isCompleted,
                  onChanged: widget.isUpdating
                      ? null
                      : (value) {
                          context.read<ExcavationPermitBloc>().add(
                                UpdateExcavationPermitStep(
                                  permitId: widget.permitId,
                                  stepName: widget.stepName,
                                  value: value ?? false,
                                ),
                              );
                        },
                  activeColor: Colors.green,
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Amount field
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'المبلغ (ج.م)',
                    hintText: 'أدخل مبلغ التوريد...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                // Notes field
                TextField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'ملاحظات',
                    hintText: 'أضف ملاحظات...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.note_add),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _notesController.text = widget.notes ?? '';
                        _amountController.text = widget.amount?.toStringAsFixed(2) ?? '';
                        setState(() => _isExpanded = false);
                      },
                      child: const Text('إلغاء'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Save amount
                        final amount = double.tryParse(_amountController.text);
                        context.read<ExcavationPermitBloc>().add(
                              UpdateExcavationPermitAmount(
                                permitId: widget.permitId,
                                amount: amount,
                              ),
                            );
                        // Save notes
                        context.read<ExcavationPermitBloc>().add(
                              UpdateExcavationPermitStepNotes(
                                permitId: widget.permitId,
                                stepName: widget.stepName,
                                notes: _notesController.text.isEmpty
                                    ? null
                                    : _notesController.text,
                              ),
                            );
                        setState(() => _isExpanded = false);
                      },
                      icon: const Icon(Icons.save, size: 18),
                      label: const Text('حفظ'),
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
