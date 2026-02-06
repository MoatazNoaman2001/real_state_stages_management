import '../../core/exceptions/app_exceptions.dart';
import '../../data/repositories/customer_repository.dart';
import '../models/customer.dart';

class CustomerService {
  final CustomerRepository _repository;

  CustomerService(this._repository);

  /// Get all customers ordered by name
  Future<List<Customer>> getAllCustomers() async {
    return await _repository.findAll(orderBy: 'customer_name');
  }

  /// Get customer by ID
  Future<Customer?> getCustomer(int id) async {
    return await _repository.findById(id);
  }

  /// Create new customer with validation
  Future<int> createCustomer(Customer customer) async {
    // Validate customer name
    if (customer.customerName.trim().isEmpty) {
      throw ValidationException('اسم العميل مطلوب');
    }

    // Validate phone if provided
    if (customer.phone != null && customer.phone!.isNotEmpty) {
      if (!validatePhone(customer.phone!)) {
        throw ValidationException(
          'رقم الموبايل يجب أن يكون 11 رقم ويبدأ بـ 010 أو 011 أو 012 أو 015',
        );
      }
    }

    // Check plot number uniqueness
    if (customer.plotNumber != null && customer.plotNumber!.isNotEmpty) {
      final existing = await _repository.findByPlotNumber(customer.plotNumber!);
      if (existing != null) {
        throw DuplicateException('رقم القطعة "${customer.plotNumber}" موجود بالفعل');
      }
    }

    return await _repository.insert(customer);
  }

  /// Update customer with validation
  Future<bool> updateCustomer(int id, Customer customer) async {
    // Check if customer exists
    final existing = await _repository.findById(id);
    if (existing == null) {
      throw NotFoundException('العميل غير موجود');
    }

    // Validate customer name
    if (customer.customerName.trim().isEmpty) {
      throw ValidationException('اسم العميل مطلوب');
    }

    // Validate phone if provided
    if (customer.phone != null && customer.phone!.isNotEmpty) {
      if (!validatePhone(customer.phone!)) {
        throw ValidationException(
          'رقم الموبايل يجب أن يكون 11 رقم ويبدأ بـ 010 أو 011 أو 012 أو 015',
        );
      }
    }

    // Check plot number uniqueness (exclude current customer)
    if (customer.plotNumber != null && customer.plotNumber!.isNotEmpty) {
      final existingByPlot = await _repository.findByPlotNumber(
        customer.plotNumber!,
      );
      if (existingByPlot != null && existingByPlot.id != id) {
        throw DuplicateException('رقم القطعة "${customer.plotNumber}" موجود بالفعل');
      }
    }

    return await _repository.update(id, customer);
  }

  /// Delete customer
  Future<bool> deleteCustomer(int id) async {
    final existing = await _repository.findById(id);
    if (existing == null) {
      throw NotFoundException('العميل غير موجود');
    }

    return await _repository.delete(id);
  }

  /// Search customers
  Future<List<Customer>> searchCustomers(String query) async {
    if (query.trim().isEmpty) {
      return Future.value([]);
    }
    return await _repository.search(query);
  }

  /// Get customers by stage
  Future<List<Customer>> getCustomersByStage(String stage) async {
    return await _repository.findByStage(stage);
  }

  /// Validate Egyptian phone number
  bool validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) return true;

    // Remove any spaces or dashes
    final cleaned = phone.replaceAll(RegExp(r'[\s-]'), '');

    // Check length
    if (cleaned.length != 11) return false;

    // Check prefix
    final validPrefixes = ['010', '011', '012', '015'];
    return validPrefixes.any((prefix) => cleaned.startsWith(prefix));
  }

  /// Get customer count
  Future<int> getCustomerCount() async {
    return await _repository.count();
  }

  /// Get customer count by stage
  Future<int> getCustomerCountByStage(String stage) async {
    return await _repository.count(
      where: 'current_stage = @stage',
      parameters: {'stage': stage},
    );
  }
}
