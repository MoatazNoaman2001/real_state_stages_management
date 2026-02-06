import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/repositories/inspection_repository.dart';
import '../../../domain/models/inspection.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_dialog.dart';
import '../../widgets/common/customer_search_field.dart';

class InspectionScreen extends StatefulWidget {
  const InspectionScreen({super.key});

  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen> {
  List<Inspection> _inspections = [];
  List<Customer> _customers = [];
  bool _isLoading = true;
  String? _error;

  final _repo = getIt<InspectionRepository>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final inspections = await _repo.findAll();
      final customers = await getIt<CustomerService>().getAllCustomers();
      setState(() {
        _inspections = inspections;
        _customers = customers;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  String _getCustomerName(int customerId) {
    final customer = _customers.where((c) => c.id == customerId).firstOrNull;
    return customer?.customerName ?? 'غير معروف';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppPageHeader(
          title: '\u0627\u0644\u0645\u0639\u0627\u064a\u0646\u0627\u062a',
          subtitle: '${_inspections.length} \u0645\u0639\u0627\u064a\u0646\u0629',
          actions: [
            AppButton(
              text: '\u0645\u0639\u0627\u064a\u0646\u0629 \u062c\u062f\u064a\u062f\u0629',
              icon: Icons.add,
              onPressed: _showAddInspectionDialog,
            ),
            const SizedBox(width: 8),
            AppButton(
              text: '\u062a\u062d\u062f\u064a\u062b',
              icon: Icons.refresh,
              variant: AppButtonVariant.outline,
              onPressed: _loadData,
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                        ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
                        : _inspections.isEmpty
                            ? _buildEmptyState()
                            : _buildInspectionsList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return const AppEmptyState(
      icon: Icons.assignment,
      title: '\u0644\u0627 \u062a\u0648\u062c\u062f \u0645\u0639\u0627\u064a\u0646\u0627\u062a',
      message: '\u0627\u0636\u063a\u0637 \u0639\u0644\u0649 \u0632\u0631 \u0627\u0644\u0625\u0636\u0627\u0641\u0629 \u0644\u0625\u0646\u0634\u0627\u0621 \u0645\u0639\u0627\u064a\u0646\u0629 \u062c\u062f\u064a\u062f\u0629',
    );
  }

  Widget _buildInspectionsList() {
    // Group by status
    final pending = _inspections.where((i) => i.isPending).toList();
    final completed = _inspections.where((i) => i.isCompleted).toList();
    final cancelled = _inspections.where((i) => i.isCancelled).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (pending.isNotEmpty) ...[
          _buildSectionHeader('قيد الانتظار', Colors.orange, pending.length),
          ...pending.map((i) => _buildInspectionCard(i)),
          const SizedBox(height: 16),
        ],
        if (completed.isNotEmpty) ...[
          _buildSectionHeader('مكتملة', Colors.green, completed.length),
          ...completed.map((i) => _buildInspectionCard(i)),
          const SizedBox(height: 16),
        ],
        if (cancelled.isNotEmpty) ...[
          _buildSectionHeader('ملغية', Colors.red, cancelled.length),
          ...cancelled.map((i) => _buildInspectionCard(i)),
        ],
      ],
    );
  }

  Widget _buildSectionHeader(String title, Color color, int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInspectionCard(Inspection inspection) {
    Color statusColor;
    IconData statusIcon;

    switch (inspection.status) {
      case 'completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'cancelled':
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
      default:
        statusColor = Colors.orange;
        statusIcon = Icons.hourglass_empty;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.2),
          child: Icon(statusIcon, color: statusColor),
        ),
        title: Text(_getCustomerName(inspection.customerId)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (inspection.reason != null)
              Text(inspection.reason!, style: const TextStyle(fontSize: 12)),
            if (inspection.inspectionDate != null)
              Text(
                'التاريخ: ${_formatDate(inspection.inspectionDate!)}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleStatusChange(inspection, value),
          itemBuilder: (context) => [
            if (!inspection.isCompleted)
              const PopupMenuItem(
                value: 'completed',
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 8),
                    Text('تم'),
                  ],
                ),
              ),
            if (!inspection.isCancelled)
              const PopupMenuItem(
                value: 'cancelled',
                child: Row(
                  children: [
                    Icon(Icons.cancel, color: Colors.red),
                    SizedBox(width: 8),
                    Text('إلغاء'),
                  ],
                ),
              ),
            if (!inspection.isPending)
              const PopupMenuItem(
                value: 'pending',
                child: Row(
                  children: [
                    Icon(Icons.hourglass_empty, color: Colors.orange),
                    SizedBox(width: 8),
                    Text('قيد الانتظار'),
                  ],
                ),
              ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('حذف'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleStatusChange(Inspection inspection, String action) async {
    try {
      if (action == 'delete') {
        await _repo.delete(inspection.id);
      } else {
        await _repo.updateStatus(inspectionId: inspection.id, status: action);
      }
      await _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(action == 'delete' ? 'تم الحذف' : 'تم التحديث'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _showAddInspectionDialog() {
    Customer? selectedCustomer;
    final reasonController = TextEditingController();
    DateTime? selectedDate;

    AppDialog.show(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AppFormDialog(
          title: '\u0645\u0639\u0627\u064a\u0646\u0629 \u062c\u062f\u064a\u062f\u0629',
          saveText: '\u0625\u0636\u0627\u0641\u0629',
          onSave: selectedCustomer == null
              ? null
              : () async {
                  Navigator.pop(ctx);
                  await _repo.insert(Inspection(
                    id: 0,
                    customerId: selectedCustomer!.id,
                    reason: reasonController.text.isEmpty
                        ? null
                        : reasonController.text,
                    inspectionDate: selectedDate,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  ));
                  await _loadData();
                },
          onCancel: () => Navigator.pop(ctx),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomerSearchField(
                onSelected: (c) {
                  setDialogState(() => selectedCustomer = c);
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: '\u0627\u0644\u0633\u0628\u0628',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: AppColors.border),
                ),
                title: Text(selectedDate != null
                    ? _formatDate(selectedDate!)
                    : '\u0627\u062e\u062a\u0631 \u062a\u0627\u0631\u064a\u062e \u0627\u0644\u0645\u0639\u0627\u064a\u0646\u0629'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (date != null) {
                    setDialogState(() => selectedDate = date);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
