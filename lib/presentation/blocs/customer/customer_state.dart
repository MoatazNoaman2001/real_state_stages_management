part of 'customer_bloc.dart';

@immutable
sealed class CustomerState {}

/// Initial state
final class CustomerInitial extends CustomerState {}

/// Loading state
final class CustomerLoading extends CustomerState {}

/// Customers loaded successfully
final class CustomersLoaded extends CustomerState {
  final List<Customer> customers;
  final String? searchQuery;
  final String? filterStage;
  final int totalCount;

  CustomersLoaded({
    required this.customers,
    this.searchQuery,
    this.filterStage,
  }) : totalCount = customers.length;
}

/// Error state
final class CustomerError extends CustomerState {
  final String message;
  CustomerError(this.message);
}

/// Operation in progress
final class CustomerOperationInProgress extends CustomerState {
  final String message;
  CustomerOperationInProgress(this.message);
}

/// Operation success
final class CustomerOperationSuccess extends CustomerState {
  final String message;
  final CustomerOperationType type;
  final int? customerId;

  CustomerOperationSuccess({
    required this.message,
    required this.type,
    this.customerId,
  });
}

enum CustomerOperationType { create, update, delete }
