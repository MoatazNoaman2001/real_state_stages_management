import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert';

import '../../../theme/theme_cubit.dart';
import '../../../core/di/service_locator.dart';
import '../../../domain/services/notification_service.dart';
import '../../widgets/common/app_text_field.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Notification settings
  bool _alertsEnabled = true;
  bool _windowsNotificationsEnabled = true;
  TimeOfDay _dailyReminderTime = const TimeOfDay(hour: 9, minute: 0);
  int _stuckAlertDays = 7;

  // User profile
  final _companyNameController = TextEditingController(text: 'شركة إدارة العقارات');
  final _userNameController = TextEditingController(text: 'المستخدم');
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _userNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Settings
            _buildSectionTitle('المظهر', Icons.palette),
            _buildThemeCard(),
            const SizedBox(height: 24),

            // Notification Settings
            _buildSectionTitle('التنبيهات', Icons.notifications),
            _buildNotificationsCard(),
            const SizedBox(height: 24),

            // User Profile
            _buildSectionTitle('الملف الشخصي', Icons.person),
            _buildProfileCard(),
            const SizedBox(height: 24),

            // Backup & Restore
            _buildSectionTitle('النسخ الاحتياطي', Icons.backup),
            _buildBackupCard(),
            const SizedBox(height: 24),

            // About
            _buildSectionTitle('حول التطبيق', Icons.info),
            _buildAboutCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    state.themeMode == ThemeMode.dark
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: Colors.blue,
                  ),
                  title: const Text('الوضع الداكن'),
                  subtitle: Text(
                    state.themeMode == ThemeMode.dark
                        ? 'مفعل'
                        : 'غير مفعل',
                  ),
                  trailing: Switch(
                    value: state.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.brightness_auto, color: Colors.blue),
                  title: const Text('استخدام إعدادات النظام'),
                  subtitle: const Text('تبديل تلقائي حسب إعدادات الجهاز'),
                  trailing: Switch(
                    value: state.themeMode == ThemeMode.system,
                    onChanged: (value) {
                      if (value) {
                        context.read<ThemeCubit>().setSystemTheme();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotificationsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Enable/Disable alerts
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.notifications_active, color: Colors.blue),
              title: const Text('تفعيل التنبيهات'),
              subtitle: const Text('إظهار التنبيهات داخل التطبيق'),
              value: _alertsEnabled,
              onChanged: (value) {
                setState(() => _alertsEnabled = value);
              },
            ),
            const Divider(),

            // Windows notifications
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.computer, color: Colors.blue),
              title: const Text('إشعارات Windows'),
              subtitle: const Text('إظهار إشعارات حتى لو التطبيق مغلق'),
              value: _windowsNotificationsEnabled,
              onChanged: _alertsEnabled
                  ? (value) {
                      setState(() => _windowsNotificationsEnabled = value);
                    }
                  : null,
            ),
            const Divider(),

            // Daily reminder time
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time, color: Colors.blue),
              title: const Text('وقت التذكير اليومي'),
              subtitle: Text(
                '${_dailyReminderTime.hour.toString().padLeft(2, '0')}:${_dailyReminderTime.minute.toString().padLeft(2, '0')}',
              ),
              trailing: TextButton(
                onPressed: _alertsEnabled ? _pickReminderTime : null,
                child: const Text('تغيير'),
              ),
            ),
            const Divider(),

            // Stuck alert days
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.warning_amber, color: Colors.orange),
              title: const Text('تنبيه التأخير'),
              subtitle: Text('تنبيه إذا توقفت القطعة $_stuckAlertDays أيام'),
              trailing: DropdownButton<int>(
                value: _stuckAlertDays,
                items: [3, 5, 7, 14, 30].map((days) {
                  return DropdownMenuItem(
                    value: days,
                    child: Text('$days أيام'),
                  );
                }).toList(),
                onChanged: _alertsEnabled
                    ? (value) {
                        if (value != null) {
                          setState(() => _stuckAlertDays = value);
                        }
                      }
                    : null,
              ),
            ),
            const Divider(),

            // Test notification button
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.notifications_none, color: Colors.green),
              title: const Text('اختبار الإشعارات'),
              subtitle: const Text('إرسال إشعار تجريبي للتأكد من عمل النظام'),
              trailing: ElevatedButton.icon(
                onPressed: _alertsEnabled && _windowsNotificationsEnabled
                    ? _sendTestNotification
                    : null,
                icon: const Icon(Icons.send, size: 18),
                label: const Text('إرسال'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendTestNotification() async {
    try {
      final notificationService = getIt<NotificationService>();

      // Check if service is initialized
      if (!notificationService.isInitialized) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('⚠ نظام الإشعارات غير مفعل. يرجى إعادة تشغيل التطبيق.'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 4),
            ),
          );
        }
        return;
      }

      await notificationService.showNotification(
        id: 999999, // Special ID for test notifications
        title: 'إشعار تجريبي',
        body: 'تم إرسال الإشعار بنجاح! النظام يعمل بشكل صحيح ✓',
        payload: 'test_notification',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✓ تم إرسال الإشعار التجريبي بنجاح'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في إرسال الإشعار: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  Future<void> _pickReminderTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _dailyReminderTime,
    );
    if (picked != null) {
      setState(() => _dailyReminderTime = picked);
    }
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // // Profile Header with Avatar
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.all(24),
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Colors.blue.shade600,
          //         Colors.blue.shade400,
          //       ],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          //     borderRadius: const BorderRadius.only(
          //       topLeft: Radius.circular(16),
          //       topRight: Radius.circular(16),
          //     ),
          //   ),
          //   child: Column(
          //     children: [
          //       // Avatar
          //       Container(
          //         width: 80,
          //         height: 80,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //           border: Border.all(color: Colors.white, width: 3),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black.withOpacity(0.2),
          //               blurRadius: 10,
          //               offset: const Offset(0, 4),
          //             ),
          //           ],
          //         ),
          //         child: const Icon(
          //           Icons.person,
          //           size: 45,
          //           color: Colors.blue,
          //         ),
          //       ),
          //       const SizedBox(height: 12),
          //       // User name display
          //       Text(
          //         _userNameController.text.isNotEmpty
          //             ? _userNameController.text
          //             : 'المستخدم',
          //         style: const TextStyle(
          //           color: Colors.white,
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       const SizedBox(height: 4),
          //       // Company name display
          //       Text(
          //         _companyNameController.text.isNotEmpty
          //             ? _companyNameController.text
          //             : 'شركة إدارة العقارات',
          //         style: TextStyle(
          //           color: Colors.white.withOpacity(0.9),
          //           fontSize: 14,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Form Fields
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Company name
                AppTextField(
                  controller: _companyNameController,
                  label: 'اسم الشركة',
                  hint: 'أدخل اسم الشركة',
                  prefixIcon: Icons.business_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 20),

                // User name
                AppTextField(
                  controller: _userNameController,
                  label: 'اسم المستخدم',
                  hint: 'أدخل اسم المستخدم',
                  prefixIcon: Icons.person_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 20),

                // Phone
                AppTextField(
                  controller: _phoneController,
                  label: 'رقم الهاتف',
                  hint: 'أدخل رقم الهاتف',
                  prefixIcon: Icons.phone_rounded,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24),

                // Save button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _saveProfile,
                    icon: const Icon(Icons.save_rounded, size: 20),
                    label: const Text(
                      'حفظ التغييرات',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ البيانات بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildBackupCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Export backup
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.upload, color: Colors.green),
              title: const Text('تصدير نسخة احتياطية'),
              subtitle: const Text('حفظ جميع البيانات في ملف'),
              trailing: ElevatedButton.icon(
                onPressed: _exportBackup,
                icon: const Icon(Icons.download, size: 18),
                label: const Text('تصدير'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const Divider(),

            // Import backup
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.download, color: Colors.orange),
              title: const Text('استعادة نسخة احتياطية'),
              subtitle: const Text('استيراد البيانات من ملف سابق'),
              trailing: ElevatedButton.icon(
                onPressed: _importBackup,
                icon: const Icon(Icons.upload, size: 18),
                label: const Text('استعادة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const Divider(),

            // Last backup info
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.history, color: Colors.blue),
              title: const Text('آخر نسخة احتياطية'),
              subtitle: const Text('لم يتم إنشاء نسخة احتياطية بعد'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportBackup() async {
    try {
      final result = await FilePicker.platform.saveFile(
        dialogTitle: 'حفظ النسخة الاحتياطية',
        fileName: 'backup_${DateTime.now().toIso8601String().split('T')[0]}.json',
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        // TODO: Get actual data from database
        final backupData = {
          'version': '1.0',
          'date': DateTime.now().toIso8601String(),
          'customers': [],
          'licenses': [],
          'execution_stages': [],
        };

        final file = File(result);
        await file.writeAsString(jsonEncode(backupData));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم تصدير النسخة الاحتياطية بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في التصدير: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _importBackup() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        dialogTitle: 'اختر ملف النسخة الاحتياطية',
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null && result.files.single.path != null) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('تأكيد الاستعادة'),
            content: const Text(
              'سيتم استبدال جميع البيانات الحالية بالنسخة الاحتياطية. هل أنت متأكد؟',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('استعادة'),
              ),
            ],
          ),
        );

        if (confirmed == true) {
          final file = File(result.files.single.path!);
          final content = await file.readAsString();
          final data = jsonDecode(content);

          // TODO: Restore data to database

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم استعادة النسخة الاحتياطية بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في الاستعادة: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildAboutCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.apartment, color: Colors.white),
              ),
              title: const Text('نظام إدارة المشاريع العقارية'),
              subtitle: const Text('الإصدار 1.0.0'),
            ),
            const Divider(),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.code, color: Colors.blue),
              title: Text('تطوير'),
              subtitle: Text('Flutter Desktop Application'),
            ),
          ],
        ),
      ),
    );
  }
}
