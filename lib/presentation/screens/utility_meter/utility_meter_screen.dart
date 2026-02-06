import 'package:flutter/material.dart';
import '../../widgets/simple_stage_notice.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/repositories/utility_meter_repository.dart';
import '../../../domain/models/utility_meter.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';

class UtilityMeterScreen extends StatelessWidget {
  final int? initialCustomerId;

  const UtilityMeterScreen({super.key, this.initialCustomerId});

  @override
  Widget build(BuildContext context) {
    return _UtilityMeterView(initialCustomerId: initialCustomerId);
  }
}

class _UtilityMeterView extends StatefulWidget {
  final int? initialCustomerId;

  const _UtilityMeterView({this.initialCustomerId});

  @override
  State<_UtilityMeterView> createState() => _UtilityMeterViewState();
}

class _UtilityMeterViewState extends State<_UtilityMeterView> {
  Customer? _selectedCustomer;
  List<Customer> _customers = [];
  bool _loadingCustomers = true;
  UtilityMeter? _meter;
  bool _loadingMeter = false;
  String? _error;

  // Local state for optimistic UI
  Map<String, bool> _localStepStates = {};
  Set<String> _updatingSteps = {};

  final _repo = getIt<UtilityMeterRepository>();

  static const _stepNames = [
    'receive_documents',
    'authorization',
    'apply_for_meter',
    'inspection',
    'print_letters',
    'supply_to_meter',
    'contract_meter',
    'receive_meter',
  ];

  static const _stepDisplayNames = {
    'receive_documents': 'استلام الأوراق',
    'authorization': 'التوكيل',
    'apply_for_meter': 'التقديم علي العداد',
    'inspection': 'تحديد ميعاد المعاينة',
    'print_letters': 'طباعة الجوابات',
    'supply_to_meter': 'التوريد علي العداد',
    'contract_meter': 'التعاقد علي العداد',
    'receive_meter': 'استلام العداد',
  };

