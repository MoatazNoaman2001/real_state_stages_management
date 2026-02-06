import 'package:flutter/material.dart';
import '../../widgets/simple_stage_notice.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/repositories/architectural_modification_repository.dart';
import '../../../domain/models/architectural_modification.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';

class ArchitecturalModificationScreen extends StatelessWidget {
  final int? initialCustomerId;

  const ArchitecturalModificationScreen({super.key, this.initialCustomerId});

  @override
  Widget build(BuildContext context) {
    return _ArchitecturalModificationView(initialCustomerId: initialCustomerId);
  }
}

class _ArchitecturalModificationView extends StatefulWidget {
  final int? initialCustomerId;

  const _ArchitecturalModificationView({this.initialCustomerId});

  @override
  State<_ArchitecturalModificationView> createState() => _ArchitecturalModificationViewState();
}

class _ArchitecturalModificationViewState extends State<_ArchitecturalModificationView> {
  Customer? _selectedCustomer;
  List<Customer> _customers = [];
  bool _loadingCustomers = true;
  ArchitecturalModification? _modification;
  bool _loadingModification = false;
  String? _error;

  // Local state for optimistic UI
  Map<String, bool> _localStepStates = {};
  Set<String> _updatingSteps = {};

  final _repo = getIt<ArchitecturalModificationRepository>();

  static const _stepNames = [
    'draw_boards',
    'field_inspection',
    'draw_modifications',
    'submit_request',
    'request_number',
    'inspection',
    'inspection_from_agency',
    'review_with_agency',
    'approve_boards',
    'give_copy_to_owner',
  ];

  static const _stepDisplayNames = {
    'draw_boards': 'رسم اللوحات',
    'field_inspection': 'المعاينة علي الطبيعة',
    'draw_modifications': 'رسم التعديلات المعمارية',
    'submit_request': 'تقديم الطلب',
    'request_number': 'رقم الطلب',
    'inspection': 'ميعاد المعاينة من الجهاز',
    'inspection_from_agency': 'المعاينة من الجهاز',
    'review_with_agency': 'مراجعة مع الجهاز',
    'approve_boards': 'اعتماد اللوحات',
    'give_copy_to_owner': 'إعطاء النسخة للمالك',
  };

