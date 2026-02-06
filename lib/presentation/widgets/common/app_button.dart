import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

enum AppButtonVariant { primary, secondary, outline, ghost, danger }
enum AppButtonSize { small, medium, large }

/// Professional animated button with multiple variants
class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final bool iconRight;
  final bool isLoading;
  final bool isFullWidth;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.iconRight = false,
    this.isLoading = false,
    this.isFullWidth = false,
    this.width,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.onPressed == null || widget.isLoading;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: isDisabled ? null : (_) {
          setState(() => _isPressed = true);
        },
        onTapUp: isDisabled ? null : (_) {
          setState(() => _isPressed = false);
        },
        onTapCancel: isDisabled ? null : () {
          setState(() => _isPressed = false);
        },
        onTap: isDisabled ? null : widget.onPressed,
        child: Container(
          width: widget.isFullWidth ? double.infinity : widget.width,
          padding: _getPadding(),
          decoration: BoxDecoration(
            color: _getBackgroundColor(isDisabled),
            borderRadius: BorderRadius.circular(_getBorderRadius()),
            border: _getBorder(isDisabled),
            boxShadow: _getBoxShadow(isDisabled),
          ),
          child: Row(
            mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildContent(isDisabled),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(bool isDisabled) {
    final textColor = _getTextColor(isDisabled);
    final iconSize = _getIconSize();

    if (widget.isLoading) {
      return [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(textColor),
          ),
        ),
      ];
    }

    final textWidget = Text(
      widget.text,
      style: TextStyle(
        color: textColor,
        fontSize: _getFontSize(),
        fontWeight: FontWeight.w600,
      ),
    );

    if (widget.icon == null) {
      return [textWidget];
    }

    final iconWidget = Icon(
      widget.icon,
      size: iconSize,
      color: textColor,
    );

    final spacing = SizedBox(width: _getIconSpacing());

    if (widget.iconRight) {
      return [textWidget, spacing, iconWidget];
    }
    return [iconWidget, spacing, textWidget];
  }

  EdgeInsets _getPadding() {
    switch (widget.size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 28, vertical: 16);
    }
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case AppButtonSize.small:
        return 8;
      case AppButtonSize.medium:
        return 10;
      case AppButtonSize.large:
        return 12;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case AppButtonSize.small:
        return 13;
      case AppButtonSize.medium:
        return 14;
      case AppButtonSize.large:
        return 16;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 18;
      case AppButtonSize.large:
        return 20;
    }
  }

  double _getIconSpacing() {
    switch (widget.size) {
      case AppButtonSize.small:
        return 6;
      case AppButtonSize.medium:
        return 8;
      case AppButtonSize.large:
        return 10;
    }
  }

  Color _getBackgroundColor(bool isDisabled) {
    if (isDisabled) {
      return AppColors.surfaceVariant;
    }

    switch (widget.variant) {
      case AppButtonVariant.primary:
        return _isHovered ? AppColors.primaryDark : AppColors.primary;
      case AppButtonVariant.secondary:
        return _isHovered ? AppColors.secondaryDark : AppColors.secondary;
      case AppButtonVariant.outline:
      case AppButtonVariant.ghost:
        return _isHovered ? AppColors.primaryLight.withOpacity(0.1) : Colors.transparent;
      case AppButtonVariant.danger:
        return _isHovered ? AppColors.errorLight : AppColors.error;
    }
  }

  Color _getTextColor(bool isDisabled) {
    if (isDisabled) {
      return AppColors.textHint;
    }

    switch (widget.variant) {
      case AppButtonVariant.primary:
      case AppButtonVariant.secondary:
      case AppButtonVariant.danger:
        return AppColors.textOnPrimary;
      case AppButtonVariant.outline:
      case AppButtonVariant.ghost:
        return AppColors.primary;
    }
  }

  Border? _getBorder(bool isDisabled) {
    if (widget.variant == AppButtonVariant.outline) {
      return Border.all(
        color: isDisabled ? AppColors.divider : AppColors.primary,
        width: 1.5,
      );
    }
    return null;
  }

  List<BoxShadow>? _getBoxShadow(bool isDisabled) {
    if (isDisabled ||
        widget.variant == AppButtonVariant.ghost ||
        widget.variant == AppButtonVariant.outline) {
      return null;
    }

    if (_isHovered && !_isPressed) {
      return [
        BoxShadow(
          color: _getShadowColor().withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
    }

    return [
      BoxShadow(
        color: _getShadowColor().withOpacity(0.15),
        blurRadius: 4,
        offset: const Offset(0, 1),
      ),
    ];
  }

  Color _getShadowColor() {
    switch (widget.variant) {
      case AppButtonVariant.primary:
        return AppColors.primary;
      case AppButtonVariant.secondary:
        return AppColors.secondary;
      case AppButtonVariant.danger:
        return AppColors.error;
      default:
        return Colors.black;
    }
  }
}

/// Icon-only button with hover effects
class AppIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double size;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.size = 40,
    this.tooltip,
  });

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onPressed == null
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.backgroundColor ?? AppColors.surfaceVariant)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(widget.size / 4),
          ),
          child: Icon(
            widget.icon,
            size: widget.size * 0.5,
            color: widget.onPressed == null
                ? AppColors.textHint
                : (widget.color ?? AppColors.textSecondary),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }

    return button;
  }
}
