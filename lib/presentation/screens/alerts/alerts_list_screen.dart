import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../domain/models/scheduled_alert.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/notification_service.dart';
import '../../../domain/services/customer_service.dart';
import '../../widgets/common/app_card.dart';
import 'package:intl/intl.dart';

class AlertsListScreen extends StatefulWidget {
  const AlertsListScreen({super.key});

  @override
  State<AlertsListScreen> createState() => _AlertsListScreenState();
}

class _AlertsListScreenState extends State<AlertsListScreen> {
  final _notificationService = getIt<NotificationService>();
  List<ScheduledAlert> _upcomingAlerts = [];
  List<ScheduledAlert> _todayAlerts = [];
  bool _isLoading = true;
  String _lastCheckStatus = '';

  @override
  void initState() {
    super.initState();
    _loadAlerts();
  }

  Future<void> _loadAlerts() async {
    setState(() => _isLoading = true);
    try {
      final upcoming = await _notificationService.getUpcomingAlerts(days: 7);
      final today = await _notificationService.getTodayAlerts();

      setState(() {
        _upcomingAlerts = upcoming;
        _todayAlerts = today;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التنبيهات والإشعارات'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: _showCreateAlertDialog,
            tooltip: 'إضافة تنبيه',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadAlerts,
            tooltip: 'تحديث',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Today's Alerts
                  _buildSectionTitle(
                    'تنبيهات اليوم',
                    Icons.today,
                    _todayAlerts.length,
                    Colors.red,
                  ),
                  const SizedBox(height: 12),
                  if (_todayAlerts.isEmpty)
                    _buildEmptyState('لا توجد تنبيهات لهذا اليوم', Icons.check_circle)
                  else
                    ..._todayAlerts.map((alert) => _buildAlertCard(alert, isToday: true)),
                  const SizedBox(height: 24),

                  // Upcoming Alerts
                  _buildSectionTitle(
                    'التنبيهات القادمة (7 أيام)',
                    Icons.calendar_today,
                    _upcomingAlerts.length,
                    Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  if (_upcomingAlerts.isEmpty)
                    _buildEmptyState('لا توجد تنبيهات قادمة', Icons.notifications_none)
                  else
                    ..._upcomingAlerts.map((alert) => _buildAlertCard(alert)),
                ],
              ),
            ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon, int count, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        if (count > 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEmptyState(String message, IconData icon) {
    return AppSectionCard(
      title: message,
      icon: icon,
      child: const SizedBox(height: 20),
    );
  }

  Widget _buildAlertCard(ScheduledAlert alert, {bool isToday = false}) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final daysUntil = alert.alertDate.difference(DateTime.now()).inDays;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isToday ? 4 : 2,
      color: isToday ? Colors.red.shade50 : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isToday ? Colors.red : Colors.orange,
          child: Icon(
            isToday ? Icons.warning : Icons.notifications,
            color: Colors.white,
          ),
        ),
        title: Text(
          alert.title,
          style: TextStyle(
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (alert.message != null && alert.message!.isNotEmpty)
              Text(alert.message!),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  dateFormat.format(alert.alertDate),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                if (!isToday && daysUntil >= 0) ...[
                  const SizedBox(width: 8),
                  Text(
                    'بعد $daysUntil يوم',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Repeat type indicator
            if (alert.repeatType != RepeatType.once)
              Icon(
                Icons.repeat,
                color: Colors.blue,
                size: 20,
              ),
            const SizedBox(width: 8),
            // Active indicator
            if (alert.isActive)
              Icon(
                Icons.notifications_active,
                color: isToday ? Colors.red : Colors.green,
                size: 20,
              )
            else
              Icon(
                Icons.notifications_off,
                color: Colors.grey,
                size: 20,
              ),
            const SizedBox(width: 8),
            // Delete button
            IconButton(
              icon: const Icon(Icons.delete, size: 20),
              color: Colors.red,
              onPressed: () => _deleteAlert(alert),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteAlert(ScheduledAlert alert) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف التنبيه'),
        content: Text('هل تريد حذف التنبيه "${alert.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _notificationService.deleteAlert(alert.id);
        _loadAlerts();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم حذف التنبيه بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('خطأ في حذف التنبيه: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _showCreateAlertDialog() async {
    final customerService = getIt<CustomerService>();
    final customers = await customerService.getAllCustomers();

    if (!mounted) return;

    if (customers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يوجد عملاء. يرجى إضافة عميل أولاً'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    Customer? selectedCustomer;
    final titleController = TextEditingController();
    final messageController = TextEditingController();
    DateTime? selectedDate;
    TimeOfDay? selectedTime;
    RepeatType repeatType = RepeatType.once;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.add_alert, color: Colors.blue),
              SizedBox(width: 8),
              Text('إنشاء تنبيه جديد'),
            ],
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customer Dropdown
                  DropdownButtonFormField<Customer>(
                    initialValue: selectedCustomer,
                    decoration: const InputDecoration(
                      labelText: 'العميل *',
                      border: OutlineInputBorder(),
                    ),
                    items: customers.map((customer) {
                      return DropdownMenuItem(
                        value: customer,
                        child: Text('${customer.customerName} - قطعة ${customer.plotNumber}'),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => selectedCustomer = value),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'عنوان التنبيه *',
                      border: OutlineInputBorder(),
                      hintText: 'مثال: موعد معاينة، تجديد ترخيص',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Message
                  TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      labelText: 'رسالة التنبيه (اختياري)',
                      border: OutlineInputBorder(),
                      hintText: 'تفاصيل إضافية',
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Date Picker
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.calendar_today),
                    title: Text(
                      selectedDate == null
                          ? 'اختر التاريخ *'
                          : DateFormat('yyyy-MM-dd').format(selectedDate!),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        setState(() => selectedDate = date);
                      }
                    },
                  ),

                  // Time Picker
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.access_time),
                    title: Text(
                      selectedTime == null
                          ? 'اختر الوقت *'
                          : '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}',
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: selectedTime ?? TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() => selectedTime = time);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Repeat Type
                  const Text(
                    'نوع التكرار',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<RepeatType>(
                    initialValue: repeatType,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: RepeatType.once,
                        child: Text('مرة واحدة'),
                      ),
                      DropdownMenuItem(
                        value: RepeatType.daily,
                        child: Text('يومي'),
                      ),
                      DropdownMenuItem(
                        value: RepeatType.weekly,
                        child: Text('أسبوعي'),
                      ),
                      DropdownMenuItem(
                        value: RepeatType.monthly,
                        child: Text('شهري'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => repeatType = value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedCustomer == null ||
                    titleController.text.isEmpty ||
                    selectedDate == null ||
                    selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('يرجى ملء جميع الحقول المطلوبة'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                Navigator.pop(context, true);
              },
              child: const Text('إنشاء'),
            ),
          ],
        ),
      ),
    );

    if (result == true && selectedCustomer != null && selectedDate != null && selectedTime != null) {
      try {
        final alertDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          selectedTime!.hour,
          selectedTime!.minute,
        );

        await _notificationService.createAlert(
          customerId: selectedCustomer!.id,
          title: titleController.text,
          message: messageController.text.isEmpty ? null : messageController.text,
          alertDate: alertDateTime,
          repeatType: repeatType,
        );

        _loadAlerts();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إنشاء التنبيه بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('خطأ في إنشاء التنبيه: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
