import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A widget representing a single step in a process
class StepItemWidget extends StatelessWidget {
  final int stepNumber;
  final String title;
  final bool isCompleted;
  final DateTime? completedDate;
  final String? notes;
  final double? amount;
  final String? amountLabel;
  final bool isDateOnly; // For steps that only have date (no checkbox)
  final bool isTextField; // For steps like request_number
  final String? textValue;
  final VoidCallback? onToggle;
  final Function(String?)? onNotesChanged;
  final Function(double?)? onAmountChanged;
  final Function(String?)? onTextChanged;
  final Function(DateTime?)? onDateChanged;

  const StepItemWidget({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.isCompleted,
    this.completedDate,
    this.notes,
    this.amount,
    this.amountLabel,
    this.isDateOnly = false,
    this.isTextField = false,
    this.textValue,
    this.onToggle,
    this.onNotesChanged,
    this.onAmountChanged,
    this.onTextChanged,
    this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy/MM/dd', 'ar');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ExpansionTile(
        leading: _buildLeading(),
        title: Row(
          children: [
            Text(
              '$stepNumber.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isCompleted ? Colors.green : Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                  color: isCompleted ? Colors.grey : null,
                ),
              ),
            ),
          ],
        ),
        subtitle: _buildSubtitle(dateFormat),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Date picker for date-only steps
                if (isDateOnly && onDateChanged != null)
                  _buildDatePicker(context),

                // Text field for text-based steps
                if (isTextField && onTextChanged != null)
                  _buildTextField(),

                // Amount field if applicable
                if (amount != null || onAmountChanged != null)
                  _buildAmountField(),

                // Notes field
                if (onNotesChanged != null)
                  _buildNotesField(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    if (isTextField) {
      return Icon(
        textValue != null && textValue!.isNotEmpty
            ? Icons.text_fields
            : Icons.text_fields_outlined,
        color: textValue != null && textValue!.isNotEmpty
            ? Colors.green
            : Colors.grey,
      );
    }

    if (isDateOnly) {
      return Icon(
        completedDate != null ? Icons.event_available : Icons.event,
        color: completedDate != null ? Colors.green : Colors.grey,
      );
    }

    return Checkbox(
      value: isCompleted,
      onChanged: onToggle != null ? (_) => onToggle!() : null,
      activeColor: Colors.green,
    );
  }

  Widget? _buildSubtitle(DateFormat dateFormat) {
    final parts = <String>[];

    if (completedDate != null) {
      parts.add(dateFormat.format(completedDate!));
    }

    if (isTextField && textValue != null && textValue!.isNotEmpty) {
      parts.add(textValue!);
    }

    if (amount != null && amount! > 0) {
      parts.add('${amount!.toStringAsFixed(2)} جنيه');
    }

    if (parts.isEmpty) return null;

    return Text(
      parts.join(' | '),
      style: const TextStyle(fontSize: 12),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              completedDate != null
                  ? DateFormat('yyyy/MM/dd').format(completedDate!)
                  : 'لم يتم تحديد التاريخ',
              style: TextStyle(
                color: completedDate != null ? null : Colors.grey,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: completedDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (date != null && onDateChanged != null) {
                onDateChanged!(date);
              }
            },
            icon: const Icon(Icons.calendar_today),
            label: const Text('اختر التاريخ'),
          ),
          if (completedDate != null)
            IconButton(
              onPressed: () => onDateChanged!(null),
              icon: const Icon(Icons.clear),
              tooltip: 'مسح التاريخ',
            ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        initialValue: textValue,
        decoration: const InputDecoration(
          labelText: 'القيمة',
          border: OutlineInputBorder(),
        ),
        onChanged: onTextChanged,
      ),
    );
  }

  Widget _buildAmountField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        initialValue: amount?.toStringAsFixed(2) ?? '',
        decoration: InputDecoration(
          labelText: amountLabel ?? 'المبلغ',
          border: const OutlineInputBorder(),
          suffixText: 'جنيه',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: (value) {
          if (onAmountChanged != null) {
            final parsed = double.tryParse(value);
            onAmountChanged!(parsed);
          }
        },
      ),
    );
  }

  Widget _buildNotesField() {
    return TextFormField(
      initialValue: notes,
      decoration: const InputDecoration(
        labelText: 'ملاحظات',
        border: OutlineInputBorder(),
        hintText: 'أضف ملاحظات...',
      ),
      maxLines: 3,
      onChanged: onNotesChanged,
    );
  }
}

/// Progress indicator for a process
class StepProgressWidget extends StatelessWidget {
  final int completedSteps;
  final int totalSteps;
  final String? label;

  const StepProgressWidget({
    super.key,
    required this.completedSteps,
    required this.totalSteps,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalSteps > 0 ? completedSteps / totalSteps : 0.0;
    final percentage = (progress * 100).toStringAsFixed(1);

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label ?? 'التقدم',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$completedSteps / $totalSteps ($percentage%)',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  progress >= 1.0
                      ? Colors.green
                      : progress >= 0.5
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Header for a step section
class StepSectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? trailing;

  const StepSectionHeader({
    super.key,
    required this.title,
    this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
