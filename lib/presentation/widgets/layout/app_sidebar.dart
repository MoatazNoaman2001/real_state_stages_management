import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Navigation item data
class NavItem {
  final String id;
  final String label;
  final IconData icon;
  final IconData? activeIcon;
  final String? badge;
  final List<NavItem>? children;

  const NavItem({
    required this.id,
    required this.label,
    required this.icon,
    this.activeIcon,
    this.badge,
    this.children,
  });
}

/// Professional animated sidebar
class AppSidebar extends StatefulWidget {
  final List<NavItem> items;
  final String selectedId;
  final ValueChanged<String> onItemSelected;
  final bool isCollapsed;
  final VoidCallback? onToggleCollapse;
  final String? title;
  final Widget? header;
  final Widget? footer;

  const AppSidebar({
    super.key,
    required this.items,
    required this.selectedId,
    required this.onItemSelected,
    this.isCollapsed = false,
    this.onToggleCollapse,
    this.title,
    this.header,
    this.footer,
  });

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  static const double _expandedWidth = 260;
  static const double _collapsedWidth = 72;

  @override
  Widget build(BuildContext context) {
    final width = widget.isCollapsed ? _collapsedWidth : _expandedWidth;

    return Container(
      width: width,
      decoration: const BoxDecoration(
        gradient: AppColors.sidebarGradient,
      ),
      child: Column(
        children: [
          // Header
          _buildHeader(),

          // Navigation items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: widget.items
                  .map((item) => _buildNavItem(item))
                  .toList(),
            ),
          ),

          // Footer
          if (widget.footer != null) widget.footer!,

          // Collapse toggle
          _buildCollapseToggle(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (widget.header != null) {
      return widget.header!;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: widget.isCollapsed
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.business,
                color: Colors.white,
                size: 24,
              ),
            )
          : Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title ?? 'إدارة المشاريع',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildNavItem(NavItem item) {
    final isSelected = widget.selectedId == item.id;
    final hasChildren = item.children != null && item.children!.isNotEmpty;

    return _NavItemWidget(
      item: item,
      isSelected: isSelected,
      isCollapsed: widget.isCollapsed,
      onTap: () => widget.onItemSelected(item.id),
      hasChildren: hasChildren,
    );
  }

  Widget _buildCollapseToggle() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onToggleCollapse,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  widget.isCollapsed
                      ? Icons.chevron_left
                      : Icons.chevron_right,
                  color: Colors.white.withValues(alpha: 0.7),
                  size: 20,
                ),
                if (!widget.isCollapsed) ...[
                  const SizedBox(width: 8),
                  Text(
                    'تصغير',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemWidget extends StatefulWidget {
  final NavItem item;
  final bool isSelected;
  final bool isCollapsed;
  final VoidCallback onTap;
  final bool hasChildren;

  const _NavItemWidget({
    required this.item,
    required this.isSelected,
    required this.isCollapsed,
    required this.onTap,
    required this.hasChildren,
  });

  @override
  State<_NavItemWidget> createState() => _NavItemWidgetState();
}

class _NavItemWidgetState extends State<_NavItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final icon = widget.isSelected
        ? (widget.item.activeIcon ?? widget.item.icon)
        : widget.item.icon;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: widget.isCollapsed ? widget.item.label : '',
        preferBelow: false,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: widget.isCollapsed ? 12 : 8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.sidebarItemActive
                : (_isHovered ? AppColors.sidebarItemHover : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: widget.onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.isCollapsed ? 12 : 14,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: widget.isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.7),
                      size: 22,
                    ),
                    if (!widget.isCollapsed) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.item.label,
                          style: TextStyle(
                            color: widget.isSelected
                                ? Colors.white
                                : Colors.white.withOpacity(0.85),
                            fontSize: 14,
                            fontWeight: widget.isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (widget.item.badge != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.item.badge!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
