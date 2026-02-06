import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/di/service_locator.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/models/license.dart';
import '../../../domain/models/excavation_permit.dart';
import '../../../domain/models/execution_stage.dart';
import '../../../domain/models/architectural_modification.dart';
import '../../../domain/models/utility_meter.dart';
import '../../../domain/models/road_work.dart';
import '../../../domain/models/rooftop_addition.dart';
import '../../../data/repositories/license_repository.dart';
import '../../../data/repositories/excavation_permit_repository.dart';
import '../../../data/repositories/execution_stage_repository.dart';
import '../../../data/repositories/architectural_modification_repository.dart';
import '../../../data/repositories/utility_meter_repository.dart';
import '../../../data/repositories/road_work_repository.dart';
import '../../../data/repositories/rooftop_addition_repository.dart';
import '../../app_shell.dart';

/// Screen showing all stages/submissions for a specific customer
class CustomerStagesScreen extends StatefulWidget {
  final Customer customer;

  const CustomerStagesScreen({
    super.key,
    required this.customer,
  });

  @override
  State<CustomerStagesScreen> createState() => _CustomerStagesScreenState();
}

class _CustomerStagesScreenState extends State<CustomerStagesScreen> {
  bool _isLoading = true;
  Map<String, dynamic> _stagesData = {};

  @override
  void initState() {
    super.initState();
    _loadAllStages();
  }

  Future<void> _loadAllStages() async {
    setState(() => _isLoading = true);

    try {
      // Load all stages for this customer
      final licenseRepo = getIt<LicenseRepository>();
      final excavationRepo = getIt<ExcavationPermitRepository>();
      final executionRepo = getIt<ExecutionStageRepository>();
      final architecturalRepo = getIt<ArchitecturalModificationRepository>();
      final utilityMeterRepo = getIt<UtilityMeterRepository>();
      final roadWorkRepo = getIt<RoadWorkRepository>();
      final rooftopRepo = getIt<RooftopAdditionRepository>();

      final data = <String, dynamic>{};

      // License
      final license = await licenseRepo.findByCustomerId(widget.customer.id);
      if (license != null) {
        data['license'] = {
          'exists': true,
          'progress': license.progress,
          'completed': license.completedSteps,
          'total': License.totalSteps,
        };
      }

      // Excavation Permit
      final excavation = await excavationRepo.findByCustomerId(widget.customer.id);
      if (excavation != null) {
        data['excavation'] = {
          'exists': true,
          'progress': excavation.progress,
          'completed': excavation.completedSteps,
          'total': ExcavationPermit.totalSteps,
        };
      }

      // Execution Stages
      final execution = await executionRepo.findByCustomerId(widget.customer.id);
      if (execution != null) {
        data['execution'] = {
          'exists': true,
          'progress': execution.progress,
          'completed': execution.completedSteps,
          'total': ExecutionStage.totalSteps,
        };
      }

      // Architectural Modification
      final architectural = await architecturalRepo.findByCustomerId(widget.customer.id);
      if (architectural != null) {
        data['architectural'] = {
          'exists': true,
          'progress': architectural.progress,
          'completed': architectural.completedSteps,
          'total': ArchitecturalModification.totalSteps,
        };
      }

      // Utility Meter
      final utilityMeter = await utilityMeterRepo.findByCustomerId(widget.customer.id);
      if (utilityMeter != null) {
        data['utilityMeter'] = {
          'exists': true,
          'progress': utilityMeter.progress,
          'completed': utilityMeter.completedSteps,
          'total': UtilityMeter.totalSteps,
        };
      }

      // Road Work
      final roadWork = await roadWorkRepo.findByCustomerId(widget.customer.id);
      if (roadWork != null) {
        data['roadWork'] = {
          'exists': true,
          'progress': roadWork.progress,
          'completed': roadWork.completedSteps,
          'total': RoadWork.totalSteps,
        };
      }

      // Rooftop Addition
      final rooftop = await rooftopRepo.findByCustomerId(widget.customer.id);
      if (rooftop != null) {
        data['rooftop'] = {
          'exists': true,
          'progress': rooftop.progress,
          'completed': rooftop.completedSteps,
          'total': RooftopAddition.totalSteps,
        };
      }

      setState(() {
        _stagesData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في تحميل البيانات: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراحل ${widget.customer.customerName}'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customer Info Card
                  _buildCustomerInfoCard(),
                  const SizedBox(height: 24),

                  // Stages List
                  const Text(
                    'المراحل المسجلة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (_stagesData.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          'لا توجد مراحل مسجلة لهذا العميل',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  else
                    ..._buildStageCards(),
                ],
              ),
            ),
    );
  }

