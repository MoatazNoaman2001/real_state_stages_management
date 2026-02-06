import 'package:flutter/material.dart';
import '../../widgets/simple_stage_notice.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/repositories/rooftop_addition_repository.dart';
import '../../../domain/models/rooftop_addition.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';

class RooftopAdditionScreen extends StatelessWidget {
  final int? initialCustomerId;

  const RooftopAdditionScreen({super.key, this.initialCustomerId});

  @override
  Widget build(BuildContext context) {
    return _RooftopAdditionView(initialCustomerId: initialCustomerId);
  }
}

class _RooftopAdditionView extends StatefulWidget {
  final int? initialCustomerId;

  const _RooftopAdditionView({this.initialCustomerId});

  @override
  State<_RooftopAdditionView> createState() => _RooftopAdditionViewState();
}

class _RooftopAdditionViewState extends State<_RooftopAdditionView> {
  Customer? _selectedCustomer;
  List<Customer> _customers = [];
  bool _loadingCustomers = true;
  RooftopAddition? _rooftop;
  bool _loadingRooftop = false;
  String? _error;

  // Local state for optimistic UI
  Map<String, bool> _localStepStates = {};
  Set<String> _updatingSteps = {};

  final _repo = getIt<RooftopAdditionRepository>();

  static const _stepNames = [
    'submit_request',
    'pay_inspection',
    'inspection',
    'review_with_agency',
    'print_letters',
    'supply',
    'initial_contract',
    'supplementary_contract',
    'then_to_license',
  ];

  static const _stepDisplayNames = {
    'submit_request': 'التقديم علي الطلب',
    'pay_inspection': 'سداد المعاينة',
    'inspection': 'ميعاد المعاينة',
    'review_with_agency': 'مراجعة مع الجهاز',
    'print_letters': 'طباعة الجوابات',
    'supply': 'التوريد',
    'initial_contract': 'العقد الابتدائي',
    'supplementary_contract': 'العقد الملحق',
    'then_to_license': 'وتروح بعدها للترخيص',
  };

