import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../domain/models/customer.dart';
import '../../blocs/customer/customer_bloc.dart';
import '../../widgets/common/app_text_field.dart';

class CustomerFormDialog extends StatefulWidget {
  final Customer? customer;
  final CustomerBloc customerBloc;

  const CustomerFormDialog({
    super.key,
    this.customer,
    required this.customerBloc,
  });

  bool get isEditMode => customer != null;

  @override
  State<CustomerFormDialog> createState() => _CustomerFormDialogState();
}

class _CustomerFormDialogState extends State<CustomerFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _ownerNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _plotNumberController;
  late final TextEditingController _projectNumberController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.customer?.customerName ?? '',
    );
    _ownerNameController = TextEditingController(
      text: widget.customer?.ownerName ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.customer?.phone ?? '',
    );
    _plotNumberController = TextEditingController(
      text: widget.customer?.plotNumber ?? '',
    );
    _projectNumberController = TextEditingController(
      text: widget.customer?.projectNumber ?? '',
    );
    _usernameController = TextEditingController(
      text: widget.customer?.username ?? '',
    );
    _passwordController = TextEditingController();
    _notesController = TextEditingController(
      text: widget.customer?.notes ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ownerNameController.dispose();
    _phoneController.dispose();
    _plotNumberController.dispose();
    _projectNumberController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEditMode ? 'تعديل العميل' : 'إضافة عميل جديد'),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  controller: _nameController,
                  label: 'اسم العميل *',
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'اسم العميل مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _ownerNameController,
                  label: 'اسم المالك',
                  prefixIcon: Icons.person_outline,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _phoneController,
                  label: 'رقم الموبايل',
                  hint: '01xxxxxxxxx',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.length != 11) {
                        return 'رقم الموبايل يجب أن يكون 11 رقم';
                      }
                      final validPrefixes = ['010', '011', '012', '015'];
                      if (!validPrefixes.any((p) => value.startsWith(p))) {
                        return 'رقم الموبايل يجب أن يبدأ بـ 010 أو 011 أو 012 أو 015';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _plotNumberController,
                  label: 'رقم القطعة',
                  prefixIcon: Icons.location_on,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _projectNumberController,
                  label: 'رقم المشروع بالمجمعة',
                  prefixIcon: Icons.numbers,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _usernameController,
                  label: 'اسم المستخدم',
                  prefixIcon: Icons.account_circle,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _passwordController,
                  label: widget.isEditMode
                      ? 'كلمة المرور (اتركها فارغة للاحتفاظ بالقديمة)'
                      : 'كلمة المرور',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _notesController,
                  label: 'ملاحظات',
                  prefixIcon: Icons.notes,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _saveCustomer,
          child: Text(widget.isEditMode ? 'تحديث' : 'إضافة'),
        ),
      ],
    );
  }

  void _saveCustomer() {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();

    final customer = Customer(
      id: widget.customer?.id ?? 0,
      customerName: _nameController.text.trim(),
      ownerName: _ownerNameController.text.trim().isEmpty
          ? null
          : _ownerNameController.text.trim(),
      phone: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
      plotNumber: _plotNumberController.text.trim().isEmpty
          ? null
          : _plotNumberController.text.trim(),
      projectNumber: _projectNumberController.text.trim().isEmpty
          ? null
          : _projectNumberController.text.trim(),
      username: _usernameController.text.trim().isEmpty
          ? null
          : _usernameController.text.trim(),
      password: _passwordController.text.isNotEmpty
          ? _passwordController.text
          : widget.customer?.password,
      currentStage: widget.customer?.currentStage,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
      createdAt: widget.customer?.createdAt ?? now,
      updatedAt: now,
    );

    if (widget.isEditMode) {
      widget.customerBloc.add(
        UpdateCustomer(widget.customer!.id, customer),
      );
    } else {
      widget.customerBloc.add(CreateCustomer(customer));
    }

    Navigator.pop(context);
  }
}
