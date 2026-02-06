import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Professional card with hover effects
class AppCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final bool enableHover;
  final Color? backgroundColor;
  final double borderRadius;
  final Border? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.enableHover = true,
    this.backgroundColor,
    this.borderRadius = 12,
    this.border,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.enableHover ? (_) => setState(() => _isHovered = true) : null,
      onExit: widget.enableHover ? (_) => setState(() => _isHovered = false) : null,
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: widget.margin ?? const EdgeInsets.all(0),
          padding: widget.padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.surface,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: widget.border ?? Border.all(
              color: _isHovered ? AppColors.primary.withOpacity(0.3) : AppColors.border.withOpacity(0.5),
              width: 1,
            ),
            boxShadow: _isHovered ? AppColors.cardShadowHover : AppColors.cardShadow,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Section card with header
class AppSectionCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget child;
  final List<Widget>? actions;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool collapsible;
  final bool initiallyExpanded;

  const AppSectionCard({
    super.key,
    required this.title,
    this.icon,
    required this.child,
    this.actions,
    this.padding,
    this.margin,
    this.collapsible = false,
    this.initiallyExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    if (collapsible) {
      return _buildCollapsible(context);
    }
    return _buildStatic(context);
  }

  Widget _buildStatic(BuildContext context) {
    return AppCard(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.zero,
      enableHover: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsible(BuildContext context) {
    return AppCard(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.zero,
      enableHover: false,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: padding ?? const EdgeInsets.all(16),
          leading: icon != null
              ? Icon(icon, color: AppColors.primary, size: 22)
              : null,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (actions != null) ...actions!,
              const SizedBox(width: 8),
              const Icon(Icons.expand_more),
            ],
          ),
          children: [child],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        border: const Border(
          bottom: BorderSide(color: AppColors.divider),
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}

/// Stats card for dashboard
class AppStatsCard extends StatefulWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;
  final Widget? trend;

  const AppStatsCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    this.color,
    this.onTap,
    this.trend,
  });

  @override
  State<AppStatsCard> createState() => _AppStatsCardState();
}

class _AppStatsCardState extends State<AppStatsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppColors.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? color.withOpacity(0.25) : AppColors.border.withOpacity(0.6),
            ),
            boxShadow: _isHovered ? AppColors.cardShadowHover : AppColors.cardShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(widget.icon, color: color, size: 24),
                  ),
                  if (widget.trend != null) widget.trend!,
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  widget.subtitle!,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textHint,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
