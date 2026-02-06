import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/repositories/alert_repository.dart';
import '../../../domain/models/alert.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../widgets/layout/app_layout.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Alert> _alerts = [];
  List<Customer> _customers = [];
  bool _isLoading = true;
  String? _error;
  String _searchQuery = '';
  String? _filterType;

  final _repo = getIt<AlertRepository>();

  // Alert type configurations
  static const Map<String, AlertTypeConfig> _alertTypes = {
    'urgent': AlertTypeConfig(
      label: 'عاجل',
      icon: Icons.priority_high_rounded,
      color: Color(0xFFDC2626),
      bgColor: Color(0xFFFEE2E2),
    ),
    'reminder': AlertTypeConfig(
      label: 'تذكير',
      icon: Icons.alarm_rounded,
      color: Color(0xFFF59E0B),
      bgColor: Color(0xFFFEF3C7),
    ),
    'payment': AlertTypeConfig(
      label: 'سداد',
      icon: Icons.payments_rounded,
      color: Color(0xFF10B981),
      bgColor: Color(0xFFD1FAE5),
    ),
    'deadline': AlertTypeConfig(
      label: 'موعد نهائي',
      icon: Icons.event_busy_rounded,
      color: Color(0xFF8B5CF6),
      bgColor: Color(0xFFEDE9FE),
    ),
    'follow_up': AlertTypeConfig(
      label: 'متابعة',
      icon: Icons.follow_the_signs_rounded,
      color: Color(0xFF3B82F6),
      bgColor: Color(0xFFDBEAFE),
    ),
    'info': AlertTypeConfig(
      label: 'معلومة',
      icon: Icons.info_rounded,
      color: Color(0xFF6B7280),
      bgColor: Color(0xFFF3F4F6),
    ),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final alerts = await _repo.findAll();
      final customers = await getIt<CustomerService>().getAllCustomers();
      setState(() {
        _alerts = alerts;
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

  Customer? _getCustomer(int customerId) {
    return _customers.where((c) => c.id == customerId).firstOrNull;
  }

  List<Alert> _filterAlerts(List<Alert> alerts) {
    var filtered = alerts;

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((a) {
        final customerName = _getCustomerName(a.customerId).toLowerCase();
        final message = (a.message ?? '').toLowerCase();
        return customerName.contains(query) || message.contains(query);
      }).toList();
    }

    if (_filterType != null) {
      filtered = filtered.where((a) => a.alertType == _filterType).toList();
    }

    // Sort by date (most urgent first)
    filtered.sort((a, b) {
      if (a.alertDate == null && b.alertDate == null) return 0;
      if (a.alertDate == null) return 1;
      if (b.alertDate == null) return -1;
      return a.alertDate!.compareTo(b.alertDate!);
    });

    return filtered;
  }

  List<Alert> get _activeAlerts => _filterAlerts(_alerts.where((a) => a.isActive).toList());
  List<Alert> get _overdueAlerts => _filterAlerts(_alerts.where((a) =>
    a.isActive && a.alertDate != null && a.alertDate!.isBefore(DateTime.now())
  ).toList());
  List<Alert> get _dismissedAlerts => _filterAlerts(_alerts.where((a) => !a.isActive).toList());

  int get _todayCount => _alerts.where((a) {
    if (!a.isActive || a.alertDate == null) return false;
    final now = DateTime.now();
    return a.alertDate!.year == now.year &&
           a.alertDate!.month == now.month &&
           a.alertDate!.day == now.day;
  }).length;

  int get _urgentCount => _alerts.where((a) => a.isActive && a.alertType == 'urgent').length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        AppPageHeader(
          title: 'التنبيهات',
          subtitle: '${_alerts.where((a) => a.isActive).length} تنبيه نشط',
          actions: [
            _buildAddButton(),
          ],
        ),

        // Stats Cards
        _buildStatsRow(),

        // Search and Filter Bar
        _buildSearchFilterBar(),

        // Tab Bar
        _buildTabBar(),

        // Content
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? _buildErrorState()
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _buildAlertsList(_activeAlerts, isActive: true),
                        _buildAlertsList(_overdueAlerts, isActive: true, isOverdueTab: true),
                        _buildAlertsList(_dismissedAlerts, isActive: false),
                      ],
                    ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return FilledButton.icon(
      onPressed: _showAddAlertDialog,
      icon: const Icon(Icons.add_alert_rounded, size: 20),
      label: const Text('تنبيه جديد'),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          _buildStatCard(
            'اليوم',
            _todayCount.toString(),
            Icons.today_rounded,
            AppColors.primary,
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            'عاجل',
            _urgentCount.toString(),
            Icons.priority_high_rounded,
            const Color(0xFFDC2626),
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            'متأخر',
            _overdueAlerts.length.toString(),
            Icons.warning_amber_rounded,
            const Color(0xFFF59E0B),
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            'الإجمالي',
            _alerts.where((a) => a.isActive).length.toString(),
            Icons.notifications_rounded,
            const Color(0xFF6B7280),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: color.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchFilterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          // Search
          Expanded(
            flex: 2,
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'بحث في التنبيهات...',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Type Filter
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String?>(
                  value: _filterType,
                  isExpanded: true,
                  hint: const Text('نوع التنبيه'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('الكل')),
                    ..._alertTypes.entries.map((e) => DropdownMenuItem(
                      value: e.key,
                      child: Row(
                        children: [
                          Icon(e.value.icon, color: e.value.color, size: 18),
                          const SizedBox(width: 8),
                          Text(e.value.label),
                        ],
                      ),
                    )),
                  ],
                  onChanged: (value) => setState(() => _filterType = value),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Refresh Button
          IconButton.filled(
            onPressed: _loadData,
            icon: const Icon(Icons.refresh_rounded),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              foregroundColor: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey.shade700,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabs: [
          _buildTab('نشطة', _activeAlerts.length, AppColors.primary),
          _buildTab('متأخرة', _overdueAlerts.length, const Color(0xFFF59E0B)),
          _buildTab('مؤرشفة', _dismissedAlerts.length, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int count, Color badgeColor) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (count > 0) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: badgeColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 12,
                  color: badgeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded, size: 64, color: Colors.red.shade300),
          const SizedBox(height: 16),
          Text(
            'حدث خطأ',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 8),
          Text(
            _error!,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _loadData,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsList(List<Alert> alerts, {required bool isActive, bool isOverdueTab = false}) {
    if (alerts.isEmpty) {
      return _buildEmptyState(isActive, isOverdueTab);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: alerts.length,
      itemBuilder: (context, index) {
        final alert = alerts[index];
        return _buildAlertCard(alert, index);
      },
    );
  }

  Widget _buildEmptyState(bool isActive, bool isOverdueTab) {
    IconData icon;
    String title;
    String subtitle;

    if (isOverdueTab) {
      icon = Icons.check_circle_outline_rounded;
      title = 'لا توجد تنبيهات متأخرة';
      subtitle = 'جميع التنبيهات في موعدها';
    } else if (isActive) {
      icon = Icons.notifications_off_outlined;
      title = 'لا توجد تنبيهات نشطة';
      subtitle = 'أضف تنبيه جديد للبدء';
    } else {
      icon = Icons.archive_outlined;
      title = 'لا توجد تنبيهات مؤرشفة';
      subtitle = 'التنبيهات المكتملة ستظهر هنا';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          if (isActive && !isOverdueTab) ...[
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _showAddAlertDialog,
              icon: const Icon(Icons.add_rounded),
              label: const Text('إضافة تنبيه'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAlertCard(Alert alert, int index) {
    final config = _alertTypes[alert.alertType] ?? _alertTypes['info']!;
    final customer = _getCustomer(alert.customerId);
    final isOverdue = alert.alertDate != null &&
        alert.alertDate!.isBefore(DateTime.now()) &&
        alert.isActive;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 200 + (index * 50)),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isOverdue ? const Color(0xFFFCA5A5) : Colors.grey.shade200,
            width: isOverdue ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: (isOverdue ? Colors.red : Colors.grey).withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isOverdue
                    ? const Color(0xFFFEE2E2)
                    : config.bgColor.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Row(
                children: [
                  // Type Icon
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: config.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(config.icon, color: config.color, size: 24),
                  ),
                  const SizedBox(width: 12),

                  // Customer Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                customer?.customerName ?? 'غير معروف',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: config.color.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                config.label,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: config.color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (customer?.plotNumber != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            'قطعة ${customer!.plotNumber}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Menu
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert_rounded, color: Colors.grey.shade600),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onSelected: (value) => _handleAlertAction(alert, value),
                    itemBuilder: (context) => [
                      if (alert.isActive)
                        _buildMenuItem('dismiss', Icons.check_circle_outline_rounded, 'إكمال', Colors.green)
                      else
                        _buildMenuItem('activate', Icons.replay_rounded, 'تفعيل', Colors.blue),
                      _buildMenuItem('edit', Icons.edit_outlined, 'تعديل', Colors.grey.shade700),
                      _buildMenuItem('delete', Icons.delete_outline_rounded, 'حذف', Colors.red),
                    ],
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (alert.message != null && alert.message!.isNotEmpty) ...[
                    Text(
                      alert.message!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Date and Status Row
                  Row(
                    children: [
                      if (alert.alertDate != null) ...[
                        Icon(
                          Icons.schedule_rounded,
                          size: 16,
                          color: isOverdue ? Colors.red : Colors.grey.shade500,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _formatRelativeDate(alert.alertDate!),
                          style: TextStyle(
                            fontSize: 13,
                            color: isOverdue ? Colors.red : Colors.grey.shade600,
                            fontWeight: isOverdue ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                        if (isOverdue) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'متأخر',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                      const Spacer(),
                      Text(
                        _formatDate(alert.createdAt),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Actions
            if (alert.isActive)
              Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _handleAlertAction(alert, 'dismiss'),
                        icon: const Icon(Icons.check_rounded, size: 18),
                        label: const Text('تم'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side: const BorderSide(color: Colors.green),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showSnoozeDialog(alert),
                        icon: const Icon(Icons.snooze_rounded, size: 18),
                        label: const Text('تأجيل'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.orange,
                          side: const BorderSide(color: Colors.orange),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String value, IconData icon, String label, Color color) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }

  String _formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final alertDay = DateTime(date.year, date.month, date.day);
    final difference = alertDay.difference(today).inDays;

    if (difference == 0) {
      return 'اليوم';
    } else if (difference == 1) {
      return 'غداً';
    } else if (difference == -1) {
      return 'أمس';
    } else if (difference > 1 && difference <= 7) {
      return 'بعد $difference أيام';
    } else if (difference < -1 && difference >= -7) {
      return 'منذ ${-difference} أيام';
    } else {
      return _formatDate(date);
    }
  }

  Future<void> _handleAlertAction(Alert alert, String action) async {
    try {
      switch (action) {
        case 'dismiss':
          await _repo.updateStatus(alert.id, false);
          break;
        case 'activate':
          await _repo.updateStatus(alert.id, true);
          break;
        case 'delete':
          final confirm = await _showDeleteConfirmDialog();
          if (confirm != true) return;
          await _repo.delete(alert.id);
          break;
        case 'edit':
          _showEditAlertDialog(alert);
          return;
      }
      await _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('تم التحديث بنجاح'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<bool?> _showDeleteConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.delete_outline_rounded, color: Colors.red.shade700),
            ),
            const SizedBox(width: 12),
            const Text('تأكيد الحذف'),
          ],
        ),
        content: const Text('هل أنت متأكد من حذف هذا التنبيه؟\nلا يمكن التراجع عن هذا الإجراء.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  void _showSnoozeDialog(Alert alert) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.snooze_rounded, color: Colors.orange.shade700),
                ),
                const SizedBox(width: 12),
                const Text(
                  'تأجيل التنبيه',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildSnoozeOption(
                  icon: Icons.hourglass_bottom_rounded,
                  label: 'ساعة',
                  onTap: () {
                    Navigator.pop(ctx);
                    _snoozeAlert(alert, const Duration(hours: 1));
                  },
                ),
                _buildSnoozeOption(
                  icon: Icons.wb_twilight_rounded,
                  label: '3 ساعات',
                  onTap: () {
                    Navigator.pop(ctx);
                    _snoozeAlert(alert, const Duration(hours: 3));
                  },
                ),
                _buildSnoozeOption(
                  icon: Icons.today_rounded,
                  label: 'غداً',
                  onTap: () {
                    Navigator.pop(ctx);
                    _snoozeAlert(alert, const Duration(days: 1));
                  },
                ),
                _buildSnoozeOption(
                  icon: Icons.date_range_rounded,
                  label: 'أسبوع',
                  onTap: () {
                    Navigator.pop(ctx);
                    _snoozeAlert(alert, const Duration(days: 7));
                  },
                ),
                _buildSnoozeOption(
                  icon: Icons.calendar_month_rounded,
                  label: 'شهر',
                  onTap: () {
                    Navigator.pop(ctx);
                    _snoozeAlert(alert, const Duration(days: 30));
                  },
                ),
                _buildSnoozeOption(
                  icon: Icons.edit_calendar_rounded,
                  label: 'تاريخ محدد',
                  onTap: () async {
                    Navigator.pop(ctx);
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      await _repo.updateAlertDate(alert.id, date);
                      await _loadData();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSnoozeOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.orange.shade700, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _snoozeAlert(Alert alert, Duration duration) async {
    final newDate = DateTime.now().add(duration);
    await _repo.updateAlertDate(alert.id, newDate);
    await _loadData();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم تأجيل التنبيه إلى ${_formatRelativeDate(newDate)}'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  void _showAddAlertDialog() {
    Customer? selectedCustomer;
    final messageController = TextEditingController();
    DateTime? selectedDate;
    String alertType = 'reminder';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.add_alert_rounded, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              const Text('تنبيه جديد'),
            ],
          ),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Customer Dropdown
                  DropdownButtonFormField<Customer>(
                    decoration: InputDecoration(
                      labelText: 'العميل',
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
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

                  // Alert Type
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('نوع التنبيه', style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _alertTypes.entries.map((e) {
                      final isSelected = alertType == e.key;
                      return InkWell(
                        onTap: () => setDialogState(() => alertType = e.key),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? e.value.color : e.value.bgColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected ? e.value.color : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                e.value.icon,
                                size: 18,
                                color: isSelected ? Colors.white : e.value.color,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                e.value.label,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : e.value.color,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Message
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      labelText: 'الرسالة',
                      hintText: 'اكتب رسالة التنبيه...',
                      prefixIcon: const Icon(Icons.message_outlined),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Date Picker
                  InkWell(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                      if (date != null) {
                        setDialogState(() => selectedDate = date);
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_rounded, color: Colors.grey.shade600),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              selectedDate != null
                                  ? _formatDate(selectedDate!)
                                  : 'اختر موعد التنبيه',
                              style: TextStyle(
                                color: selectedDate != null ? Colors.black : Colors.grey.shade600,
                              ),
                            ),
                          ),
                          if (selectedDate != null)
                            IconButton(
                              icon: const Icon(Icons.clear_rounded, size: 20),
                              onPressed: () => setDialogState(() => selectedDate = null),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: selectedCustomer == null
                  ? null
                  : () async {
                      Navigator.pop(ctx);
                      await _repo.insert(Alert(
                        id: 0,
                        customerId: selectedCustomer!.id,
                        alertType: alertType,
                        message: messageController.text.isEmpty ? null : messageController.text,
                        alertDate: selectedDate,
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

  void _showEditAlertDialog(Alert alert) {
    final messageController = TextEditingController(text: alert.message);
    DateTime? selectedDate = alert.alertDate;
    String alertType = alert.alertType ?? 'reminder';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.edit_rounded, color: Colors.blue.shade700),
              ),
              const SizedBox(width: 12),
              const Text('تعديل التنبيه'),
            ],
          ),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Alert Type
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('نوع التنبيه', style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _alertTypes.entries.map((e) {
                      final isSelected = alertType == e.key;
                      return InkWell(
                        onTap: () => setDialogState(() => alertType = e.key),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? e.value.color : e.value.bgColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected ? e.value.color : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                e.value.icon,
                                size: 18,
                                color: isSelected ? Colors.white : e.value.color,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                e.value.label,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : e.value.color,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Message
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      labelText: 'الرسالة',
                      hintText: 'اكتب رسالة التنبيه...',
                      prefixIcon: const Icon(Icons.message_outlined),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Date Picker
                  InkWell(
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
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_rounded, color: Colors.grey.shade600),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              selectedDate != null
                                  ? _formatDate(selectedDate!)
                                  : 'اختر موعد التنبيه',
                              style: TextStyle(
                                color: selectedDate != null ? Colors.black : Colors.grey.shade600,
                              ),
                            ),
                          ),
                          if (selectedDate != null)
                            IconButton(
                              icon: const Icon(Icons.clear_rounded, size: 20),
                              onPressed: () => setDialogState(() => selectedDate = null),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () async {
                Navigator.pop(ctx);
                await _repo.update(alert.id, alert.copyWith(
                  alertType: alertType,
                  message: messageController.text.isEmpty ? null : messageController.text,
                  alertDate: selectedDate,
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class AlertTypeConfig {
  final String label;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const AlertTypeConfig({
    required this.label,
    required this.icon,
    required this.color,
    required this.bgColor,
  });
}
