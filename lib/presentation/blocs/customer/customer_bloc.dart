import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerService _service;

  CustomerBloc(this._service) : super(CustomerInitial()) {
    on<LoadCustomers>(_onLoadCustomers);
    on<SearchCustomers>(_onSearchCustomers);
    on<FilterCustomersByStage>(_onFilterByStage);
    on<CreateCustomer>(_onCreateCustomer);
    on<UpdateCustomer>(_onUpdateCustomer);
    on<DeleteCustomer>(_onDeleteCustomer);
    on<ClearCustomerError>(_onClearError);
  }

  Future<void> _onLoadCustomers(
    LoadCustomers event,
    Emitter<CustomerState> emit,
  ) async {
    emit(CustomerLoading());
    try {
      final customers = await _service.getAllCustomers();
      emit(CustomersLoaded(customers: customers));
    } catch (e) {
      emit(CustomerError(_getErrorMessage(e)));
    }
  }

  Future<void> _onSearchCustomers(
    SearchCustomers event,
    Emitter<CustomerState> emit,
  ) async {
    emit(CustomerLoading());
    try {
      final customers = await _service.searchCustomers(event.query);
      emit(CustomersLoaded(
        customers: customers,
        searchQuery: event.query,
      ));
    } catch (e) {
      emit(CustomerError(_getErrorMessage(e)));
    }
  }

  Future<void> _onFilterByStage(
    FilterCustomersByStage event,
    Emitter<CustomerState> emit,
  ) async {
    emit(CustomerLoading());
    try {
      final customers = await _service.getCustomersByStage(event.stage);
      emit(CustomersLoaded(
        customers: customers,
        filterStage: event.stage,
      ));
    } catch (e) {
      emit(CustomerError(_getErrorMessage(e)));
    }
  }

  Future<void> _onCreateCustomer(
    CreateCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(CustomerOperationInProgress('جاري إضافة العميل...'));
    try {
      final id = await _service.createCustomer(event.customer);
      emit(CustomerOperationSuccess(
        message: 'تم إضافة العميل بنجاح',
        type: CustomerOperationType.create,
        customerId: id,
      ));
      // Reload customers
      add(LoadCustomers());
    } catch (e) {
      emit(CustomerError(_getErrorMessage(e)));
    }
  }

  Future<void> _onUpdateCustomer(
    UpdateCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(CustomerOperationInProgress('جاري تحديث العميل...'));
    try {
      await _service.updateCustomer(event.id, event.customer);
      emit(CustomerOperationSuccess(
        message: 'تم تحديث العميل بنجاح',
        type: CustomerOperationType.update,
        customerId: event.id,
      ));
      // Reload customers
      add(LoadCustomers());
    } catch (e) {
      emit(CustomerError(_getErrorMessage(e)));
    }
  }

  Future<void> _onDeleteCustomer(
    DeleteCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(CustomerOperationInProgress('جاري حذف العميل...'));
    try {
      await _service.deleteCustomer(event.id);
      emit(CustomerOperationSuccess(
        message: 'تم حذف العميل بنجاح',
        type: CustomerOperationType.delete,
        customerId: event.id,
      ));
      // Reload customers
      add(LoadCustomers());
    } catch (e) {
      emit(CustomerError(_getErrorMessage(e)));
    }
  }

  void _onClearError(
    ClearCustomerError event,
    Emitter<CustomerState> emit,
  ) {
    emit(CustomerInitial());
  }

  String _getErrorMessage(Object error) {
    if (error is ValidationException) {
      return error.message;
    } else if (error is NotFoundException) {
      return error.message;
    } else if (error is DuplicateException) {
      return error.message;
    } else if (error is BusinessRuleException) {
      return error.message;
    } else if (error is AppException) {
      return error.message;
    }
    return 'حدث خطأ غير متوقع: ${error.toString()}';
  }
}
