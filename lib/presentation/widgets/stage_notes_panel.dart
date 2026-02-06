import 'package:flutter/material.dart';

/// Reusable widget for displaying notes and alerts in stage screens
/// Shows a collapsible panel with field-specific notes and warnings
class StageNotesPanel extends StatefulWidget {
  final List<StageNote> notes;
  final VoidCallback? onAddNote;
  final Function(String noteId)? onDeleteNote;
  final String stageName;
  final bool hasWarnings;

  const StageNotesPanel({
    super.key,
    required this.notes,
    this.onAddNote,
    this.onDeleteNote,
    required this.stageName,
    this.hasWarnings = false,
  });

  @override
  State<StageNotesPanel> createState() => _StageNotesPanelState();
}

class _StageNotesPanelState extends State<StageNotesPanel> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: widget.hasWarnings ? 4 : 2,
      color: widget.hasWarnings ? Colors.orange.shade50 : null,
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.hasWarnings
                    ? Colors.orange.shade100
                    : Colors.blue.shade50,
                borderRadius: _isExpanded
                    ? const BorderRadius.vertical(top: Radius.circular(12))
                    : BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    widget.hasWarnings
                        ? Icons.warning_amber_rounded
                        : Icons.note_alt_outlined,
                    color: widget.hasWarnings ? Colors.orange : Colors.blue,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ملاحظات وتنبيهات - ${widget.stageName}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.notes.length} ملاحظة',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.hasWarnings)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'تنبيه',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
          ),

          // Content
          if (_isExpanded) ...[
            const Divider(height: 1),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notes List
                  if (widget.notes.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Icon(
                              Icons.note_add_outlined,
                              size: 48,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'لا توجد ملاحظات لهذه المرحلة',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ...widget.notes.map((note) => _buildNoteItem(note)),

                  // Add Note Button
                  if (widget.onAddNote != null) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: widget.onAddNote,
                        icon: const Icon(Icons.add, size: 20),
                        label: const Text('إضافة ملاحظة'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNoteItem(StageNote note) {
    Color statusColor;
    IconData statusIcon;

    switch (note.type) {
      case NoteType.warning:
        statusColor = Colors.orange;
        statusIcon = Icons.warning_amber_rounded;
        break;
      case NoteType.error:
        statusColor = Colors.red;
        statusIcon = Icons.error_outline_rounded;
        break;
      case NoteType.success:
        statusColor = Colors.green;
        statusIcon = Icons.check_circle_outline_rounded;
        break;
      case NoteType.info:
      default:
        statusColor = Colors.blue;
        statusIcon = Icons.info_outline_rounded;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.05),
        border: Border.all(
          color: statusColor.withOpacity(0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(statusIcon, color: statusColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.fieldName,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                    if (note.timestamp != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        _formatDate(note.timestamp!),
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (widget.onDeleteNote != null)
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  color: Colors.grey[600],
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => widget.onDeleteNote!(note.id),
                ),
            ],
          ),
          if (note.message.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              note.message,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return 'اليوم ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else if (dateToCheck == today.subtract(const Duration(days: 1))) {
      return 'أمس ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

/// Data model for a stage note
class StageNote {
  final String id;
  final String fieldName;
  final String message;
  final NoteType type;
  final DateTime? timestamp;

  const StageNote({
    required this.id,
    required this.fieldName,
    required this.message,
    this.type = NoteType.info,
    this.timestamp,
  });
}

/// Types of notes/alerts
enum NoteType {
  info,      // Blue - informational
  warning,   // Orange - needs attention
  error,     // Red - critical issue
  success,   // Green - completed successfully
}

/// Widget for inline note indicator (badge) next to fields
class NoteIndicator extends StatelessWidget {
  final int noteCount;
  final bool hasWarning;
  final VoidCallback? onTap;

  const NoteIndicator({
    super.key,
    required this.noteCount,
    this.hasWarning = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (noteCount == 0) return const SizedBox.shrink();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: hasWarning
              ? Colors.orange.withOpacity(0.1)
              : Colors.blue.withOpacity(0.1),
          border: Border.all(
            color: hasWarning
                ? Colors.orange.withOpacity(0.3)
                : Colors.blue.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              hasWarning ? Icons.warning_amber : Icons.note,
              size: 14,
              color: hasWarning ? Colors.orange : Colors.blue,
            ),
            const SizedBox(width: 4),
            Text(
              '$noteCount',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: hasWarning ? Colors.orange : Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Quick add note dialog
class QuickAddNoteDialog extends StatefulWidget {
  final List<String> availableFields;
  final Function(String fieldName, String message, NoteType type) onAdd;

  const QuickAddNoteDialog({
    super.key,
    required this.availableFields,
    required this.onAdd,
  });

  @override
  State<QuickAddNoteDialog> createState() => _QuickAddNoteDialogState();
}

class _QuickAddNoteDialogState extends State<QuickAddNoteDialog> {
  final _messageController = TextEditingController();
  String? _selectedField;
  NoteType _selectedType = NoteType.info;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.add_comment, color: Colors.blue),
          SizedBox(width: 12),
          Text('إضافة ملاحظة'),
        ],
      ),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Field Selection
            DropdownButtonFormField<String>(
              value: _selectedField,
              decoration: const InputDecoration(
                labelText: 'الحقل',
                border: OutlineInputBorder(),
              ),
              items: widget.availableFields.map((field) {
                return DropdownMenuItem(
                  value: field,
                  child: Text(field),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedField = value),
            ),
            const SizedBox(height: 16),

            // Note Type
            const Text(
              'نوع الملاحظة',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildTypeChip(NoteType.info, 'معلومة', Colors.blue, Icons.info),
                _buildTypeChip(NoteType.warning, 'تنبيه', Colors.orange, Icons.warning),
                _buildTypeChip(NoteType.error, 'خطأ', Colors.red, Icons.error),
                _buildTypeChip(NoteType.success, 'نجح', Colors.green, Icons.check_circle),
              ],
            ),
            const SizedBox(height: 16),

            // Message
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'الملاحظة',
                border: OutlineInputBorder(),
                hintText: 'اكتب ملاحظتك هنا...',
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _selectedField == null || _messageController.text.isEmpty
              ? null
              : () {
                  widget.onAdd(
                    _selectedField!,
                    _messageController.text,
                    _selectedType,
                  );
                  Navigator.pop(context);
                },
          child: const Text('إضافة'),
        ),
      ],
    );
  }

  Widget _buildTypeChip(NoteType type, String label, Color color, IconData icon) {
    final isSelected = _selectedType == type;
    return FilterChip(
      selected: isSelected,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: isSelected ? Colors.white : color),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
      onSelected: (selected) {
        if (selected) setState(() => _selectedType = type);
      },
      backgroundColor: color.withOpacity(0.1),
      selectedColor: color,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
