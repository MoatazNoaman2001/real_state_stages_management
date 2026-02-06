import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Animated circular progress indicator
class AppCircularProgress extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final double strokeWidth;
  final Color? progressColor;
  final Color? backgroundColor;
  final Widget? center;
  final bool showPercentage;

  const AppCircularProgress({
    super.key,
    required this.progress,
    this.size = 80,
    this.strokeWidth = 8,
    this.progressColor,
    this.backgroundColor,
    this.center,
    this.showPercentage = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = progressColor ?? _getColorByProgress(progress);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: strokeWidth,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(
                backgroundColor ?? AppColors.surfaceVariant,
              ),
            ),
          ),
          // Progress circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: strokeWidth,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(color),
              strokeCap: StrokeCap.round,
            ),
          ),
          // Center content
          if (center != null)
            center!
          else if (showPercentage)
            Text(
              '${(progress * 100).toInt()}%',
              style: TextStyle(
                fontSize: size * 0.2,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
        ],
      ),
    );
  }

  Color _getColorByProgress(double progress) {
    if (progress >= 1.0) return AppColors.success;
    if (progress >= 0.7) return AppColors.secondary;
    if (progress >= 0.4) return AppColors.warning;
    return AppColors.error;
  }
}

/// Animated linear progress bar
class AppLinearProgress extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double height;
  final Color? progressColor;
  final Color? backgroundColor;
  final bool showLabel;
  final String? label;
  final BorderRadius? borderRadius;

  const AppLinearProgress({
    super.key,
    required this.progress,
    this.height = 8,
    this.progressColor,
    this.backgroundColor,
    this.showLabel = false,
    this.label,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final color = progressColor ?? _getColorByProgress(progress);
    final radius = borderRadius ?? BorderRadius.circular(height / 2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel || label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              Text(
                '${(progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
        Container(
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.surfaceVariant,
            borderRadius: radius,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    width: constraints.maxWidth * progress,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: radius,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getColorByProgress(double progress) {
    if (progress >= 1.0) return AppColors.success;
    if (progress >= 0.7) return AppColors.secondary;
    if (progress >= 0.4) return AppColors.warning;
    return AppColors.error;
  }
}

/// Step progress indicator (numbered steps)
class AppStepProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String>? stepLabels;
  final bool showLabels;

  const AppStepProgress({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.stepLabels,
    this.showLabels = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps * 2 - 1, (index) {
        if (index.isOdd) {
          // Connector line
          final stepIndex = index ~/ 2;
          final isCompleted = stepIndex < currentStep;
          return Expanded(
            child: Container(
              height: 3,
              color: isCompleted ? AppColors.success : AppColors.surfaceVariant,
            ),
          );
        }

        // Step circle
        final stepIndex = index ~/ 2;
        final isCompleted = stepIndex < currentStep;
        final isCurrent = stepIndex == currentStep;

        return _buildStepCircle(
          stepIndex + 1,
          isCompleted: isCompleted,
          isCurrent: isCurrent,
          label: stepLabels != null && stepIndex < stepLabels!.length
              ? stepLabels![stepIndex]
              : null,
        );
      }),
    );
  }

  Widget _buildStepCircle(
    int number, {
    required bool isCompleted,
    required bool isCurrent,
    String? label,
  }) {
    final color = isCompleted
        ? AppColors.success
        : (isCurrent ? AppColors.primary : AppColors.surfaceVariant);
    final textColor = isCompleted || isCurrent
        ? AppColors.textOnPrimary
        : AppColors.textSecondary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    '$number',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
          ),
        ),
        if (showLabels && label != null) ...[
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isCurrent ? AppColors.primary : AppColors.textSecondary,
              fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
