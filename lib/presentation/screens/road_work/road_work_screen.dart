import 'package:flutter/material.dart';
import '../../widgets/simple_stage_notice.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/repositories/road_work_repository.dart';
import '../../../domain/models/road_work.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';

class RoadWorkScreen extends StatelessWidget {
  final int? initialCustomerId;

  const RoadWorkScreen({super.key, this.initialCustomerId});

  @override
  Widget build(BuildContext context) {
    return _RoadWorkView(initialCustomerId: initialCustomerId);
  }
}

class _RoadWorkView extends StatefulWidget {
  final int? initialCustomerId;

  const _RoadWorkView({this.initialCustomerId});

  @override
  State<_RoadWorkView> createState() => _RoadWorkViewState();
}

class _RoadWorkViewState extends State<_RoadWorkView> {
  Customer? _selectedCustomer;
  List<Customer> _customers = [];
  bool _loadingCustomers = true;
  RoadWork? _roadWork;
  bool _loadingRoadWork = false;
  String? _error;

  // Local state for optimistic UI
  Map<String, bool> _localStepStates = {};
  Set<String> _updatingSteps = {};

  final _repo = getIt<RoadWorkRepository>();

  double get _progress {
    if (_roadWork == null) return 0;
    int completed = 0;
    int total = 2;
    if (_roadWork!.submitRequest) completed++;
    if (_roadWork!.supply) completed++;
    return (completed / total) * 100;
  }

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
            _loadRoadWork(initial.id);
          }
        }
      });
    } catch (e) {
      setState(() => _loadingCustomers = false);
    }
  }

  Future<void> _loadRoadWork(int customerId) async {
    setState(() {
      _loadingRoadWork = true;
      _error = null;
    });

    try {
      final roadWork = await _repo.findByCustomerId(customerId);
      setState(() {
        _roadWork = roadWork;
        _loadingRoadWork = false;
        _syncLocalState();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingRoadWork = false;
      });
    }
  }

  void _syncLocalState() {
    if (_roadWork == null) return;
    _localStepStates = {
      'submit_request': _roadWork!.submitRequest,
      'supply': _roadWork!.supply,
    };
  }

  Future<void> _createRoadWork(int customerId) async {
    setState(() => _loadingRoadWork = true);

    try {
      await _repo.insert(RoadWork(
        id: 0,
        customerId: customerId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
      await _loadRoadWork(customerId);
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingRoadWork = false;
      });
    }
  }

  Future<void> _updateStep(String stepName, bool value) async {
    if (_roadWork == null || _updatingSteps.contains(stepName)) return;

    // Optimistic update
    final previousValue = _localStepStates[stepName];
    setState(() {
      _localStepStates[stepName] = value;
      _updatingSteps.add(stepName);
    });

    try {
      await _repo.updateStep(
        roadWorkId: _roadWork!.id,
        stepName: stepName,
        value: value,
      );

      // Silently refresh data in background
      final roadWork = await _repo.findByCustomerId(_selectedCustomer!.id);
      if (mounted) {
        setState(() {
          _roadWork = roadWork;
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
          title: 'إشغال الطريق',
          subtitle: 'متابعة خطوات إشغال الطريق حسب العميل',
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
                  _loadRoadWork(customer.id);
                }
              },
            ),
    );
  }

  Widget _buildContent() {
    if (_selectedCustomer == null) {
      return const AppEmptyState(
        icon: Icons.add_road_outlined,
        title: 'اختر عميل لعرض إشغال الطريق',
        message: 'حدد العميل أولاً لعرض الخطوات.',
      );
    }

    if (_loadingRoadWork) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!, style: const TextStyle(color: Colors.red)));
    }

    if (_roadWork == null) {
      return _buildNoRoadWorkView();
    }

    return _buildRoadWorkView();
  }

  Widget _buildNoRoadWorkView() {
    return AppSectionCard(
      title: 'لا يوجد إشغال طريق لهذا العميل',
      icon: Icons.add_road_outlined,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppButton(
          text: 'إنشاء إشغال طريق جديد',
          icon: Icons.add,
          onPressed: () => _createRoadWork(_selectedCustomer!.id),
        ),
      ),
    );
  }

  Widget _buildRoadWorkView() {
    final roadWork = _roadWork!;
    final isSubmitUpdating = _updatingSteps.contains('submit_request');
    final isSupplyUpdating = _updatingSteps.contains('supply');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Stage Notice
          SimpleStageNotice(
            notice: roadWork.stageNotes,
            onEdit: () async {
              final note = await SimpleStageNotice.showEditDialog(context, roadWork.stageNotes);
              if (note != null) {
                await _repo.update(roadWork.id, roadWork.copyWith(stageNotes: note));
                _loadRoadWork(_selectedCustomer!.id);
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
                        '${_progress.toStringAsFixed(1)}%',
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
                    value: _progress / 100,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Renewal alert card
          if (roadWork.renewalDate != null)
            Card(
              color: roadWork.needsRenewal ? Colors.red.shade50 : Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      roadWork.needsRenewal ? Icons.warning : Icons.check_circle,
                      color: roadWork.needsRenewal ? Colors.red : Colors.green,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            roadWork.needsRenewal
                                ? 'يحتاج تجديد!'
                                : 'صالح حتى: ${_formatDate(roadWork.renewalDate!)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: roadWork.needsRenewal ? Colors.red : Colors.green,
                            ),
                          ),
                          if (!roadWork.needsRenewal && roadWork.daysUntilRenewal != null)
                            Text('متبقي ${roadWork.daysUntilRenewal} يوم'),
                        ],
                      ),
                    ),
                    Switch(
                      value: roadWork.renewalAlertEnabled,
                      onChanged: (value) async {
                        await _repo.updateRenewalAlert(
                          roadWorkId: roadWork.id,
                          enabled: value,
                        );
                        final updated = await _repo.findByCustomerId(_selectedCustomer!.id);
                        if (mounted) setState(() => _roadWork = updated);
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (roadWork.renewalDate != null) const SizedBox(height: 16),

          // Steps list
          Card(
            child: Column(
              children: [
                // Step 1: تقديم الطلب
                CheckboxListTile(
                  secondary: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: _getStepValue('submit_request') ? Colors.green : Colors.grey.shade300,
                        child: isSubmitUpdating
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Text('1'),
                      ),
                    ],
                  ),
                  title: const Text('تقديم الطلب'),
                  subtitle: roadWork.submitRequestDate != null
                      ? Text(_formatDate(roadWork.submitRequestDate!))
                      : null,
                  value: _getStepValue('submit_request'),
                  onChanged: isSubmitUpdating
                      ? null
                      : (value) => _updateStep('submit_request', value ?? false),
                ),
                const Divider(height: 1),

                // Step 2: التوريد (with money)
                ExpansionTile(
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: _getStepValue('supply') ? Colors.green : Colors.grey.shade300,
                        child: isSupplyUpdating
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Text('2'),
                      ),
                    ],
                  ),
                  title: const Text('التوريد'),
                  subtitle: roadWork.supplyAmount != null
                      ? Text('${roadWork.supplyAmount} ج.م')
                      : null,
                  children: [
                    CheckboxListTile(
                      title: const Text('تم التوريد'),
                      value: _getStepValue('supply'),
                      onChanged: isSupplyUpdating
                          ? null
                          : (value) => _updateStep('supply', value ?? false),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Expanded(child: Text('مبلغ التوريد:')),
                          Text('${roadWork.supplyAmount ?? 0} ج.م'),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showSupplyAmountDialog(roadWork.supplyAmount),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 1),

                // Renewal date
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: roadWork.renewalDate != null
                        ? Colors.green
                        : Colors.grey.shade300,
                    child: const Icon(Icons.event_repeat, size: 20),
                  ),
                  title: const Text('تاريخ التجديد'),
                  subtitle: Text(roadWork.renewalDate != null
                      ? _formatDate(roadWork.renewalDate!)
                      : 'لم يتم التحديد'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showRenewalDateDialog(roadWork.renewalDate),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showSupplyAmountDialog(double? currentAmount) {
    final controller = TextEditingController(text: currentAmount?.toString() ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('مبلغ التوريد'),
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
                roadWorkId: _roadWork!.id,
                amount: amount,
              );
              final updated = await _repo.findByCustomerId(_selectedCustomer!.id);
              if (mounted) setState(() => _roadWork = updated);
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }

  void _showRenewalDateDialog(DateTime? currentDate) {
    showDatePicker(
      context: context,
      initialDate: currentDate ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((date) async {
      if (date != null) {
        await _repo.updateRenewalDate(
          roadWorkId: _roadWork!.id,
          renewalDate: date,
        );
        final updated = await _repo.findByCustomerId(_selectedCustomer!.id);
        if (mounted) setState(() => _roadWork = updated);
      }
    });
  }
}
