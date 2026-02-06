import 'package:flutter/material.dart';

/// Simple stage notice widget - shows at top of screens
class SimpleStageNotice extends StatelessWidget {
  final String? notice;
  final VoidCallback? onEdit;

  const SimpleStageNotice({
    super.key,
    this.notice,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    if (notice == null || notice!.isEmpty) {
      if (onEdit == null) return const SizedBox.shrink();

      // Show add button if no notice
      return Card(
        color: Colors.blue.shade50,
        child: InkWell(
          onTap: onEdit,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.add_comment, color: Colors.blue.shade700),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'إضافة ملاحظة عامة لهذه المرحلة',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.chevron_left, color: Colors.grey[400]),
              ],
            ),
          ),
        ),
      );
    }

    return Card(
      elevation: 3,
      color: Colors.amber.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.orange.shade700, size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'ملاحظات المرحلة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  if (onEdit != null)
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: onEdit,
                      tooltip: 'تعديل',
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                notice!,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ],
        ),
      ),
    );
  }

  /// Show edit dialog
  static Future<String?> showEditDialog(
    BuildContext context,
    String? currentNote,
  ) async {
    final controller = TextEditingController(text: currentNote);

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ملاحظات المرحلة'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'اكتب ملاحظة عامة لهذه المرحلة...',
            border: OutlineInputBorder(),
          ),
          maxLines: 5,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}