  // Boolean steps that can be toggled
  static const _booleanSteps = [
    'submit_request',
    'pay_inspection',
    'review_with_agency',
    'print_letters',
    'supply',
    'initial_contract',
    'supplementary_contract',
    'then_to_license',
  ];

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
            _loadRooftop(initial.id);
          }
        }
      });
    } catch (e) {
      setState(() => _loadingCustomers = false);
    }
  }

  Future<void> _loadRooftop(int customerId) async {
    setState(() {
      _loadingRooftop = true;
      _error = null;
    });

    try {
      final rooftop = await _repo.findByCustomerId(customerId);
      setState(() {
        _rooftop = rooftop;
        _loadingRooftop = false;
        _syncLocalState();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingRooftop = false;
      });
    }
  }

  void _syncLocalState() {
    if (_rooftop == null) return;
    final json = _rooftop!.toJson();
    _localStepStates = {};
    for (final step in _booleanSteps) {
      _localStepStates[step] = json[step] == true;
    }
  }

  Future<void> _createRooftop(int customerId) async {
    setState(() => _loadingRooftop = true);

    try {
      await _repo.insert(RooftopAddition(
        id: 0,
        customerId: customerId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
      await _loadRooftop(customerId);
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingRooftop = false;
      });
    }
  }

  Future<void> _updateStep(String stepName, bool value) async {
    if (_rooftop == null || _updatingSteps.contains(stepName)) return;

    // Optimistic update
    final previousValue = _localStepStates[stepName];
    setState(() {
      _localStepStates[stepName] = value;
      _updatingSteps.add(stepName);
    });

    try {
      await _repo.updateStep(
        additionId: _rooftop!.id,
        stepName: stepName,
        value: value,
      );

      // Silently refresh data in background
      final rooftop = await _repo.findByCustomerId(_selectedCustomer!.id);
      if (mounted) {
        setState(() {
          _rooftop = rooftop;
          _updatingSteps.remove(stepName);
          _syncLocalState();
        });
      }
    } catch (e) {
      // Revert on error
      if (mounted) {
        setState(() {
          _localStepStates[stepName] = previousValue ?? false;
          _updatingSteps.remove(stepName);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  bool _getStepValue(String stepName) {
    return _localStepStates[stepName] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppPageHeader(
          title: 'إضافة الأسطح',
          subtitle: 'متابعة خطوات تعلية غرف السطح حسب العميل',
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildCustomerSelector(),
                    const SizedBox(height: 16),
                    Expanded(child: _buildContent()),
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
                  child: Text(c.customerName),
                );
              }).toList(),
              onChanged: (customer) {
                setState(() => _selectedCustomer = customer);
                if (customer != null) {
                  _loadRooftop(customer.id);
                }
              },
            ),
    );
  }

  Widget _buildContent() {
    if (_selectedCustomer == null) {
      return const AppEmptyState(
        icon: Icons.roofing_outlined,
        title: 'اختر عميل لعرض إضافة الأسطح',
        message: 'حدد العميل أولاً لعرض الخطوات.',
      );
    }

    if (_loadingRooftop) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!, style: const TextStyle(color: Colors.red)));
    }

    if (_rooftop == null) {
      return _buildNoRooftopView();
    }

    return _buildRooftopView();
  }

  Widget _buildNoRooftopView() {
    return AppSectionCard(
      title: 'لا يوجد تعلية غرف سطح لهذا العميل',
      icon: Icons.roofing_outlined,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppButton(
          text: 'إنشاء تعلية غرف سطح جديدة',
          icon: Icons.add,
          onPressed: () => _createRooftop(_selectedCustomer!.id),
        ),
      ),
    );
  }

  Widget _buildRooftopView() {
    final rooftop = _rooftop!;
    final json = rooftop.toJson();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Stage Notice
          SimpleStageNotice(
            notice: rooftop.stageNotes,
            onEdit: () async {
              final note = await SimpleStageNotice.showEditDialog(context, rooftop.stageNotes);
              if (note != null) {
                await _repo.update(rooftop.id, rooftop.copyWith(stageNotes: note));
                _loadRooftop(_selectedCustomer!.id);
              }
            },
          ),
          const SizedBox(height: 16),

          // Progress card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('نسبة الإنجاز', style: TextStyle(fontSize: 16)),
                      Text(
                        '${rooftop.progress.toStringAsFixed(1)}%',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: rooftop.progress / 100,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Steps list
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _stepNames.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final stepName = _stepNames[index];
                final displayName = _stepDisplayNames[stepName]!;
                final isUpdating = _updatingSteps.contains(stepName);

                // Special handling for pay_inspection (money field)
                if (stepName == 'pay_inspection') {
                  final isCompleted = _getStepValue(stepName);
                  return ExpansionTile(
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: isCompleted ? Colors.green : Colors.grey.shade300,
                          child: isUpdating
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text('${index + 1}'),
                        ),
                      ],
                    ),
                    title: Text(displayName),
                    subtitle: rooftop.inspectionAmount != null
                        ? Text('${rooftop.inspectionAmount} ج.م')
                        : null,
                    children: [
                      CheckboxListTile(
                        title: const Text('تم السداد'),
                        value: isCompleted,
                        onChanged: isUpdating
                            ? null
                            : (value) => _updateStep(stepName, value ?? false),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const Expanded(child: Text('مبلغ المعاينة:')),
                            Text('${rooftop.inspectionAmount ?? 0} ج.م'),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showAmountDialog(
                                'مبلغ المعاينة',
                                rooftop.inspectionAmount,
                                (amount) => _repo.updateInspectionAmount(
                                  additionId: rooftop.id,
                                  amount: amount,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                // Special handling for inspection (date field)
                if (stepName == 'inspection') {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: rooftop.inspectionDate != null
                          ? Colors.green
                          : Colors.grey.shade300,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(displayName),
                    subtitle: Text(rooftop.inspectionDate != null
                        ? _formatDate(rooftop.inspectionDate!)
                        : 'لم يتم التحديد'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showDateDialog(rooftop.inspectionDate),
                    ),
                  );
                }

                // Special handling for supply (money field)
                if (stepName == 'supply') {
                  final isCompleted = _getStepValue(stepName);
                  return ExpansionTile(
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: isCompleted ? Colors.green : Colors.grey.shade300,
                          child: isUpdating
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text('${index + 1}'),
                        ),
                      ],
                    ),
                    title: Text(displayName),
                    subtitle: rooftop.supplyAmount != null
                        ? Text('${rooftop.supplyAmount} ج.م')
                        : null,
                    children: [
                      CheckboxListTile(
                        title: const Text('تم التوريد'),
                        value: isCompleted,
                        onChanged: isUpdating
                            ? null
                            : (value) => _updateStep(stepName, value ?? false),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const Expanded(child: Text('مبلغ التوريد:')),
                            Text('${rooftop.supplyAmount ?? 0} ج.م'),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showAmountDialog(
                                'مبلغ التوريد',
                                rooftop.supplyAmount,
                                (amount) => _repo.updateSupplyAmount(
                                  additionId: rooftop.id,
                                  amount: amount,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                // Regular boolean steps
                final isCompleted = _getStepValue(stepName);
                final dateKey = '${stepName}_date';
                final date = json[dateKey];

                return CheckboxListTile(
                  secondary: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: isCompleted ? Colors.green : Colors.grey.shade300,
                        child: isUpdating
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text('${index + 1}'),
                      ),
                    ],
                  ),
                  title: Text(displayName),
                  subtitle: date != null ? Text(_formatDate(DateTime.parse(date))) : null,
                  value: isCompleted,
                  onChanged: isUpdating
                      ? null
                      : (value) => _updateStep(stepName, value ?? false),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showAmountDialog(String title, double? currentAmount, Future<void> Function(double?) onSave) {
    final controller = TextEditingController(text: currentAmount?.toString() ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'أدخل المبلغ (ج.م)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final amount = double.tryParse(controller.text);
              await onSave(amount);
              await _loadRooftop(_selectedCustomer!.id);
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }

  void _showDateDialog(DateTime? currentDate) {
    showDatePicker(
      context: context,
      initialDate: currentDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((date) async {
      if (date != null) {
        await _repo.updateInspectionDate(
          additionId: _rooftop!.id,
          inspectionDate: date,
        );
        await _loadRooftop(_selectedCustomer!.id);
      }
    });
  }
}
