import 'package:flutter/material.dart';

import 'customer/customer_screen.dart';
import 'license/license_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.dashboard, label: 'الرئيسية'),
    _NavItem(icon: Icons.people, label: 'العملاء'),
    _NavItem(icon: Icons.description, label: 'التراخيص'),
    _NavItem(icon: Icons.construction, label: 'التنفيذ'),
    _NavItem(icon: Icons.assignment, label: 'المعاينات'),
    _NavItem(icon: Icons.notifications, label: 'التنبيهات'),
    _NavItem(icon: Icons.search, label: 'البحث'),
    _NavItem(icon: Icons.settings, label: 'الإعدادات'),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          children: [
            // Navigation Rail
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              extended: false,
              minWidth: 80,
              backgroundColor: Colors.white,
              selectedIconTheme: const IconThemeData(color: Color(0xFF2563EB)),
              selectedLabelTextStyle: const TextStyle(
                color: Color(0xFF2563EB),
                fontWeight: FontWeight.bold,
              ),
              unselectedIconTheme: IconThemeData(color: Colors.grey.shade600),
              indicatorColor: const Color(0xFF2563EB).withOpacity(0.1),
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.apartment,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              destinations: _navItems.map((item) {
                return NavigationRailDestination(
                  icon: Icon(item.icon),
                  selectedIcon: Icon(item.icon),
                  label: Text(item.label),
                );
              }).toList(),
            ),

            // Divider
            const VerticalDivider(width: 1, thickness: 1),

            // Content area
            Expanded(
              child: Container(
                color: const Color(0xFFF9FAFB),
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboard();
      case 1:
        return const CustomerScreen();
      case 2:
        return const LicenseScreen();
      case 3:
        return _buildComingSoon('التنفيذ');
      case 4:
        return _buildComingSoon('المعاينات');
      case 5:
        return _buildComingSoon('التنبيهات');
      case 6:
        return _buildComingSoon('البحث');
      case 7:
        return _buildComingSoon('الإعدادات');
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'لوحة التحكم',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Stats cards
          Row(
            children: [
              _buildStatCard(
                'إجمالي العملاء',
                '0',
                Icons.people,
                Colors.blue,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'التراخيص النشطة',
                '0',
                Icons.description,
                Colors.green,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'قيد التنفيذ',
                '0',
                Icons.construction,
                Colors.orange,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'التنبيهات',
                '0',
                Icons.notifications,
                Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Quick actions
          const Text(
            'إجراءات سريعة',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildActionCard(
                'إضافة عميل',
                Icons.person_add,
                () => setState(() => _selectedIndex = 1),
              ),
              const SizedBox(width: 16),
              _buildActionCard(
                'ترخيص جديد',
                Icons.add_circle,
                () => setState(() => _selectedIndex = 2),
              ),
              const SizedBox(width: 16),
              _buildActionCard(
                'جدولة معاينة',
                Icons.calendar_today,
                () => setState(() => _selectedIndex = 4),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF2563EB)),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2563EB),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComingSoon(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'قريباً...',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  _NavItem({required this.icon, required this.label});
}
