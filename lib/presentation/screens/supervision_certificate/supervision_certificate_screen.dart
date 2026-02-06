import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/repositories/supervision_certificate_repository.dart';
import '../../../domain/models/supervision_certificate.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';

class SupervisionCertificateScreen extends StatefulWidget {
  const SupervisionCertificateScreen({super.key});

  @override
  State<SupervisionCertificateScreen> createState() => _SupervisionCertificateScreenState();
}

class _SupervisionCertificateScreenState extends State<SupervisionCertificateScreen> {
  List<SupervisionCertificate> _certificates = [];
  List<Customer> _customers = [];
  bool _isLoading = true;
  String? _error;

  final _repo = getIt<SupervisionCertificateRepository>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final certificates = await _repo.findAll();
      final customers = await getIt<CustomerService>().getAllCustomers();
      setState(() {
        _certificates = certificates;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('شهادات الإشراف'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddCertificateDialog(),
        icon: const Icon(Icons.add),
        label: const Text('شهادة جديدة'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
              : _certificates.isEmpty
                  ? _buildEmptyState()
                  : _buildCertificatesList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.verified, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'لا توجد شهادات إشراف',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            'اضغط على زر الإضافة لإنشاء شهادة جديدة',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificatesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _certificates.length,
      itemBuilder: (context, index) {
        final certificate = _certificates[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.verified, color: Colors.blue),
            ),
            title: Text(_getCustomerName(certificate.customerId)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (certificate.engineerName != null)
                  Text('المهندس: ${certificate.engineerName}'),
                if (certificate.certificateDate != null)
                  Text(
                    'التاريخ: ${_formatDate(certificate.certificateDate!)}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _showEditCertificateDialog(certificate),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteCertificate(certificate),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddCertificateDialog() {
    Customer? selectedCustomer;
    final engineerController = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('شهادة إشراف جديدة'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<Customer>(
                  decoration: const InputDecoration(
                    labelText: 'العميل',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedCustomer,
                  items: _customers.map((c) {
                    return DropdownMenuItem(
                      value: c,
                      child: Text(c.customerName),
                    );
                  }).toList(),
                  onChanged: (c) => setDialogState(() => selectedCustomer = c),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: engineerController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المهندس',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(selectedDate != null
                      ? _formatDate(selectedDate!)
                      : 'اختر تاريخ الشهادة'),
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
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: selectedCustomer == null
                  ? null
                  : () async {
                      Navigator.pop(ctx);
                      await _repo.insert(SupervisionCertificate(
                        id: 0,
                        customerId: selectedCustomer!.id,
                        engineerName: engineerController.text.isEmpty
                            ? null
                            : engineerController.text,
                        certificateDate: selectedDate,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      ));
                      await _loadData();
                    },
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditCertificateDialog(SupervisionCertificate certificate) {
    final engineerController = TextEditingController(text: certificate.engineerName);
    DateTime? selectedDate = certificate.certificateDate;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('تعديل شهادة الإشراف'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: engineerController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المهندس',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(selectedDate != null
                      ? _formatDate(selectedDate!)
                      : 'اختر تاريخ الشهادة'),
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
              ],
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
                await _repo.update(certificate.id, certificate.copyWith(
                  engineerName: engineerController.text.isEmpty
                      ? null
                      : engineerController.text,
                  certificateDate: selectedDate,
                ));
                await _loadData();
              },
              child: const Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteCertificate(SupervisionCertificate certificate) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد من حذف هذه الشهادة؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _repo.delete(certificate.id);
      await _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم الحذف'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
