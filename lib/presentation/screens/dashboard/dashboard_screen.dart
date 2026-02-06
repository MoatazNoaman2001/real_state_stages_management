import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../widgets/common/app_dialog.dart';
import '../../widgets/common/app_text_field.dart';
import '../../blocs/customer/customer_bloc.dart';
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

  void _showAddCustomerDialog() {
    final nameController = TextEditingController();
    final ownerController = TextEditingController();
    final plotController = TextEditingController();
    final projectNumberController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final notesController = TextEditingController();

    AppDialog.show(
      context: context,
      builder: (dialogContext) => AppFormDialog(
        title: '\u0625\u0636\u0627\u0641\u0629 \u0639\u0645\u064a\u0644 \u062c\u062f\u064a\u062f',
        width: 600,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: '\u0627\u0633\u0645 \u0627\u0644\u0639\u0645\u064a\u0644',
                    hint: '\u0623\u062f\u062e\u0644 \u0627\u0633\u0645 \u0627\u0644\u0639\u0645\u064a\u0644',
                    prefixIcon: Icons.person_outline,
                    controller: nameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppTextField(
                    label: '\u0627\u0633\u0645 \u0627\u0644\u0645\u0627\u0644\u0643',
                    hint: '\u0623\u062f\u062e\u0644 \u0627\u0633\u0645 \u0627\u0644\u0645\u0627\u0644\u0643',
                    prefixIcon: Icons.person_outline,
                    controller: ownerController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: '\u0631\u0642\u0645 \u0627\u0644\u0642\u0637\u0639\u0629',
                    hint: '\u0645\u062b\u0627\u0644: \u0642\u0637\u0639\u0629 45',
                    prefixIcon: Icons.location_on_outlined,
                    controller: plotController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppTextField(
                    label: '\u0631\u0642\u0645 \u0627\u0644\u0645\u0634\u0631\u0648\u0639',
                    hint: '\u0623\u062f\u062e\u0644 \u0631\u0642\u0645 \u0627\u0644\u0645\u0634\u0631\u0648\u0639',
                    prefixIcon: Icons.assignment_outlined,
                    controller: projectNumberController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: '\u0631\u0642\u0645 \u0627\u0644\u0647\u0627\u062a\u0641',
                    hint: '01xxxxxxxxx',
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: '\u0627\u0644\u0639\u0646\u0648\u0627\u0646',
              hint: '\u0623\u062f\u062e\u0644 \u0627\u0644\u0639\u0646\u0648\u0627\u0646 \u0627\u0644\u062a\u0641\u0635\u064a\u0644\u064a',
              prefixIcon: Icons.home_outlined,
              maxLines: 2,
              controller: addressController,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: '\u0627\u0633\u0645 \u0627\u0644\u0645\u0633\u062a\u062e\u062f\u0645',
                    hint: '\u0623\u062f\u062e\u0644 \u0627\u0633\u0645 \u0627\u0644\u0645\u0633\u062a\u062e\u062f\u0645',
                    prefixIcon: Icons.account_circle_outlined,
                    controller: usernameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppTextField(
                    label: '\u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631',
                    hint: '\u0623\u062f\u062e\u0644 \u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631',
                    prefixIcon: Icons.lock_outline,
                    controller: passwordController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: '\u0645\u0644\u0627\u062d\u0638\u0627\u062a',
              hint: '\u0645\u0644\u0627\u062d\u0638\u0627\u062a \u0625\u0636\u0627\u0641\u064a\u0629...',
              maxLines: 3,
              controller: notesController,
            ),
          ],
        ),
        onSave: () {
          if (nameController.text.isEmpty || plotController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('\u064a\u0631\u062c\u0649 \u0625\u062f\u062e\u0627\u0644 \u0627\u0633\u0645 \u0627\u0644\u0639\u0645\u064a\u0644 \u0648\u0631\u0642\u0645 \u0627\u0644\u0642\u0637\u0639\u0629'),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }

          // Combine address and notes
          final address = addressController.text.trim();
          final notes = notesController.text.trim();
          String? combinedNotes;
          if (address.isNotEmpty || notes.isNotEmpty) {
            final parts = <String>[];
            if (address.isNotEmpty) parts.add('\u0627\u0644\u0639\u0646\u0648\u0627\u0646: $address');
            if (notes.isNotEmpty) parts.add(notes);
            combinedNotes = parts.join('\n');
          }

          final customer = Customer(
            id: 0,
            customerName: nameController.text,
            ownerName: ownerController.text.isEmpty ? null : ownerController.text,
            plotNumber: plotController.text,
            projectNumber: projectNumberController.text.isEmpty ? null : projectNumberController.text,
            username: usernameController.text.isEmpty ? null : usernameController.text,
            password: passwordController.text.isEmpty ? null : passwordController.text,
            phone: phoneController.text.isEmpty ? null : phoneController.text,
            notes: combinedNotes,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          context.read<CustomerBloc>().add(CreateCustomer(customer));
          Navigator.of(dialogContext).pop();
          _loadData();
        },
      ),
    );
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
