import '../../core/exceptions/app_exceptions.dart';
import '../../data/repositories/alert_repository.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/inspection_repository.dart';
import '../models/alert.dart';
import '../models/inspection.dart';

class InspectionService {
  final InspectionRepository _inspectionRepo;
  final CustomerRepository _customerRepo;
  final AlertRepository _alertRepo;

  InspectionService(
    this._inspectionRepo,
    this._customerRepo,
    this._alertRepo,
  );

  /// Get all inspections for customer
  Future<List<Inspection>> getInspectionsForCustomer(int customerId) async {
    return await _inspectionRepo.findByCustomerId(customerId);
  }

  /// Get inspection by ID
  Future<Inspection?> getInspection(int id) async {
    return await _inspectionRepo.findById(id);
  }

  /// Schedule new inspection
  Future<int> scheduleInspection({
    required int customerId,
    required DateTime inspectionDate,
    String? reason,
  }) async {
    // Validate customer exists
    final customer = await _customerRepo.findById(customerId);
    if (customer == null) {
      throw NotFoundException('العميل غير موجود');
    }

    final inspection = Inspection(
      id: 0,
      customerId: customerId,
      inspectionDate: inspectionDate,
      reason: reason,
      status: 'pending',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final inspectionId = await _inspectionRepo.insert(inspection);

    // Create reminder alert
    await _createReminderAlert(
      customerId: customerId,
      inspectionId: inspectionId,
      inspectionDate: inspectionDate,
      customerName: customer.customerName,
    );

    return inspectionId;
  }

  /// Update inspection
  Future<bool> updateInspection(int id, Inspection inspection) async {
    final existing = await _inspectionRepo.findById(id);
    if (existing == null) {
      throw NotFoundException('المعاينة غير موجودة');
    }

    return await _inspectionRepo.update(id, inspection);
  }

  /// Mark inspection as completed
  Future<bool> completeInspection(int inspectionId) async {
    final inspection = await _inspectionRepo.findById(inspectionId);
    if (inspection == null) {
      throw NotFoundException('المعاينة غير موجودة');
    }

    return await _inspectionRepo.markAsCompleted(inspectionId);
  }

  /// Cancel inspection
  Future<bool> cancelInspection(int inspectionId) async {
    final inspection = await _inspectionRepo.findById(inspectionId);
    if (inspection == null) {
      throw NotFoundException('المعاينة غير موجودة');
    }

    return await _inspectionRepo.markAsCancelled(inspectionId);
  }

  /// Reschedule inspection
  Future<bool> rescheduleInspection({
    required int inspectionId,
    required DateTime newDate,
  }) async {
    final inspection = await _inspectionRepo.findById(inspectionId);
    if (inspection == null) {
      throw NotFoundException('المعاينة غير موجودة');
    }

    final updated = inspection.copyWith(
      inspectionDate: newDate,
      status: 'pending',
    );

    return await _inspectionRepo.update(inspectionId, updated);
  }

  /// Get upcoming inspections
  Future<List<Inspection>> getUpcomingInspections(int days) async {
    return await _inspectionRepo.findUpcoming(days);
  }

  /// Get today's inspections
  Future<List<Inspection>> getTodayInspections() async {
    return await _inspectionRepo.findToday();
  }

  /// Get inspections by status
  Future<List<Inspection>> getInspectionsByStatus(String status) async {
    return await _inspectionRepo.findByStatus(status);
  }

  /// Get inspections by date
  Future<List<Inspection>> getInspectionsByDate(DateTime date) async {
    return await _inspectionRepo.findByDate(date);
  }

  /// Get inspection statistics
  Future<Map<String, int>> getStatistics() async {
    return await _inspectionRepo.countByStatus();
  }

  /// Delete inspection
  Future<bool> deleteInspection(int inspectionId) async {
    final inspection = await _inspectionRepo.findById(inspectionId);
    if (inspection == null) {
      throw NotFoundException('المعاينة غير موجودة');
    }

    return await _inspectionRepo.delete(inspectionId);
  }

  /// Create reminder alert for inspection
  Future<void> _createReminderAlert({
    required int customerId,
    required int inspectionId,
    required DateTime inspectionDate,
    required String customerName,
  }) async {
    final daysUntil = inspectionDate.difference(DateTime.now()).inDays;

    final alert = Alert(
      id: 0,
      customerId: customerId,
      alertType: 'upcoming_inspection',
      message: 'معاينة مجدولة بعد $daysUntil يوم للعميل $customerName',
      alertDate: DateTime.now(),
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _alertRepo.insert(alert);
  }

  /// Get status display name
  String getStatusDisplayName(String status) {
    const statuses = {
      'pending': 'قيد الانتظار',
      'completed': 'مكتملة',
      'cancelled': 'ملغية',
    };
    return statuses[status] ?? status;
  }
}
