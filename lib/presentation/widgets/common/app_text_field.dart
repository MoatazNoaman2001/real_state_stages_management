import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';

/// Professional text field with animations
class AppTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final IconData? prefixIcon;
  final Widget? suffix;
  final String? errorText;
  final String? helperText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffix,
    this.errorText,
    this.helperText,
    this.onChanged,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isHovered = false;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: hasError ? AppColors.error : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Container(
            decoration: BoxDecoration(
              color: widget.enabled
                  ? (_isFocused
                      ? AppColors.surface
                      : (_isHovered
                          ? AppColors.surfaceVariant
                          : AppColors.surfaceVariant))
                  : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: hasError
                    ? AppColors.error
                    : (_isFocused
                        ? AppColors.primary
                        : (_isHovered
                            ? AppColors.primary.withOpacity(0.3)
                            : AppColors.border)),
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.controller == null ? widget.initialValue : null,
              focusNode: _focusNode,
              keyboardType: widget.keyboardType,
              obscureText: _obscureText,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              validator: widget.validator,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction,
              onEditingComplete: widget.onEditingComplete,
              style: TextStyle(
                fontSize: 15,
                color: widget.enabled
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: AppColors.textHint,
                  fontSize: 15,
                ),
                prefixIcon: widget.prefixIcon != null
                    ? Icon(
                        widget.prefixIcon,
                        size: 20,
                        color: _isFocused
                            ? AppColors.primary
                            : AppColors.textSecondary,
                      )
                    : null,
                suffixIcon: widget.obscureText
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 20,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: () {
                          setState(() => _obscureText = !_obscureText);
                        },
                      )
                    : (widget.suffix != null
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: widget.suffix,
                          )
                        : null),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                counterText: '',
              ),
            ),
          ),
        ),
        if (widget.errorText != null || widget.helperText != null) ...[
          const SizedBox(height: 6),
          Text(
            widget.errorText ?? widget.helperText!,
            style: TextStyle(
              fontSize: 12,
              color: widget.errorText != null
                  ? AppColors.error
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}

/// Search field with animations
class AppSearchField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;

  const AppSearchField({
    super.key,
    this.hint = 'بحث...',
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateHasText);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _updateHasText() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: _controller,
      hint: widget.hint,
      prefixIcon: Icons.search,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.search,
      onEditingComplete: () {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(_controller.text);
        }
      },
      suffix: _hasText
          ? IconButton(
              icon: const Icon(
                Icons.close,
                size: 18,
                color: AppColors.textSecondary,
              ),
              onPressed: () {
                _controller.clear();
                widget.onClear?.call();
                widget.onChanged?.call('');
              },
            )
          : null,
    );
  }
}
