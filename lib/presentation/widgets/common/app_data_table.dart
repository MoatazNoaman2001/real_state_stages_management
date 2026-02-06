import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Column definition for AppDataTable
class AppTableColumn<T> {
  final String id;
  final String label;
  final double? width;
  final bool sortable;
  final Widget Function(T item)? cellBuilder;
  final String Function(T item)? valueGetter;
  final TextAlign align;

  const AppTableColumn({
    required this.id,
    required this.label,
    this.width,
    this.sortable = false,
    this.cellBuilder,
    this.valueGetter,
    this.align = TextAlign.start,
  });
}

/// Professional data table with sorting and hover effects
class AppDataTable<T> extends StatefulWidget {
  final List<AppTableColumn<T>> columns;
  final List<T> data;
  final String? Function(T item) idGetter;
  final void Function(T item)? onRowTap;
  final void Function(T item)? onRowDoubleTap;
  final List<Widget> Function(T item)? actionsBuilder;
  final String? sortColumn;
  final bool sortAscending;
  final void Function(String column, bool ascending)? onSort;
  final bool showCheckboxes;
  final Set<String>? selectedIds;
  final void Function(Set<String>)? onSelectionChanged;
  final bool isLoading;
  final Widget? emptyWidget;

  const AppDataTable({
    super.key,
    required this.columns,
    required this.data,
    required this.idGetter,
    this.onRowTap,
    this.onRowDoubleTap,
    this.actionsBuilder,
    this.sortColumn,
    this.sortAscending = true,
    this.onSort,
    this.showCheckboxes = false,
    this.selectedIds,
    this.onSelectionChanged,
    this.isLoading = false,
    this.emptyWidget,
  });

  @override
  State<AppDataTable<T>> createState() => _AppDataTableState<T>();
}

class _AppDataTableState<T> extends State<AppDataTable<T>> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (widget.data.isEmpty) {
      return widget.emptyWidget ??
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 48,
                    color: AppColors.textHint,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد بيانات',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          // Header
          _buildHeader(),
          const Divider(height: 1),
          // Body
          Expanded(
            child: ListView.separated(
              itemCount: widget.data.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) => _buildRow(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant.withOpacity(0.5),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        children: [
          if (widget.showCheckboxes)
            SizedBox(
              width: 56,
              child: Checkbox(
                value: widget.selectedIds?.length == widget.data.length &&
                    widget.data.isNotEmpty,
                tristate: true,
                onChanged: (value) {
                  if (value == true) {
                    final allIds = widget.data
                        .map((item) => widget.idGetter(item))
                        .whereType<String>()
                        .toSet();
                    widget.onSelectionChanged?.call(allIds);
                  } else {
                    widget.onSelectionChanged?.call({});
                  }
                },
              ),
            ),
          ...widget.columns.map((column) => _buildHeaderCell(column)),
          if (widget.actionsBuilder != null)
            const SizedBox(width: 120),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(AppTableColumn<T> column) {
    final isSorted = widget.sortColumn == column.id;

    return Expanded(
      flex: column.width != null ? 0 : 1,
      child: SizedBox(
        width: column.width,
        child: InkWell(
          onTap: column.sortable && widget.onSort != null
              ? () {
                  final ascending = isSorted ? !widget.sortAscending : true;
                  widget.onSort!(column.id, ascending);
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: column.align == TextAlign.end
                  ? MainAxisAlignment.end
                  : (column.align == TextAlign.center
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start),
              children: [
                Text(
                  column.label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                if (column.sortable) ...[
                  const SizedBox(width: 4),
                  Icon(
                    isSorted
                        ? (widget.sortAscending
                            ? Icons.arrow_upward
                            : Icons.arrow_downward)
                        : Icons.unfold_more,
                    size: 16,
                    color: isSorted
                        ? AppColors.primary
                        : AppColors.textHint,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(int index) {
    final item = widget.data[index];
    final id = widget.idGetter(item);
    final isSelected = widget.selectedIds?.contains(id) ?? false;
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: GestureDetector(
        onTap: () => widget.onRowTap?.call(item),
        onDoubleTap: () => widget.onRowDoubleTap?.call(item),
        child: Container(
          color: isSelected
              ? AppColors.primaryLight.withOpacity(0.15)
              : (isHovered ? AppColors.surfaceVariant.withOpacity(0.5) : null),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              if (widget.showCheckboxes)
                SizedBox(
                  width: 56,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      final newSelection =
                          Set<String>.from(widget.selectedIds ?? {});
                      if (value == true && id != null) {
                        newSelection.add(id);
                      } else if (id != null) {
                        newSelection.remove(id);
                      }
                      widget.onSelectionChanged?.call(newSelection);
                    },
                  ),
                ),
              ...widget.columns.map((column) => _buildCell(item, column)),
              if (widget.actionsBuilder != null)
                SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.actionsBuilder!(item),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCell(T item, AppTableColumn<T> column) {
    Widget content;

    if (column.cellBuilder != null) {
      content = column.cellBuilder!(item);
    } else if (column.valueGetter != null) {
      content = Text(
        column.valueGetter!(item),
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
        textAlign: column.align,
      );
    } else {
      content = const SizedBox();
    }

    return Expanded(
      flex: column.width != null ? 0 : 1,
      child: SizedBox(
        width: column.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: column.align == TextAlign.end
              ? Align(alignment: Alignment.centerLeft, child: content)
              : (column.align == TextAlign.center
                  ? Center(child: content)
                  : content),
        ),
      ),
    );
  }
}

/// Status badge for tables
class AppStatusBadge extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;

  const AppStatusBadge({
    super.key,
    required this.text,
    required this.color,
    this.icon,
  });

  factory AppStatusBadge.success(String text) => AppStatusBadge(
        text: text,
        color: AppColors.success,
        icon: Icons.check_circle_outline,
      );

  factory AppStatusBadge.warning(String text) => AppStatusBadge(
        text: text,
        color: AppColors.warning,
        icon: Icons.warning_amber_outlined,
      );

  factory AppStatusBadge.error(String text) => AppStatusBadge(
        text: text,
        color: AppColors.error,
        icon: Icons.error_outline,
      );

  factory AppStatusBadge.info(String text) => AppStatusBadge(
        text: text,
        color: AppColors.info,
        icon: Icons.info_outline,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
