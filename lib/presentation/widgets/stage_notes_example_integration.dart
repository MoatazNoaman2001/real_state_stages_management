/// EXAMPLE: How to integrate StageNotesPanel into your stage screens
///
/// This file shows the recommended way to add notes to any stage screen
/// Copy this pattern to: license_screen, excavation_permit_screen, etc.

import 'package:flutter/material.dart';
import 'stage_notes_panel.dart';

/// Example showing how to add notes to a stage screen
class StageScreenWithNotesExample extends StatefulWidget {
  const StageScreenWithNotesExample({super.key});

  @override
  State<StageScreenWithNotesExample> createState() => _StageScreenWithNotesExampleState();
}

class _StageScreenWithNotesExampleState extends State<StageScreenWithNotesExample> {
  // Store notes for this stage
  final List<StageNote> _notes = [];

  // Example: Map database notes to StageNote objects
  void _loadNotesFromModel() {
    // Example from architectural_modification model:
    // if (architecturalMod.drawBoardsNotes != null) {
    //   _notes.add(StageNote(
    //     id: 'draw_boards_${architecturalMod.id}',
    //     fieldName: 'رسم اللوحات',
    //     message: architecturalMod.drawBoardsNotes!,
    //     type: NoteType.info,
    //     timestamp: architecturalMod.drawBoardsDate,
    //   ));
    // }

    _notes.addAll([
      StageNote(
        id: '1',
        fieldName: 'رسم اللوحات',
        message: 'تم استلام الأوراق من المالك وجاري العمل على الرسومات',
        type: NoteType.info,
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
      ),
      StageNote(
        id: '2',
        fieldName: 'المعاينة على الطبيعة',
        message: 'تنبيه: موعد المعاينة بعد 3 أيام - يجب التحضير',
        type: NoteType.warning,
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      StageNote(
        id: '3',
        fieldName: 'تقديم الطلب',
        message: 'تم تقديم الطلب بنجاح ✓',
        type: NoteType.success,
        timestamp: DateTime.now(),
      ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _loadNotesFromModel();
  }

  @override
  Widget build(BuildContext context) {
    // Check if there are any warnings
    final hasWarnings = _notes.any((note) =>
        note.type == NoteType.warning || note.type == NoteType.error);

    return Scaffold(
      appBar: AppBar(
        title: const Text('مثال: مرحلة مع الملاحظات'),
        actions: [
          // Show warning badge in app bar if there are warnings
          if (hasWarnings)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.warning_amber, size: 16, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        '${_notes.where((n) => n.type == NoteType.warning || n.type == NoteType.error).length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Notes Panel at the top (recommended position)
            StageNotesPanel(
              notes: _notes,
              stageName: 'التعديلات المعمارية',
              hasWarnings: hasWarnings,
              onAddNote: _showAddNoteDialog,
              onDeleteNote: (noteId) => _deleteNote(noteId),
            ),

            const SizedBox(height: 24),

            // 2. Your regular form fields
            const Text(
              'الخطوات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Example: Checkbox with inline note indicator
            _buildStepWithNoteIndicator(
              stepName: 'رسم اللوحات',
              completed: true,
              noteCount: 1,
              hasWarning: false,
            ),

            _buildStepWithNoteIndicator(
              stepName: 'المعاينة على الطبيعة',
              completed: false,
              noteCount: 1,
              hasWarning: true,
            ),

            _buildStepWithNoteIndicator(
              stepName: 'رسم التعديلات المعمارية',
              completed: false,
              noteCount: 0,
              hasWarning: false,
            ),

            _buildStepWithNoteIndicator(
              stepName: 'تقديم الطلب',
              completed: true,
              noteCount: 1,
              hasWarning: false,
            ),

            const SizedBox(height: 24),

            // 3. Alternative: Floating Notes Button
            _buildFloatingNotesButton(hasWarnings),
          ],
        ),
      ),
    );
  }

  Widget _buildStepWithNoteIndicator({
    required String stepName,
    required bool completed,
    required int noteCount,
    required bool hasWarning,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: CheckboxListTile(
        value: completed,
        onChanged: (value) {},
        title: Row(
          children: [
            Expanded(child: Text(stepName)),
            // Inline note indicator
            NoteIndicator(
              noteCount: noteCount,
              hasWarning: hasWarning,
              onTap: () {
                // Optionally: scroll to notes panel or open notes dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$noteCount ملاحظة لـ $stepName'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
        secondary: Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildFloatingNotesButton(bool hasWarnings) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: hasWarnings ? Colors.orange.shade50 : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasWarnings
              ? Colors.orange.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            hasWarnings ? Icons.warning_amber : Icons.lightbulb_outline,
            color: hasWarnings ? Colors.orange : Colors.blue,
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasWarnings ? 'هناك تنبيهات تحتاج انتباه' : 'نصائح وملاحظات',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: hasWarnings ? Colors.orange : Colors.blue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_notes.length} ملاحظة مسجلة',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              // Scroll to notes panel or open dialog
            },
            child: const Text('عرض'),
          ),
        ],
      ),
    );
  }

  void _showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) => QuickAddNoteDialog(
        availableFields: const [
          'رسم اللوحات',
          'المعاينة على الطبيعة',
          'رسم التعديلات المعمارية',
          'تقديم الطلب',
          'رقم الطلب',
          'ميعاد المعاينة من الجهاز',
        ],
        onAdd: (fieldName, message, type) {
          setState(() {
            _notes.add(StageNote(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              fieldName: fieldName,
              message: message,
              type: type,
              timestamp: DateTime.now(),
            ));
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إضافة الملاحظة'),
              backgroundColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  void _deleteNote(String noteId) {
    setState(() {
      _notes.removeWhere((note) => note.id == noteId);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حذف الملاحظة'),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
