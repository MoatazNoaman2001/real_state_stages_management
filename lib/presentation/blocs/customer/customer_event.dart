part of 'customer_bloc.dart';

@immutable
sealed class CustomerEvent {}

/// Load all customers
final class LoadCustomers extends CustomerEvent {}

/// Search customers by query
final class SearchCustomers extends CustomerEvent {
  final String query;
  SearchCustomers(this.query);
}

/// Filter customers by stage
final class FilterCustomersByStage extends CustomerEvent {
  final String stage;
  FilterCustomersByStage(this.stage);
}

/// Create new customer
final class CreateCustomer extends CustomerEvent {
  final Customer customer;
  CreateCustomer(this.customer);
}

/// Update existing customer
final class UpdateCustomer extends CustomerEvent {
  final int id;
  final Customer customer;
  UpdateCustomer(this.id, this.customer);
}

/// Delete customer
final class DeleteCustomer extends CustomerEvent {
  final int id;
  DeleteCustomer(this.id);
}

/// Clear error state
final class ClearCustomerError extends CustomerEvent {}
