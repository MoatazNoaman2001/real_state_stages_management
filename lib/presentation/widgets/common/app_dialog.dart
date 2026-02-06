import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'app_button.dart';

/// Professional dialog with animations
class AppDialog extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget>? actions;
  final double? width;
  final double? maxHeight;
  final bool showCloseButton;
  final EdgeInsets? contentPadding;

  const AppDialog({
    super.key,
    this.title,
    required this.content,
    this.actions,
    this.width,
    this.maxHeight,
    this.showCloseButton = true,
    this.contentPadding,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return builder(context);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: width ?? 480,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.85,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              if (title != null || showCloseButton) _buildHeader(context),

              // Content
              Flexible(
                child: SingleChildScrollView(
                  padding: contentPadding ??
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: content,
                ),
              ),

              // Actions
              if (actions != null && actions!.isNotEmpty) _buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.divider.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          if (title != null)
            Expanded(
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            )
          else
            const Spacer(),
          if (showCloseButton)
            AppIconButton(
              icon: Icons.close,
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'إغلاق',
            ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant.withOpacity(0.3),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int i = 0; i < actions!.length; i++) ...[
            if (i > 0) const SizedBox(width: 12),
            actions![i],
          ],
        ],
      ),
    );
  }
}

/// Confirmation dialog
class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmText;
  final String? cancelText;
  final bool isDanger;
  final IconData? icon;

  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText,
    this.cancelText,
    this.isDanger = false,
    this.icon,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    bool isDanger = false,
    IconData? icon,
  }) {
    return AppDialog.show<bool>(
      context: context,
      builder: (context) => AppConfirmDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        isDanger: isDanger,
        icon: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      width: 400,
      showCloseButton: false,
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDanger
                  ? AppColors.errorLight
                  : AppColors.warningLight,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon ?? (isDanger ? Icons.delete_outline : Icons.help_outline),
              size: 32,
              color: isDanger ? AppColors.error : AppColors.warning,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        AppButton(
          text: cancelText ?? 'إلغاء',
          variant: AppButtonVariant.ghost,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppButton(
          text: confirmText ?? 'تأكيد',
          variant: isDanger ? AppButtonVariant.danger : AppButtonVariant.primary,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}

/// Form dialog base
class AppFormDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final String? saveText;
  final String? cancelText;
  final bool isLoading;
  final double? width;
  final GlobalKey<FormState>? formKey;

  const AppFormDialog({
    super.key,
    required this.title,
    required this.content,
    this.onSave,
    this.onCancel,
    this.saveText,
    this.cancelText,
    this.isLoading = false,
    this.width,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title,
      width: width ?? 500,
      content: Form(
        key: formKey,
        child: content,
      ),
      actions: [
        AppButton(
          text: cancelText ?? 'إلغاء',
          variant: AppButtonVariant.ghost,
          onPressed: isLoading ? null : (onCancel ?? () => Navigator.of(context).pop()),
        ),
        AppButton(
          text: saveText ?? 'حفظ',
          isLoading: isLoading,
          onPressed: onSave,
        ),
      ],
    );
  }
}

/// Toast notification helper
class AppToast {
  static void show({
    required BuildContext context,
    required String message,
    bool isError = false,
    bool isSuccess = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          if (isError || isSuccess) ...[
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: isError
          ? AppColors.error
          : (isSuccess ? AppColors.success : null),
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(16),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void success(BuildContext context, String message) {
    show(context: context, message: message, isSuccess: true);
  }

  static void error(BuildContext context, String message) {
    show(context: context, message: message, isError: true);
  }
}
