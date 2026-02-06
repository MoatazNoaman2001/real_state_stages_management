import 'package:flutter/material.dart';
import '../../widgets/simple_stage_notice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../data/repositories/license_repository.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../../domain/services/license_service.dart';
import '../../blocs/license/license_bloc.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_dialog.dart';
import '../../widgets/common/app_text_field.dart';

class LicenseScreen extends StatelessWidget {
  final int? initialCustomerId;

  const LicenseScreen({super.key, this.initialCustomerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LicenseBloc(getIt<LicenseService>()),
      child: LicenseScreenView(initialCustomerId: initialCustomerId),
    );
  }
}

class LicenseScreenView extends StatefulWidget {
  final int? initialCustomerId;

  const LicenseScreenView({super.key, this.initialCustomerId});

  @override
  State<LicenseScreenView> createState() => _LicenseScreenViewState();
}

class _LicenseScreenViewState extends State<LicenseScreenView> {
  Customer? _selectedCustomer;
  List<Customer> _customers = [];
  bool _loadingCustomers = true;

  // Step names in order (matching the License model)
  static const _stepNames = [
    'receive_documents',
    'receive_authorization',
    'site_validity',
    'executive_status',
    'show_to_owner',
    'review_with_agency',
    'civil_defense',
    'prepare_structural',
    'prepare_structural_reports',
    'submit_to_complex',
    'supply_to_complex',
    'do_complex_notes',
    'issue_document',
    'prepare_facade_boards',
    'apply_online_for_license',
    'request_number',
    'agency_review',
    'determine_fees',
    'pay_fees',
    'issue_license',
    'apply_for_structural_meter',
    'give_board_copy_to_owner',
  ];