  // Boolean steps that can be toggled
  static const _booleanSteps = [
    'receive_documents',
    'authorization',
    'apply_for_meter',
    'print_letters',
    'supply_to_meter',
    'contract_meter',
    'receive_meter',
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
            _loadMeter(initial.id);
          }
        }
      });
    } catch (e) {
      setState(() => _loadingCustomers = false);
    }
  }

  Future<void> _loadMeter(int customerId) async {
    setState(() {
      _loadingMeter = true;
      _error = null;
    });

    try {
      final meter = await _repo.findByCustomerId(customerId);
      setState(() {
        _meter = meter;
        _loadingMeter = false;
        _syncLocalState();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingMeter = false;
      });
    }
  }

  void _syncLocalState() {
    if (_meter == null) return;
    final json = _meter!.toJson();
    _localStepStates = {};
    for (final step in _booleanSteps) {
      _localStepStates[step] = json[step] == true;
    }
  }

  Future<void> _createMeter(int customerId) async {
    setState(() => _loadingMeter = true);

    try {
      await _repo.insert(UtilityMeter(
        id: 0,
        customerId: customerId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
      await _loadMeter(customerId);
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingMeter = false;
      });
    }
  }

  Future<void> _updateStep(String stepName, bool value) async {
    if (_meter == null || _updatingSteps.contains(stepName)) return;

    // Optimistic update
    final previousValue = _localStepStates[stepName];
    setState(() {
      _localStepStates[stepName] = value;
      _updatingSteps.add(stepName);
    });

    try {
      await _repo.updateStep(
        meterId: _meter!.id,
        stepName: stepName,
        value: value,
      );

      // Silently refresh data in background
      final meter = await _repo.findByCustomerId(_selectedCustomer!.id);
      if (mounted) {
        setState(() {
          _meter = meter;
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
          title: 'العدادات',
          subtitle: 'متابعة خطوات توصيل العدادات حسب العميل',
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
                  _loadMeter(customer.id);
                }
              },
            ),
    );
  }

  Widget _buildContent() {
    if (_selectedCustomer == null) {
      return const AppEmptyState(
        icon: Icons.electric_meter_outlined,
        title: 'اختر عميل لعرض العداد',
        message: 'حدد العميل أولاً لعرض الخطوات.',
      );
    }

    if (_loadingMeter) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!, style: const TextStyle(color: Colors.red)));
    }

    if (_meter == null) {
      return _buildNoMeterView();
    }

    return _buildMeterView();
  }

  Widget _buildNoMeterView() {
    return AppSectionCard(
      title: 'لا يوجد عداد لهذا العميل',
      icon: Icons.electric_meter_outlined,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppButton(
          text: 'إنشاء ملف عداد جديد',
          icon: Icons.add,
          onPressed: () => _createMeter(_selectedCustomer!.id),
        ),
      ),
    );
  }

  Widget _buildMeterView() {
    final meter = _meter!;
    final json = meter.toJson();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Stage Notice
          SimpleStageNotice(
            notice: meter.stageNotes,
            onEdit: () async {
              final note = await SimpleStageNotice.showEditDialog(context, meter.stageNotes);
              if (note != null) {
                await _repo.update(meter.id, meter.copyWith(stageNotes: note));
                _loadMeter(_selectedCustomer!.id);
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
                        '${meter.progress.toStringAsFixed(1)}%',
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
                    value: meter.progress / 100,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Total amounts card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'إجمالي المبالغ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildAmountChip('المعاينة', meter.inspectionAmount),
                      _buildAmountChip('التوريد', meter.totalSupplyAmount),
                      _buildAmountChip('الإجمالي', meter.totalAmount, isTotal: true),
                    ],
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

                // Special handling for inspection (date + amount)
                if (stepName == 'inspection') {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: meter.inspectionDate != null
                          ? Colors.green
                          : Colors.grey.shade300,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(displayName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(meter.inspectionDate != null
                            ? _formatDate(meter.inspectionDate!)
                            : 'لم يتم التحديد'),
                        if (meter.inspectionAmount != null)
                          Text('المبلغ: ${meter.inspectionAmount} ج.م',
                              style: const TextStyle(color: Colors.green)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showInspectionDialog(
                        meter.inspectionDate,
                        meter.inspectionAmount,
                      ),
                    ),
                  );
                }

                // Special handling for supply_to_meter (4 money fields)
                if (stepName == 'supply_to_meter') {
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
                    subtitle: Text('إجمالي: ${meter.totalSupplyAmount} ج.م'),
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
                        child: Column(
                          children: [
                            _buildSupplyAmountRow('المبلغ 1', meter.supplyAmount1, 1),
                            _buildSupplyAmountRow('المبلغ 2', meter.supplyAmount2, 2),
                            _buildSupplyAmountRow('المبلغ 3', meter.supplyAmount3, 3),
                            _buildSupplyAmountRow('المبلغ 4', meter.supplyAmount4, 4),
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

  Widget _buildAmountChip(String label, double? amount, {bool isTotal = false}) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isTotal ? Colors.blue.shade100 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${amount ?? 0} ج.م',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isTotal ? Colors.blue : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSupplyAmountRow(String label, double? amount, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text('${amount ?? 0} ج.م'),
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            onPressed: () => _showSupplyAmountDialog(index, amount),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showInspectionDialog(DateTime? currentDate, double? currentAmount) {
    DateTime? selectedDate = currentDate;
    final amountController = TextEditingController(
      text: currentAmount?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('تحديد ميعاد المعاينة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(selectedDate != null
                    ? _formatDate(selectedDate!)
                    : 'اختر التاريخ'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (date != null) {
                    setDialogState(() => selectedDate = date);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'المبلغ (ج.م)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(ctx);
                if (selectedDate != null) {
                  await _repo.updateInspectionDate(
                    meterId: _meter!.id,
                    inspectionDate: selectedDate,
                  );
                }
                final amount = double.tryParse(amountController.text);
                if (amount != null) {
                  await _repo.updateInspectionAmount(
                    meterId: _meter!.id,
                    amount: amount,
                  );
                }
                await _loadMeter(_selectedCustomer!.id);
              },
              child: const Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSupplyAmountDialog(int index, double? currentAmount) {
    final controller = TextEditingController(text: currentAmount?.toString() ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('المبلغ $index'),
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
              await _repo.updateSupplyAmount(
                meterId: _meter!.id,
                amountIndex: index,
                amount: amount,
              );
              await _loadMeter(_selectedCustomer!.id);
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}
