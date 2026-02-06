import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state_management_stages/core/di/service_locator.dart';
import 'package:real_state_management_stages/domain/services/customer_service.dart';
import 'package:real_state_management_stages/presentation/blocs/blocs.dart';
import '../core/theme/app_colors.dart';
import 'widgets/layout/app_sidebar.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/customers/customers_screen.dart';
import 'screens/execution_stage/execution_stage_screen.dart';
import 'screens/license/license_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/excavation_permit/excavation_permit_screen.dart';
import 'screens/architectural_modification/architectural_modification_screen.dart';
import 'screens/utility_meter/utility_meter_screen.dart';
import 'screens/road_work/road_work_screen.dart';
import 'screens/rooftop_addition/rooftop_addition_screen.dart';
import 'screens/inspection/inspection_screen.dart';
import 'screens/supervision_certificate/supervision_certificate_screen.dart';
import 'screens/alerts/alerts_list_screen.dart';

/// Main navigation items
final List<NavItem> mainNavItems = [
  const NavItem(
    id: 'dashboard',
    label: 'الرئيسية',
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard,
  ),
  const NavItem(
    id: 'customers',
    label: 'العملاء',
    icon: Icons.people_outline,
    activeIcon: Icons.people,
  ),
  const NavItem(
    id: 'licenses',
    label: 'التراخيص',
    icon: Icons.description_outlined,
    activeIcon: Icons.description,
  ),
  const NavItem(
    id: 'excavation',
    label: 'إذن الحفر',
    icon: Icons.construction_outlined,
    activeIcon: Icons.construction,
  ),
  const NavItem(
    id: 'execution',
    label: 'مراحل التنفيذ',
    icon: Icons.engineering_outlined,
    activeIcon: Icons.engineering,
  ),
  const NavItem(
    id: 'modifications',
    label: 'التعديلات المعمارية',
    icon: Icons.architecture_outlined,
    activeIcon: Icons.architecture,
  ),
  const NavItem(
    id: 'meters',
    label: 'العدادات',
    icon: Icons.electric_meter_outlined,
    activeIcon: Icons.electric_meter,
  ),
  const NavItem(
    id: 'roadwork',
    label: 'إشغال الطريق',
    icon: Icons.add_road_outlined,
    activeIcon: Icons.add_road,
  ),
  const NavItem(
    id: 'rooftop',
    label: 'إضافة الأسطح',
    icon: Icons.roofing_outlined,
    activeIcon: Icons.roofing,
  ),
  const NavItem(
    id: 'inspections',
    label: 'المعاينات',
    icon: Icons.assignment_outlined,
    activeIcon: Icons.assignment,
  ),
  const NavItem(
    id: 'supervision',
    label: 'شهادات الإشراف',
    icon: Icons.verified_outlined,
    activeIcon: Icons.verified,
  ),
  const NavItem(
    id: 'alerts',
    label: 'التنبيهات',
    icon: Icons.notifications_outlined,
    activeIcon: Icons.notifications,
    // badge: '3',
  ),
  const NavItem(
    id: 'settings',
    label: 'الإعدادات',
    icon: Icons.settings_outlined,
    activeIcon: Icons.settings,
  ),
];

/// Global key for accessing AppShell state
final GlobalKey<AppShellState> appShellKey = GlobalKey<AppShellState>();

/// Main application shell with navigation
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => AppShellState();
}

class AppShellState extends State<AppShell> {
  String _selectedNavId = 'dashboard';
  bool _isSidebarCollapsed = false;

  // Parameters to pass to screens
  int? _selectedCustomerId;

  /// Navigate to a specific screen with optional customer ID
  void navigateTo(String navId, {int? customerId}) {
    setState(() {
      _selectedNavId = navId;
      _selectedCustomerId = customerId;
    });
  }

  /// Get selected customer ID (clears after reading)
  int? consumeSelectedCustomerId() {
    final id = _selectedCustomerId;
    _selectedCustomerId = null;
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AppSidebar(
            items: mainNavItems,
            selectedId: _selectedNavId,
            onItemSelected: _onNavItemSelected,
            isCollapsed: _isSidebarCollapsed,
            onToggleCollapse: () {
              setState(() => _isSidebarCollapsed = !_isSidebarCollapsed);
            },
            title: 'إدارة المشاريع',
          ),

          MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => CustomerBloc(getIt<CustomerService>()),
                )
              ],
              child:
              // Main content
              Expanded(
                child: Container(
                  color: AppColors.background,
                  child: _buildContent(),
                ),
              ),
          )
        ],
      ),
    );
  }

  void _onNavItemSelected(String id) {
    setState(() => _selectedNavId = id);
  }

  Widget _buildContent() {
    switch (_selectedNavId) {
      case 'dashboard':
        return const DashboardScreen();
      case 'customers':
        return const CustomersScreen();
      case 'licenses':
        return LicenseScreen(initialCustomerId: consumeSelectedCustomerId());
      case 'excavation':
        return ExcavationPermitScreen(initialCustomerId: consumeSelectedCustomerId());
      case 'execution':
        return ExecutionStageScreen(initialCustomerId: consumeSelectedCustomerId());
      case 'modifications':
        return ArchitecturalModificationScreen(initialCustomerId: consumeSelectedCustomerId());
      case 'meters':
        return UtilityMeterScreen(initialCustomerId: consumeSelectedCustomerId());
      case 'roadwork':
        return RoadWorkScreen(initialCustomerId: consumeSelectedCustomerId());
      case 'rooftop':
        return RooftopAdditionScreen(initialCustomerId: consumeSelectedCustomerId());
      case 'inspections':
        return const InspectionScreen();
      case 'supervision':
        return const SupervisionCertificateScreen();
      case 'alerts':
        return const AlertsListScreen();
      case 'settings':
        return const SettingsScreen();
      default:
        return const DashboardScreen();
    }
  }
}
