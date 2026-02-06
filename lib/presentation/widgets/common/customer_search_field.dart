import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/models/customer.dart';
import '../../../domain/services/customer_service.dart';

/// Searchable customer picker with debounced search and overlay dropdown
class CustomerSearchField extends StatefulWidget {
  final ValueChanged<Customer?> onSelected;
  final Customer? initialCustomer;

  const CustomerSearchField({
    super.key,
    required this.onSelected,
    this.initialCustomer,
  });

  @override
  State<CustomerSearchField> createState() => _CustomerSearchFieldState();
}

class _CustomerSearchFieldState extends State<CustomerSearchField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  final CustomerService _customerService = getIt<CustomerService>();

  OverlayEntry? _overlayEntry;
  List<Customer> _results = [];
  bool _isLoading = false;
  bool _isSelected = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    if (widget.initialCustomer != null) {
      _controller.text = widget.initialCustomer!.customerName;
      _isSelected = true;
    }
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _removeOverlay();
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      // Delay removal to allow tap on overlay items
      Future.delayed(const Duration(milliseconds: 200), () {
        if (!_focusNode.hasFocus) {
          _removeOverlay();
        }
      });
    }
  }

  void _onSearchChanged(String query) {
    if (_isSelected) return;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _search(query);
    });
  }

  Future<void> _search(String query) async {
    if (query.trim().isEmpty) {
      _removeOverlay();
      setState(() {
        _results = [];
        _isLoading = false;
      });
      return;
    }

    setState(() => _isLoading = true);
    _showOverlay();

    try {
      final results = await _customerService.searchCustomers(query);
      if (mounted) {
        setState(() {
          _results = results;
          _isLoading = false;
        });
        _showOverlay();
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _results = [];
          _isLoading = false;
        });
        _showOverlay();
      }
    }
  }

  void _selectCustomer(Customer customer) {
    setState(() {
      _controller.text = customer.customerName;
      _isSelected = true;
      _results = [];
    });
    _removeOverlay();
    widget.onSelected(customer);
  }

  void _clearSelection() {
    setState(() {
      _controller.clear();
      _isSelected = false;
      _results = [];
    });
    widget.onSelected(null);
    _focusNode.requestFocus();
  }

  void _showOverlay() {
    _removeOverlay();

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final width = renderBox.size.width;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, renderBox.size.height + 4),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            color: AppColors.surface,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 220),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _buildOverlayContent(),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  Widget _buildOverlayContent() {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (_results.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            '\u0644\u0627 \u062a\u0648\u062c\u062f \u0646\u062a\u0627\u0626\u062c',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 4),
      shrinkWrap: true,
      itemCount: _results.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final customer = _results[index];
        return InkWell(
          borderRadius: index == 0
              ? const BorderRadius.vertical(top: Radius.circular(10))
              : index == _results.length - 1
                  ? const BorderRadius.vertical(bottom: Radius.circular(10))
                  : BorderRadius.zero,
          onTap: () => _selectCustomer(customer),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primaryLight.withValues(alpha: 0.2),
                  child: const Icon(
                    Icons.person,
                    size: 18,
                    color: AppColors.primary,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (customer.plotNumber != null &&
                          customer.plotNumber!.isNotEmpty)
                        Text(
                          '\u0642\u0637\u0639\u0629 ${customer.plotNumber}',
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
        );
      },
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '\u0627\u0644\u0639\u0645\u064a\u0644',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: _isSelected
                  ? AppColors.surfaceVariant
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _focusNode.hasFocus
                    ? AppColors.primary
                    : AppColors.border,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 4),
                  child: Icon(
                    Icons.person_search,
                    size: 20,
                    color: _focusNode.hasFocus
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    readOnly: _isSelected,
                    onChanged: _onSearchChanged,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: '\u0627\u0628\u062d\u062b \u0639\u0646 \u0639\u0645\u064a\u0644...',
                      hintStyle: const TextStyle(
                        color: AppColors.textHint,
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
                if (_isSelected)
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: _clearSelection,
                    tooltip: '\u0645\u0633\u062d',
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
