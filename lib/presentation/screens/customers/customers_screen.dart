import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/customer.dart';
import '../../blocs/customer/customer_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_data_table.dart';
import '../../widgets/common/app_dialog.dart';
import '../../widgets/common/app_text_field.dart';
import '../../widgets/layout/app_layout.dart';
import '../customer/customer_stages_screen.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  String _searchQuery = '';
  String? _sortColumn;
  bool _sortAscending = true;
  String _viewType = 'table'; // 'table' or 'grid'

  @override
  void initState() {
    super.initState();
    context.read<CustomerBloc>().add(LoadCustomers());
  }

  List<Customer> _filterAndSortCustomers(List<Customer> customers) {
    var filtered = customers;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      final searchLower = _searchQuery.toLowerCase();
      filtered = filtered.where((c) {
        return c.customerName.toLowerCase().contains(searchLower) ||
            (c.plotNumber??"").toLowerCase().contains(searchLower) ||
            (c.phone?.contains(searchLower) ?? false);
      }).toList();
    }

    // Apply sorting
    if (_sortColumn != null) {
      filtered.sort((a, b) {
        int compare;
        switch (_sortColumn) {
          case 'name':
            compare = a.customerName.compareTo(b.customerName);
            break;
          case 'plot':
            compare = (a.plotNumber??"").compareTo((b.plotNumber??""));
            break;
          default:
            compare = 0;
        }
        return _sortAscending ? compare : -compare;
      });
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerBloc, CustomerState>(
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
        final customers = state is CustomersLoaded ? state.customers : <Customer>[];
        final isLoading = state is CustomerLoading;
        final filteredCustomers = _filterAndSortCustomers(customers);
        final viewportHeight = MediaQuery.of(context).size.height;
        final tableHeight = (viewportHeight - 280).clamp(420, 900).toDouble();

        return Column(
          children: [
            // Header
            AppPageHeader(
              title: 'العملاء',
              subtitle: '${customers.length} عميل مسجل',
              actions: [
                AppButton(
                  text: 'إضافة عميل',
                  icon: Icons.add,
                  onPressed: _showAddCustomerDialog,
                ),
              ],
            ),

            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildFiltersBar(),
                              const SizedBox(height: 16),
                              filteredCustomers.isEmpty
                                  ? const AppEmptyState(
                                      icon: Icons.people_outline,
                                      title: 'لا يوجد عملاء',
                                      message: 'لم يتم إضافة أي عملاء بعد',
                                    )
                                  : SizedBox(
                                      height: _viewType == 'table' ? tableHeight : (tableHeight + 140),
                                      child: _viewType == 'table'
                                          ? _buildCustomersTable(filteredCustomers)
                                          : _buildCustomersGrid(filteredCustomers),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFiltersBar() {
    return AppSectionCard(
      title: 'بحث وتصفية',
      icon: Icons.filter_list,
      actions: [
        AppButton(
          text: 'تحديث',
          icon: Icons.refresh,
          variant: AppButtonVariant.outline,
          onPressed: () => context.read<CustomerBloc>().add(LoadCustomers()),
        ),
      ],
      child: Row(
        children: [
          SizedBox(
            width: 320,
            child: AppSearchField(
              hint: 'بحث عن عميل...',
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          const SizedBox(width: 16),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(
                value: 'table',
                icon: Icon(Icons.table_rows, size: 18),
                tooltip: 'عرض جدول',
              ),
              ButtonSegment(
                value: 'grid',
                icon: Icon(Icons.grid_view, size: 18),
                tooltip: 'عرض بطاقات',
              ),
            ],
            selected: {_viewType},
            onSelectionChanged: (value) {
              setState(() => _viewType = value.first);
            },
            showSelectedIcon: false,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomersTable(List<Customer> customers) {
    final columns = <AppTableColumn<Customer>>[
      AppTableColumn(
        id: 'name',
        label: 'اسم العميل',
        sortable: true,
        cellBuilder: (customer) => Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primaryLight.withValues(alpha: 0.2),
              child: Text(
                customer.customerName.isNotEmpty
                    ? customer.customerName.substring(0, 1)
                    : '?',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (customer.ownerName != null)
                    Text(
                      'المالك: ${customer.ownerName}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      AppTableColumn(
        id: 'plot',
        label: 'رقم القطعة',
        sortable: true,
        valueGetter: (customer) => (customer.plotNumber??""),
      ),
      AppTableColumn(
        id: 'phone',
        label: 'رقم الهاتف',
        valueGetter: (customer) => customer.phone ?? '-',
      ),
      AppTableColumn(
        id: 'stage',
        label: 'المرحلة الحالية',
        cellBuilder: (customer) => AppStatusBadge.info(
          customer.currentStage ?? 'جديد',
        ),
      ),
    ];

    return AppDataTable<Customer>(
      columns: columns,
      data: customers,
      idGetter: (customer) => customer.id.toString(),
      sortColumn: _sortColumn,
      sortAscending: _sortAscending,
      onSort: (column, ascending) {
        setState(() {
          _sortColumn = column;
          _sortAscending = ascending;
        });
      },
      onRowTap: (customer) => _showCustomerDetails(customer),
      actionsBuilder: (customer) => [
        AppIconButton(
          icon: Icons.visibility_outlined,
          onPressed: () => _showCustomerDetails(customer),
          tooltip: 'عرض',
          size: 36,
        ),
        AppIconButton(
          icon: Icons.edit_outlined,
          onPressed: () => _showEditCustomerDialog(customer),
          tooltip: 'تعديل',
          size: 36,
        ),
        AppIconButton(
          icon: Icons.delete_outline,
          onPressed: () => _confirmDelete(customer),
          tooltip: 'حذف',
          size: 36,
          color: AppColors.error,
        ),
      ],
      emptyWidget: const AppEmptyState(
        icon: Icons.people_outline,
        title: 'لا يوجد عملاء',
        message: 'لم يتم إضافة أي عملاء بعد',
      ),
    );
  }

  Widget _buildCustomersGrid(List<Customer> customers) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 380,
        childAspectRatio: 1.3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        return _buildCustomerCard(customer);
      },
    );
  }

  Widget _buildCustomerCard(Customer customer) {
    return AppCard(
      onTap: () => _showCustomerDetails(customer),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with avatar and actions
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primaryLight.withValues(alpha: 0.2),
                  child: Text(
                    customer.customerName.isNotEmpty
                        ? customer.customerName.substring(0, 1)
                        : '?',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: AppColors.textSecondary),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'view',
                      child: Row(
                        children: [
                          Icon(Icons.visibility_outlined, size: 20),
                          SizedBox(width: 8),
                          Text('عرض'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined, size: 20),
                          SizedBox(width: 8),
                          Text('تعديل'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline, size: 20, color: AppColors.error),
                          SizedBox(width: 8),
                          Text('حذف', style: TextStyle(color: AppColors.error)),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    switch (value) {
                      case 'view':
                        _showCustomerDetails(customer);
                        break;
                      case 'edit':
                        _showEditCustomerDialog(customer);
                        break;
                      case 'delete':
                        _confirmDelete(customer);
                        break;
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Name
            Text(
              customer.customerName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (customer.ownerName != null) ...[
              const SizedBox(height: 4),
              Text(
                'المالك: ${customer.ownerName}',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const Spacer(),

            // Info row
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    customer.plotNumber ?? '-',
                    style: const TextStyle(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (customer.phone != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.phone_outlined, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    customer.phone!,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 12),

            // Stage badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                customer.currentStage ?? 'جديد',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
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
        },
      ),
    );
  }

  void _showEditCustomerDialog(Customer customer) {
    // Extract address from notes
    String existingAddress = '';
    String existingNotes = '';
    if (customer.notes != null) {
      final lines = customer.notes!.split('\n');
      final addressLines = <String>[];
      final noteLines = <String>[];
      for (final line in lines) {
        if (line.startsWith('\u0627\u0644\u0639\u0646\u0648\u0627\u0646: ')) {
          addressLines.add(line.replaceFirst('\u0627\u0644\u0639\u0646\u0648\u0627\u0646: ', ''));
        } else {
          noteLines.add(line);
        }
      }
      existingAddress = addressLines.join('\n');
      existingNotes = noteLines.join('\n');
    }

    final nameController = TextEditingController(text: customer.customerName);
    final ownerController = TextEditingController(text: customer.ownerName ?? '');
    final plotController = TextEditingController(text: customer.plotNumber);
    final projectNumberController = TextEditingController(text: customer.projectNumber ?? '');
    final phoneController = TextEditingController(text: customer.phone ?? '');
    final addressController = TextEditingController(text: existingAddress);
    final usernameController = TextEditingController(text: customer.username ?? '');
    final passwordController = TextEditingController(text: customer.password ?? '');
    final notesController = TextEditingController(text: existingNotes);

    AppDialog.show(
      context: context,
      builder: (dialogContext) => AppFormDialog(
        title: '\u062a\u0639\u062f\u064a\u0644 \u0628\u064a\u0627\u0646\u0627\u062a \u0627\u0644\u0639\u0645\u064a\u0644',
        width: 600,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: '\u0627\u0633\u0645 \u0627\u0644\u0639\u0645\u064a\u0644',
                    prefixIcon: Icons.person_outline,
                    controller: nameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppTextField(
                    label: '\u0627\u0633\u0645 \u0627\u0644\u0645\u0627\u0644\u0643',
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

          final updatedCustomer = customer.copyWith(
            customerName: nameController.text,
            ownerName: ownerController.text.isEmpty ? null : ownerController.text,
            plotNumber: plotController.text,
            projectNumber: projectNumberController.text.isEmpty ? null : projectNumberController.text,
            phone: phoneController.text.isEmpty ? null : phoneController.text,
            username: usernameController.text.isEmpty ? null : usernameController.text,
            password: passwordController.text.isEmpty ? null : passwordController.text,
            notes: combinedNotes,
          );

          context.read<CustomerBloc>().add(UpdateCustomer(customer.id, updatedCustomer));
          Navigator.of(dialogContext).pop();
        },
      ),
    );
  }

  void _showCustomerDetails(Customer customer) {
    AppDialog.show(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: customer.customerName,
        width: 700,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Customer info card
            AppCard(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primaryLight.withValues(alpha: 0.2),
                    child: Text(
                      customer.customerName.isNotEmpty
                          ? customer.customerName.substring(0, 1)
                          : '?',
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customer.customerName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (customer.ownerName != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            'المالك: ${customer.ownerName}',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              (customer.plotNumber??""),
                              style: const TextStyle(fontSize: 13),
                            ),
                            if (customer.phone != null) ...[
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.phone_outlined,
                                size: 16,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                customer.phone!,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      customer.currentStage ?? 'جديد',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            if (customer.username != null || customer.password != null) ...[
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.account_circle_outlined, size: 18, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text(
                          '\u0628\u064a\u0627\u0646\u0627\u062a \u0627\u0644\u062d\u0633\u0627\u0628',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (customer.username != null)
                      _buildCopyableField('\u0627\u0633\u0645 \u0627\u0644\u0645\u0633\u062a\u062e\u062f\u0645', customer.username!),
                    if (customer.password != null) ...[
                      const SizedBox(height: 8),
                      _buildCopyableField('\u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631', customer.password!),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            if (customer.notes != null) ...[
              _buildInfoRow('\u0645\u0644\u0627\u062d\u0638\u0627\u062a', customer.notes!),
              const SizedBox(height: 8),
            ],
            _buildInfoRow(
              '\u062a\u0627\u0631\u064a\u062e \u0627\u0644\u0625\u0636\u0627\u0641\u0629',
              '${customer.createdAt.day}/${customer.createdAt.month}/${customer.createdAt.year}',
            ),
          ],
        ),
        actions: [
          AppButton(
            text: '\u0625\u063a\u0644\u0627\u0642',
            variant: AppButtonVariant.ghost,
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
          AppButton(
            text: '\u0639\u0631\u0636 \u0627\u0644\u0645\u0631\u0627\u062d\u0644',
            icon: Icons.timeline,
            variant: AppButtonVariant.outline,
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerStagesScreen(customer: customer),
                ),
              );
            },
          ),
          AppButton(
            text: '\u062a\u0639\u062f\u064a\u0644',
            icon: Icons.edit,
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _showEditCustomerDialog(customer);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }

  Widget _buildCopyableField(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.copy, size: 18, color: AppColors.textSecondary),
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

  Future<void> _confirmDelete(Customer customer) async {
    final confirmed = await AppConfirmDialog.show(
      context: context,
      title: 'حذف العميل',
      message: 'هل أنت متأكد من حذف العميل "${customer.customerName}"؟\nلا يمكن التراجع عن هذا الإجراء.',
      isDanger: true,
      confirmText: 'حذف',
    );

    if (confirmed == true && mounted) {
      context.read<CustomerBloc>().add(DeleteCustomer(customer.id));
    }
  }
}
