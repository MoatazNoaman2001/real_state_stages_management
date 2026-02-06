import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';

/// Professional checkbox tile for step items
class AppCheckboxTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final DateTime? completedDate;
  final bool enabled;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;
  final Widget? trailing;
  final int? stepNumber;

  const AppCheckboxTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    this.completedDate,
    this.enabled = true,
    this.onChanged,
    this.onTap,
    this.trailing,
    this.stepNumber,
  });

  @override
  State<AppCheckboxTile> createState() => _AppCheckboxTileState();
}

class _AppCheckboxTileState extends State<AppCheckboxTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy/MM/dd', 'ar');

    return MouseRegion(
      onEnter: (_) {
        if (widget.enabled) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: widget.value
              ? AppColors.successLight.withOpacity(0.5)
              : (_isHovered ? AppColors.surfaceVariant : AppColors.surface),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.value
                ? AppColors.success.withOpacity(0.3)
                : (_isHovered
                    ? AppColors.primary.withOpacity(0.3)
                    : AppColors.border.withOpacity(0.5)),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.enabled
                ? () {
                    widget.onTap?.call();
                    widget.onChanged?.call(!widget.value);
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Step number or checkbox
                  _buildLeading(),
                  const SizedBox(width: 12),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: widget.enabled
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                            decoration: widget.value
                                ? TextDecoration.lineThrough
                                : null,
                            decorationColor: AppColors.success,
                          ),
                        ),
                        if (widget.subtitle != null ||
                            widget.completedDate != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              if (widget.completedDate != null) ...[
                                Icon(
                                  Icons.check_circle_outline,
                                  size: 14,
                                  color: AppColors.success,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  dateFormat.format(widget.completedDate!),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.success,
                                  ),
                                ),
                                if (widget.subtitle != null)
                                  const SizedBox(width: 12),
                              ],
                              if (widget.subtitle != null)
                                Expanded(
                                  child: Text(
                                    widget.subtitle!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Trailing
                  if (widget.trailing != null) ...[
                    const SizedBox(width: 8),
                    widget.trailing!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeading() {
    if (widget.stepNumber != null) {
      return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: widget.value
              ? AppColors.success
              : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: widget.value
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                )
              : Text(
                  '${widget.stepNumber}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
        ),
      );
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: widget.value ? AppColors.success : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: widget.value ? AppColors.success : AppColors.textHint,
          width: 2,
        ),
      ),
      child: widget.value
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            )
          : null,
    );
  }
}

/// Expandable step tile with notes and amount fields
class AppExpandableStepTile extends StatefulWidget {
  final int stepNumber;
  final String title;
  final bool isCompleted;
  final DateTime? completedDate;
  final String? notes;
  final double? amount;
  final String? amountLabel;
  final bool hasAmountField;
  final bool hasNotesField;
  final bool enabled;
  final ValueChanged<bool>? onCompletedChanged;
  final ValueChanged<String?>? onNotesChanged;
  final ValueChanged<double?>? onAmountChanged;

  const AppExpandableStepTile({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.isCompleted,
    this.completedDate,
    this.notes,
    this.amount,
    this.amountLabel,
    this.hasAmountField = false,
    this.hasNotesField = true,
    this.enabled = true,
    this.onCompletedChanged,
    this.onNotesChanged,
    this.onAmountChanged,
  });

  @override
  State<AppExpandableStepTile> createState() => _AppExpandableStepTileState();
}

class _AppExpandableStepTileState extends State<AppExpandableStepTile> {
  bool _isExpanded = false;
  late TextEditingController _notesController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes);
    _amountController = TextEditingController(
      text: widget.amount?.toStringAsFixed(2) ?? '',
    );
  }

  @override
  void didUpdateWidget(AppExpandableStepTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.notes != widget.notes) {
      _notesController.text = widget.notes ?? '';
    }
    if (oldWidget.amount != widget.amount) {
      _amountController.text = widget.amount?.toStringAsFixed(2) ?? '';
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy/MM/dd', 'ar');
    final hasDetails = widget.hasNotesField || widget.hasAmountField;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: widget.isCompleted
            ? AppColors.successLight.withOpacity(0.3)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.isCompleted
              ? AppColors.success.withValues(alpha: 0.3) :
          AppColors.border.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          // Main row
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.enabled
                ? () => widget.onCompletedChanged?.call(!widget.isCompleted)
                : null,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Step indicator
                  _buildStepIndicator(),
                  const SizedBox(width: 12),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (widget.completedDate != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 12,
                                color: AppColors.success,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                dateFormat.format(widget.completedDate!),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.success,
                                ),
                              ),
                              if (widget.amount != null && widget.amount! > 0) ...[
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.payments_outlined,
                                  size: 12,
                                  color: AppColors.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${widget.amount!.toStringAsFixed(2)} جنيه',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Expand button
                  if (hasDetails)
                    IconButton(
                      icon: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () {
                        setState(() => _isExpanded = !_isExpanded);
                      },
                    ),
                ],
              ),
            ),
          ),

          // Expanded content
          if (_isExpanded) _buildExpandedContent(),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: widget.isCompleted
            ? AppColors.success
            : AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: widget.isCompleted
            ? const Icon(Icons.check, color: Colors.white, size: 22)
            : Text(
                '${widget.stepNumber}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 8),

          // Amount field
          if (widget.hasAmountField) ...[
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: widget.amountLabel ?? 'المبلغ',
                suffixText: 'جنيه',
                prefixIcon: const Icon(Icons.payments_outlined),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                widget.onAmountChanged?.call(double.tryParse(value));
              },
            ),
            const SizedBox(height: 12),
          ],

          // Notes field
          if (widget.hasNotesField)
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'ملاحظات',
                hintText: 'أضف ملاحظات...',
                prefixIcon: Icon(Icons.notes_outlined),
              ),
              maxLines: 2,
              onChanged: widget.onNotesChanged,
            ),
        ],
      ),
    );
  }
}
