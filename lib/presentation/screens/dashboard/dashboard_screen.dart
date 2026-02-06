import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../../data/repositories/license_repository.dart';
import '../../../data/repositories/excavation_permit_repository.dart';
import '../../../data/repositories/execution_stage_repository.dart';
import '../../../data/repositories/architectural_modification_repository.dart';
import '../../../data/repositories/utility_meter_repository.dart';
import '../../../data/repositories/road_work_repository.dart';
import '../../../data/repositories/rooftop_addition_repository.dart';
import '../../widgets/layout/app_layout.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';
import '../../blocs/customer/customer_bloc.dart';
import '../customer/customer_form_dialog.dart';
import '../customer/customer_stages_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Customer> _recentCustomers = [];
  Map<int, Map<String, double>> _customerStages = {};
  int _totalCustomers = 0;
  int _inLicenseStage = 0;
  int _inExcavationStage = 0;
  int _inExecutionStage = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final customerService = getIt<CustomerService>();
      final customers = await customerService.getAllCustomers();

      // Load stages for recent customers
      final recentCustomers = customers.take(5).toList();
      final stagesData = <int, Map<String, double>>{};

      for (final customer in recentCustomers) {
        stagesData[customer.id] = await _loadCustomerStages(customer.id);
      }

      setState(() {
        _recentCustomers = recentCustomers;
        _customerStages = stagesData;
        _totalCustomers = customers.length;
        _inLicenseStage = customers.where((c) =>
          c.currentStage?.contains('التراخيص') ?? false
        ).length;
        _inExcavationStage = customers.where((c) =>
          c.currentStage?.contains('تصريح الحفر') ?? false
        ).length;
        _inExecutionStage = customers.where((c) =>
          c.currentStage?.contains('التنفيذ') ?? false
        ).length;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<Map<String, double>> _loadCustomerStages(int customerId) async {
    final stages = <String, double>{};

    try {
      // License
      final license = await getIt<LicenseRepository>().findByCustomerId(customerId);
      if (license != null) {
        stages['license'] = license.progress;
      }

      // Excavation
      final excavation = await getIt<ExcavationPermitRepository>().findByCustomerId(customerId);
      if (excavation != null) {
        stages['excavation'] = excavation.progress;
      }

      // Execution
      final execution = await getIt<ExecutionStageRepository>().findByCustomerId(customerId);
      if (execution != null) {
        stages['execution'] = execution.progress;
      }

      // Architectural
      final architectural = await getIt<ArchitecturalModificationRepository>().findByCustomerId(customerId);
      if (architectural != null) {
        stages['architectural'] = architectural.progress;
      }

      // Utility Meter
      final meter = await getIt<UtilityMeterRepository>().findByCustomerId(customerId);
      if (meter != null) {
        stages['meter'] = meter.progress;
      }

      // Road Work
      final roadWork = await getIt<RoadWorkRepository>().findByCustomerId(customerId);
      if (roadWork != null) {
        stages['roadwork'] = roadWork.progress;
      }

      // Rooftop
      final rooftop = await getIt<RooftopAdditionRepository>().findByCustomerId(customerId);
      if (rooftop != null) {
        stages['rooftop'] = rooftop.progress;
      }
    } catch (e) {
      // Ignore errors for individual stages
    }

    return stages;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppPageHeader(
          title: 'الرئيسية',
          subtitle: 'إدارة المشاريع العقارية',
        ),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildNewProjectSection(),
                          const SizedBox(height: 20),
                          _buildStatsRow(),
                          const SizedBox(height: 20),
                          _buildRecentCustomersCard(),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildNewProjectSection() {
    return AppSectionCard(
      title: 'بدء مشروع جديد',
      icon: Icons.add_business,
      actions: [
        AppButton(
          text: 'إضافة عميل',
          icon: Icons.add,
          onPressed: _showAddCustomerDialog,
        ),
      ],
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.apartment_outlined,
              color: Colors.blue,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'أضف عميلًا جديدًا وابدأ متابعة مراحل المشروع بسهولة.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        SizedBox(
          width: 270,
          child: AppStatsCard(
            title: 'إجمالي العملاء',
            value: '$_totalCustomers',
            icon: Icons.people,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          width: 270,
          child: AppStatsCard(
            title: 'مرحلة التراخيص',
            value: '$_inLicenseStage',
            icon: Icons.description,
            color: Colors.orange,
          ),
        ),
        SizedBox(
          width: 270,
          child: AppStatsCard(
            title: 'مرحلة الحفر',
            value: '$_inExcavationStage',
            icon: Icons.construction,
            color: Colors.green,
          ),
        ),
        SizedBox(
          width: 270,
          child: AppStatsCard(
            title: 'مرحلة التنفيذ',
            value: '$_inExecutionStage',
            icon: Icons.engineering,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentCustomersCard() {
    return AppSectionCard(
      title: 'آخر العملاء',
      icon: Icons.people_outline,
      actions: [
        AppButton(
          text: 'إضافة عميل',
          icon: Icons.add,
          variant: AppButtonVariant.ghost,
          onPressed: _showAddCustomerDialog,
        ),
      ],
      child: _recentCustomers.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
                    SizedBox(height: 12),
                    Text(
                      'لا يوجد عملاء بعد',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'أضف أول عميل لبدء متابعة المراحل.',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _recentCustomers.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final customer = _recentCustomers[index];
                final stages = _customerStages[customer.id] ?? {};
                return _buildCustomerTile(customer, stages);
              },
            ),
    );
  }

  Widget _buildCustomerTile(Customer customer, Map<String, double> stages) {
    return InkWell(
      onTap: () => _showCustomerStages(customer),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer info row
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text(
                    customer.customerName.isNotEmpty
                        ? customer.customerName[0]
                        : '?',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.customerName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'قطعة ${customer.plotNumber}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_left, color: Colors.grey[400]),
              ],
            ),

            // Stages progress row
            if (stages.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (stages.containsKey('license'))
                    _buildMiniStageIndicator(
                      'التراخيص',
                      stages['license']!,
                      Colors.orange,
                      Icons.description,
                    ),
                  if (stages.containsKey('excavation'))
                    _buildMiniStageIndicator(
                      'الحفر',
                      stages['excavation']!,
                      Colors.brown,
                      Icons.construction,
                    ),
                  if (stages.containsKey('execution'))
                    _buildMiniStageIndicator(
                      'التنفيذ',
                      stages['execution']!,
                      Colors.purple,
                      Icons.engineering,
                    ),
                  if (stages.containsKey('architectural'))
                    _buildMiniStageIndicator(
                      'التعديلات',
                      stages['architectural']!,
                      Colors.teal,
                      Icons.architecture,
                    ),
                  if (stages.containsKey('meter'))
                    _buildMiniStageIndicator(
                      'العدادات',
                      stages['meter']!,
                      Colors.green,
                      Icons.electric_meter,
                    ),
                  if (stages.containsKey('roadwork'))
                    _buildMiniStageIndicator(
                      'الطريق',
                      stages['roadwork']!,
                      Colors.indigo,
                      Icons.add_road,
                    ),
                  if (stages.containsKey('rooftop'))
                    _buildMiniStageIndicator(
                      'الأسطح',
                      stages['rooftop']!,
                      Colors.deepOrange,
                      Icons.roofing,
                    ),
                ],
              ),
            ] else
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'لا توجد مراحل مسجلة',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniStageIndicator(
    String label,
    double progress,
    Color color,
    IconData icon,
  ) {
    final isComplete = progress >= 100;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isComplete ? color.withValues(alpha: 0.15) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isComplete ? color.withValues(alpha: 0.4) : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isComplete ? Icons.check_circle : icon,
            size: 14,
            color: isComplete ? color : Colors.grey[600],
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: isComplete ? color : Colors.grey[700],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '${progress.toInt()}%',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isComplete ? color : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddCustomerDialog() async {
    // Create a temporary CustomerBloc for the dialog
    final customerBloc = CustomerBloc(getIt<CustomerService>());

    // Listen to bloc state changes
    final subscription = customerBloc.stream.listen((state) {
      if (state is CustomerOperationSuccess) {
        // Refresh data when customer is successfully added
        _loadData();
      }
    });

    await showDialog<Customer>(
      context: context,
      builder: (context) => CustomerFormDialog(
        customerBloc: customerBloc,
      ),
    );

    // Cancel subscription and refresh data after dialog closes
    await subscription.cancel();
    _loadData();
  }

  void _showCustomerStages(Customer customer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomerStagesScreen(customer: customer),
      ),
    );
  }
}