  static const _stepDisplayNames = {
    'receive_documents': 'استلام الأوراق',
    'receive_authorization': 'استلام التوكيل',
    'site_validity': 'صلاحية موقع',
    'executive_status': 'موقف تنفيذي',
    'show_to_owner': 'عرض على المالك',
    'review_with_agency': 'مراجعة مع الجهاز',
    'civil_defense': 'دفاع مدني',
    'prepare_structural': 'تجهيز الإنشائي',
    'prepare_structural_reports': 'تجهيز تقارير الإنشائي',
    'submit_to_complex': 'تقديم المجمعة',
    'supply_to_complex': 'توريد المجمعة',
    'do_complex_notes': 'عمل ملاحظات المجمعة',
    'issue_document': 'إصدار الوثيقة',
    'prepare_facade_boards': 'تجهيز لوحات الواجهات والصحي والكهرباء',
    'apply_online_for_license': 'التقديم على الموقع لإصدار الترخيص',
    'request_number': 'رقم الطلب',
    'agency_review': 'مراجعة الجهاز',
    'determine_fees': 'تحديد الرسوم',
    'pay_fees': 'سداد الرسوم',
    'issue_license': 'إصدار الرخصة',
    'apply_for_structural_meter': 'تقديم على عداد إنشائي',
    'give_board_copy_to_owner': 'إعطاء نسخة اللوحات للمالك',
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

        if (widget.initialCustomerId != null) {
          final initial = customers.where((c) => c.id == widget.initialCustomerId).firstOrNull;
          if (initial != null) {
            _selectedCustomer = initial;
            context.read<LicenseBloc>().add(LoadLicenseForCustomer(initial.id));
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
        AppPageHeader(
          title: 'التراخيص',
          subtitle: 'إدارة مراحل الترخيص حسب العميل',
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
              decoration: InputDecoration(
                labelText: 'اختر العميل',
                border: const OutlineInputBorder(),
              ),
              value: _selectedCustomer,
              items: _customers.map((c) {
                return DropdownMenuItem(
                  value: c,
                  child: Text(c.customerName),
                );
              }).toList(),
              onChanged: (customer) {
                setState(() => _selectedCustomer = customer);
                if (customer != null) {
                  context.read<LicenseBloc>().add(
                        LoadLicenseForCustomer(customer.id),
                      );
                }
              },
            ),
    );
  }

  Widget _buildContent() {
    if (_selectedCustomer == null) {
      return AppEmptyState(
        icon: Icons.description_outlined,
        title: 'اختر عميل لعرض التراخيص',
        message: 'حدد العميل أولاً لعرض خطوات الترخيص.',
      );
    }

    return BlocConsumer<LicenseBloc, LicenseState>(
      listener: (context, state) {
        if (state is LicenseStepUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is LicenseError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LicenseLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LicenseNotFound) {
          return _buildNoLicenseView(context, state.customerId);
        }

        if (state is LicenseLoaded) {
          return _buildLicenseView(context, state);
        }

        if (state is LicenseError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildNoLicenseView(BuildContext context, int customerId) {
    return AppSectionCard(
      title: 'لا يوجد ترخيص لهذا العميل',
      icon: Icons.description_outlined,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppButton(
          text: 'إنشاء ترخيص جديد',
          icon: Icons.add,
          onPressed: () {
            context.read<LicenseBloc>().add(CreateLicense(customerId));
          },
        ),
      ),
    );
  }

  Widget _buildLicenseView(BuildContext context, LicenseLoaded state) {
    final license = state.license;
    final json = license.toJson();

    return Column(
      children: [
        // Stage Notice
        SimpleStageNotice(
          notice: license.stageNotes,
          onEdit: () async {
            final note = await SimpleStageNotice.showEditDialog(context, license.stageNotes);
            if (note != null && context.mounted) {
              final repo = getIt<LicenseRepository>();
              await repo.update(license.id, license.copyWith(stageNotes: note));
              // Reload to show updated note
              context.read<LicenseBloc>().add(
                LoadLicenseForCustomer(_selectedCustomer!.id),
              );
            }
          },
        ),
        const SizedBox(height: 16),

        AppSectionCard(
          title: 'ملخص الترخيص',
          icon: Icons.timeline,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('نسبة الإنجاز', style: const TextStyle(fontSize: 14)),
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
          title: 'خطوات الترخيص',
          icon: Icons.checklist,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _stepNames.length,
            itemBuilder: (context, index) {
              final stepName = _stepNames[index];
              final displayName = _stepDisplayNames[stepName]!;
              final isUpdating = state.updatingStep == stepName;
              final notesKey = '${stepName}_notes';
              final notes = json[notesKey] as String?;

              if (stepName == 'request_number') {
                return _LicenseStepTile(
                  index: index,
                  stepName: stepName,
                  displayName: displayName,
                  isCompleted: license.requestNumber != null && license.requestNumber!.isNotEmpty,
                  date: null,
                  notes: notes,
                  licenseId: license.id,
                  isUpdating: isUpdating,
                  isSpecialField: true,
                  specialValue: license.requestNumber,
                  onSpecialEdit: () => _showRequestNumberDialog(
                    context,
                    license.id,
                    license.requestNumber,
                  ),
                );
              }

              final isCompleted = json[stepName] == true;
              final dateKey = '${stepName}_date';
              final date = json[dateKey];

              return _LicenseStepTile(
                index: index,
                stepName: stepName,
                displayName: displayName,
                isCompleted: isCompleted,
                date: date,
                notes: notes,
                licenseId: license.id,
                isUpdating: isUpdating,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        AppSectionCard(
          title: 'المبالغ المالية',
          icon: Icons.payments_outlined,
          child: Row(
            children: [
              Expanded(
                child: _buildAmountField(
                  'توريد المجمعة',
                  license.complexSupplyAmount,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildAmountField(
                  'سداد الرسوم',
                  license.feesAmount,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAmountField(String label, double? amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          amount != null ? '${amount.toStringAsFixed(2)} ?.?' : 'لم يتم التحديد',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _showRequestNumberDialog(
    BuildContext context,
    int licenseId,
    String? currentValue,
  ) {
    final controller = TextEditingController(text: currentValue);
    AppDialog.show(
      context: context,
      builder: (dialogContext) => AppFormDialog(
        title: 'رقم الطلب',
        width: 520,
        content: AppTextField(
          controller: controller,
          label: 'أدخل رقم الطلب',
          prefixIcon: Icons.numbers,
        ),
        onSave: () {
          context.read<LicenseBloc>().add(
                UpdateLicenseRequestNumber(
                  licenseId: licenseId,
                  requestNumber: controller.text.isEmpty
                      ? null
                      : controller.text,
                ),
              );
          Navigator.pop(dialogContext);
        },
      ),
    );
  }
}

class _LicenseStepTile extends StatefulWidget {
  final int index;
  final String stepName;
  final String displayName;
  final bool isCompleted;
  final dynamic date;
  final String? notes;
  final int licenseId;
  final bool isUpdating;
  final bool isSpecialField;
  final String? specialValue;
  final VoidCallback? onSpecialEdit;

  const _LicenseStepTile({
    required this.index,
    required this.stepName,
    required this.displayName,
    required this.isCompleted,
    required this.date,
    required this.notes,
    required this.licenseId,
    this.isUpdating = false,
    this.isSpecialField = false,
    this.specialValue,
    this.onSpecialEdit,
  });

  @override
  State<_LicenseStepTile> createState() => _LicenseStepTileState();
}

class _LicenseStepTileState extends State<_LicenseStepTile> {
  bool _isExpanded = false;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void didUpdateWidget(_LicenseStepTile oldWidget) {
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
                          color: widget.isCompleted ? Colors.grey : Colors.black87,
                        ),
                      ),
                      if (widget.isSpecialField && widget.specialValue != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.specialValue!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
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

                // Checkbox or Edit button
                if (widget.isSpecialField)
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: widget.onSpecialEdit,
                  )
                else
                  Checkbox(
                    value: widget.isCompleted,
                    onChanged: widget.isUpdating
                        ? null
                        : (value) {
                            context.read<LicenseBloc>().add(
                                  UpdateLicenseStep(
                                    licenseId: widget.licenseId,
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
                        context.read<LicenseBloc>().add(
                              UpdateLicenseStepNotes(
                                licenseId: widget.licenseId,
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