  Widget _buildCustomerInfoCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade100,
                  child: Text(
                    widget.customer.customerName.isNotEmpty
                        ? widget.customer.customerName[0]
                        : '?',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.customer.customerName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'قطعة: ${widget.customer.plotNumber}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.customer.currentStage != null) ...[
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.info_outline, size: 18, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    '\u0627\u0644\u0645\u0631\u062d\u0644\u0629 \u0627\u0644\u062d\u0627\u0644\u064a\u0629: ${widget.customer.currentStage}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
            if (widget.customer.username != null || widget.customer.password != null) ...[
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                '\u0628\u064a\u0627\u0646\u0627\u062a \u0627\u0644\u062d\u0633\u0627\u0628',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (widget.customer.username != null)
                _buildCopyableField(
                  icon: Icons.person_outline,
                  label: '\u0627\u0633\u0645 \u0627\u0644\u0645\u0633\u062a\u062e\u062f\u0645',
                  value: widget.customer.username!,
                ),
              if (widget.customer.password != null) ...[
                const SizedBox(height: 8),
                _buildCopyableField(
                  icon: Icons.lock_outline,
                  label: '\u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631',
                  value: widget.customer.password!,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCopyableField({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.copy, size: 18),
          tooltip: '\u0646\u0633\u062e',
          onPressed: () {
            Clipboard.setData(ClipboardData(text: value));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('\u062a\u0645 \u0646\u0633\u062e $label'),
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> _buildStageCards() {
    final cards = <Widget>[];

    // License
    if (_stagesData.containsKey('license')) {
      cards.add(_buildStageCard(
        title: 'التراخيص',
        icon: Icons.description,
        color: Colors.orange,
        data: _stagesData['license'],
        onTap: () => _navigateToStage('licenses'),
      ));
    }

    // Excavation Permit
    if (_stagesData.containsKey('excavation')) {
      cards.add(_buildStageCard(
        title: 'إذن الحفر',
        icon: Icons.construction,
        color: Colors.brown,
        data: _stagesData['excavation'],
        onTap: () => _navigateToStage('excavation'),
      ));
    }

    // Execution Stage
    if (_stagesData.containsKey('execution')) {
      cards.add(_buildStageCard(
        title: 'مراحل التنفيذ',
        icon: Icons.engineering,
        color: Colors.purple,
        data: _stagesData['execution'],
        onTap: () => _navigateToStage('execution'),
      ));
    }

    // Architectural Modification
    if (_stagesData.containsKey('architectural')) {
      cards.add(_buildStageCard(
        title: 'التعديلات المعمارية',
        icon: Icons.architecture,
        color: Colors.teal,
        data: _stagesData['architectural'],
        onTap: () => _navigateToStage('modifications'),
      ));
    }

    // Utility Meter
    if (_stagesData.containsKey('utilityMeter')) {
      cards.add(_buildStageCard(
        title: 'العدادات',
        icon: Icons.electric_meter,
        color: Colors.green,
        data: _stagesData['utilityMeter'],
        onTap: () => _navigateToStage('meters'),
      ));
    }

    // Road Work
    if (_stagesData.containsKey('roadWork')) {
      cards.add(_buildStageCard(
        title: 'إشغال الطريق',
        icon: Icons.add_road,
        color: Colors.indigo,
        data: _stagesData['roadWork'],
        onTap: () => _navigateToStage('roadwork'),
      ));
    }

    // Rooftop Addition
    if (_stagesData.containsKey('rooftop')) {
      cards.add(_buildStageCard(
        title: 'إضافة الأسطح',
        icon: Icons.roofing,
        color: Colors.deepOrange,
        data: _stagesData['rooftop'],
        onTap: () => _navigateToStage('rooftop'),
      ));
    }

    return cards;
  }

  Widget _buildStageCard({
    required String title,
    required IconData icon,
    required Color color,
    required Map<String, dynamic> data,
    required VoidCallback onTap,
  }) {
    final completed = data['completed'] as int;
    final total = data['total'] as int;
    final progress = data['progress'] as double;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon
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

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: progress / 100,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(color),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '$completed / $total',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Arrow Icon
              const SizedBox(width: 8),
              Icon(Icons.chevron_left, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToStage(String stageId) {
    // Close this screen
    Navigator.pop(context);

    // Navigate to the stage screen with this customer pre-selected
    appShellKey.currentState?.navigateTo(stageId, customerId: widget.customer.id);
  }
}