  // Boolean steps that can be toggled
  static const _booleanSteps = [
    'draw_boards',
    'field_inspection',
    'draw_modifications',
    'submit_request',
    'inspection_from_agency',
    'review_with_agency',
    'approve_boards',
    'give_copy_to_owner',
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
            _loadModification(initial.id);
          }
        }
      });
    } catch (e) {
      setState(() => _loadingCustomers = false);
    }
  }

  Future<void> _loadModification(int customerId) async {
    setState(() {
      _loadingModification = true;
      _error = null;
    });

    try {
      final modification = await _repo.findByCustomerId(customerId);
      setState(() {
        _modification = modification;
        _loadingModification = false;
        _syncLocalState();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingModification = false;
      });
    }
  }

  void _syncLocalState() {
    if (_modification == null) return;
    final json = _modification!.toJson();
    _localStepStates = {};
    for (final step in _booleanSteps) {
      _localStepStates[step] = json[step] == true;
    }
  }

  Future<void> _createModification(int customerId) async {
    setState(() => _loadingModification = true);

    try {
      await _repo.insert(ArchitecturalModification(
        id: 0,
        customerId: customerId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
      await _loadModification(customerId);
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loadingModification = false;
      });
    }
  }

  Future<void> _updateStep(String stepName, bool value) async {
    if (_modification == null || _updatingSteps.contains(stepName)) return;

    // Optimistic update
    final previousValue = _localStepStates[stepName];
    setState(() {
      _localStepStates[stepName] = value;
      _updatingSteps.add(stepName);
    });

    try {
      await _repo.updateStep(
        modificationId: _modification!.id,
        stepName: stepName,
        value: value,
      );

      // Silently refresh data in background
      final modification = await _repo.findByCustomerId(_selectedCustomer!.id);
      if (mounted) {
        setState(() {
          _modification = modification;
          _updatingSteps.remove(stepName);
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

  Future<void> _updateStepNotes(String stepName, String? notes) async {
    try {
      await _repo.updateStepNotes(
        modificationId: _modification!.id,
        stepName: stepName,
        notes: notes,
      );
      final modification = await _repo.findByCustomerId(_selectedCustomer!.id);
      if (mounted) {
        setState(() => _modification = modification);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  bool _getStepValue(String stepName) {
    return _localStepStates[stepName] ?? false;
  }

  String? _getStepNotes(String stepName) {
    if (_modification == null) return null;
    final json = _modification!.toJson();
    final notesKey = '${stepName}_notes';
    return json[notesKey] as String?;
  }

  int get _completedStepsCount {
    if (_modification == null) return 0;
    int count = 0;
    for (final step in _booleanSteps) {
      if (_getStepValue(step)) count++;
    }
    if (_modification!.requestNumber != null && _modification!.requestNumber!.isNotEmpty) count++;
    if (_modification!.inspectionDate != null) count++;
    return count;
  }

  double get _progress => (_completedStepsCount / 10) * 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppPageHeader(
          title: 'التعديلات المعمارية',
          subtitle: 'متابعة خطوات التعديلات حسب العميل',
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
                  _loadModification(customer.id);
                }
              },
            ),
    );
  }

  Widget _buildContent() {
    if (_selectedCustomer == null) {
      return const AppEmptyState(
        icon: Icons.architecture,
        title: 'اختر عميل لعرض التعديلات المعمارية',
        message: 'حدد العميل أولاً لعرض الخطوات.',
      );
    }

    if (_loadingModification) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!, style: const TextStyle(color: Colors.red)));
    }

    if (_modification == null) {
      return _buildNoModificationView();
    }

    return _buildModificationView();
  }

  Widget _buildNoModificationView() {
    return AppSectionCard(
      title: 'لا توجد تعديلات معمارية لهذا العميل',
      icon: Icons.architecture,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppButton(
          text: 'إنشاء تعديل معماري جديد',
          icon: Icons.add,
          onPressed: () => _createModification(_selectedCustomer!.id),
        ),
      ),
    );
  }

  Widget _buildModificationView() {
    final modification = _modification!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Stage Notice
          SimpleStageNotice(
            notice: modification.stageNotes,
            onEdit: () async {
              final note = await SimpleStageNotice.showEditDialog(context, modification.stageNotes);
              if (note != null) {
                await _repo.update(modification.id, modification.copyWith(stageNotes: note));
                _loadModification(_selectedCustomer!.id);
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

          // Steps list
          Card(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _stepNames.length,
              itemBuilder: (context, index) {
                final stepName = _stepNames[index];
                final displayName = _stepDisplayNames[stepName]!;
                final isUpdating = _updatingSteps.contains(stepName);
                final json = modification.toJson();
                final dateKey = '${stepName}_date';
                final date = json[dateKey];
                final notes = _getStepNotes(stepName);

                // Special handling for request_number (string field)
                if (stepName == 'request_number') {
                  return _ModificationStepTile(
                    index: index,
                    stepName: stepName,
                    displayName: displayName,
                    isCompleted: modification.requestNumber != null && modification.requestNumber!.isNotEmpty,
                    date: null,
                    notes: notes,
                    isUpdating: false,
                    isSpecialField: true,
                    specialValue: modification.requestNumber,
                    onCheckChanged: null,
                    onNotesChanged: (newNotes) => _updateStepNotes(stepName, newNotes),
                    onSpecialEdit: () => _showRequestNumberDialog(modification.requestNumber),
                  );
                }

                // Special handling for inspection (date + amount)
                if (stepName == 'inspection') {
                  return _ModificationStepTile(
                    index: index,
                    stepName: stepName,
                    displayName: displayName,
                    isCompleted: modification.inspectionDate != null,
                    date: modification.inspectionDate != null ? _formatDate(modification.inspectionDate!) : null,
                    notes: notes,
                    isUpdating: false,
                    isSpecialField: true,
                    specialValue: modification.inspectionAmount != null
                        ? 'المبلغ: ${modification.inspectionAmount} ج.م'
                        : null,
                    onCheckChanged: null,
                    onNotesChanged: (newNotes) => _updateStepNotes(stepName, newNotes),
                    onSpecialEdit: () => _showInspectionDialog(
                      modification.inspectionDate,
                      modification.inspectionAmount,
                    ),
                  );
                }

                // Regular boolean steps
                final isCompleted = _getStepValue(stepName);

                return _ModificationStepTile(
                  index: index,
                  stepName: stepName,
                  displayName: displayName,
                  isCompleted: isCompleted,
                  date: date != null ? _formatDate(DateTime.parse(date)) : null,
                  notes: notes,
                  isUpdating: isUpdating,
                  isSpecialField: false,
                  onCheckChanged: isUpdating ? null : (value) => _updateStep(stepName, value ?? false),
                  onNotesChanged: (newNotes) => _updateStepNotes(stepName, newNotes),
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

  void _showRequestNumberDialog(String? currentValue) {
    final controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('رقم الطلب'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'أدخل رقم الطلب',
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
              await _repo.updateRequestNumber(
                modificationId: _modification!.id,
                requestNumber: controller.text.isEmpty ? null : controller.text,
              );
              final modification = await _repo.findByCustomerId(_selectedCustomer!.id);
              if (mounted) {
                setState(() => _modification = modification);
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
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
          title: const Text('ميعاد المعاينة من الجهاز'),
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
                    modificationId: _modification!.id,
                    inspectionDate: selectedDate,
                  );
                }
                final amount = double.tryParse(amountController.text);
                if (amount != null) {
                  await _repo.updateInspectionAmount(
                    modificationId: _modification!.id,
                    amount: amount,
                  );
                }
                final modification = await _repo.findByCustomerId(_selectedCustomer!.id);
                if (mounted) {
                  setState(() => _modification = modification);
                }
              },
              child: const Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Expandable step tile with notes
class _ModificationStepTile extends StatefulWidget {
  final int index;
  final String stepName;
  final String displayName;
  final bool isCompleted;
  final String? date;
  final String? notes;
  final bool isUpdating;
  final bool isSpecialField;
  final String? specialValue;
  final ValueChanged<bool?>? onCheckChanged;
  final ValueChanged<String?> onNotesChanged;
  final VoidCallback? onSpecialEdit;

  const _ModificationStepTile({
    required this.index,
    required this.stepName,
    required this.displayName,
    required this.isCompleted,
    this.date,
    this.notes,
    this.isUpdating = false,
    this.isSpecialField = false,
    this.specialValue,
    this.onCheckChanged,
    required this.onNotesChanged,
    this.onSpecialEdit,
  });

  @override
  State<_ModificationStepTile> createState() => _ModificationStepTileState();
}

class _ModificationStepTileState extends State<_ModificationStepTile> {
  bool _isExpanded = false;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void didUpdateWidget(_ModificationStepTile oldWidget) {
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
                      if (widget.date != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.date!,
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                      if (widget.specialValue != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.specialValue!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
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

                // Checkbox or edit button
                if (widget.isSpecialField)
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: widget.onSpecialEdit,
                  )
                else
                  Checkbox(
                    value: widget.isCompleted,
                    onChanged: widget.isUpdating ? null : widget.onCheckChanged,
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
                        widget.onNotesChanged(
                          _notesController.text.isEmpty ? null : _notesController.text,
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
