import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';
import '../../blocs/customer/customer_bloc.dart';
import 'customer_form_dialog.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(getIt<CustomerService>())
        ..add(LoadCustomers()),
      child: const CustomerScreenView(),
    );
  }
}

class CustomerScreenView extends StatefulWidget {
  const CustomerScreenView({super.key});

  @override
  State<CustomerScreenView> createState() => _CustomerScreenViewState();
}

class _CustomerScreenViewState extends State<CustomerScreenView> {
  final _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'بحث...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (query) {
                  context.read<CustomerBloc>().add(SearchCustomers(query));
                },
              )
            : const Text('إدارة العملاء'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  context.read<CustomerBloc>().add(LoadCustomers());
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<CustomerBloc>().add(LoadCustomers());
            },
          ),
        ],
      ),
      body: BlocConsumer<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state is CustomerOperationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is CustomerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CustomerLoading || state is CustomerOperationInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CustomerError) {
            return _buildErrorView(context, state.message);
          }

          if (state is CustomersLoaded) {
            return _buildCustomerTable(context, state.customers);
          }

          return const Center(child: Text('لا توجد بيانات'));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCustomerDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('إضافة عميل'),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              context.read<CustomerBloc>().add(LoadCustomers());
            },
            icon: const Icon(Icons.refresh),
            label: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerTable(BuildContext context, List<Customer> customers) {
    if (customers.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('لا يوجد عملاء', style: TextStyle(fontSize: 18)),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats row
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.people, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    'إجمالي العملاء: ${customers.length}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Data table
          SizedBox(
            width: double.infinity,
            child: Card(
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.grey.shade100),
                columns: const [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('اسم العميل')),
                  DataColumn(label: Text('اسم المالك')),
                  DataColumn(label: Text('رقم الموبايل')),
                  DataColumn(label: Text('رقم القطعة')),
                  DataColumn(label: Text('المرحلة الحالية')),
                  DataColumn(label: Text('الإجراءات')),
                ],
                rows: customers.asMap().entries.map((entry) {
                  final index = entry.key;
                  final customer = entry.value;
                  return DataRow(
                    cells: [
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(customer.customerName)),
                      DataCell(Text(customer.ownerName ?? '-')),
                      DataCell(Text(customer.phone ?? '-')),
                      DataCell(Text(customer.plotNumber ?? '-')),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getStageColor(customer.currentStage),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            customer.currentStage ?? 'جديد',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              tooltip: 'تعديل',
                              onPressed: () => _showCustomerDialog(
                                context,
                                customer: customer,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: 'حذف',
                              onPressed: () => _showDeleteDialog(
                                context,
                                customer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStageColor(String? stage) {
    if (stage == null) return Colors.grey;
    switch (stage) {
      case 'التراخيص':
        return Colors.blue;
      case 'تصريح الحفر':
        return Colors.orange;
      case 'التنفيذ':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _showCustomerDialog(BuildContext context, {Customer? customer}) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomerFormDialog(
        customer: customer,
        customerBloc: context.read<CustomerBloc>(),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Customer customer) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text('هل أنت متأكد من حذف العميل "${customer.customerName}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CustomerBloc>().add(DeleteCustomer(customer.id));
              Navigator.pop(dialogContext);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
