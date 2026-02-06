import 'package:flutter/material.dart';
import 'step_item_widget.dart';

/// A step definition for use in StepListWidget
class StepDefinition {
  final String name;
  final String displayName;
  final bool isCompleted;
  final DateTime? completedDate;
  final String? notes;
  final bool hasAmountField;
  final double? amount;
  final String? amountLabel;
  final bool isDateOnly;
  final bool isTextField;
  final String? textValue;

  StepDefinition({
    required this.name,
    required this.displayName,
    required this.isCompleted,
    this.completedDate,
    this.notes,
    this.hasAmountField = false,
    this.amount,
    this.amountLabel,
    this.isDateOnly = false,
    this.isTextField = false,
    this.textValue,
  });
}

/// Callback types for step interactions
typedef StepToggleCallback = void Function(String stepName, bool value);
typedef StepNotesCallback = void Function(String stepName, String? notes);
typedef StepAmountCallback = void Function(String stepName, double? amount);
typedef StepTextCallback = void Function(String stepName, String? text);
typedef StepDateCallback = void Function(String stepName, DateTime? date);

/// A reusable widget for displaying and managing a list of steps
class StepListWidget extends StatelessWidget {
  final List<StepDefinition> steps;
  final StepToggleCallback? onToggle;
  final StepNotesCallback? onNotesChanged;
  final StepAmountCallback? onAmountChanged;
  final StepTextCallback? onTextChanged;
  final StepDateCallback? onDateChanged;
  final bool showProgress;
  final String? progressLabel;

  const StepListWidget({
    super.key,
    required this.steps,
    this.onToggle,
    this.onNotesChanged,
    this.onAmountChanged,
    this.onTextChanged,
    this.onDateChanged,
    this.showProgress = true,
    this.progressLabel,
  });

  @override
  Widget build(BuildContext context) {
    final completedCount = steps.where((s) {
      if (s.isTextField) return s.textValue != null && s.textValue!.isNotEmpty;
      if (s.isDateOnly) return s.completedDate != null;
      return s.isCompleted;
    }).length;

    return Column(
      children: [
        if (showProgress)
          StepProgressWidget(
            completedSteps: completedCount,
            totalSteps: steps.length,
            label: progressLabel,
          ),
        Expanded(
          child: ListView.builder(
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final step = steps[index];
              return StepItemWidget(
                stepNumber: index + 1,
                title: step.displayName,
                isCompleted: step.isCompleted,
                completedDate: step.completedDate,
                notes: step.notes,
                amount: step.hasAmountField ? step.amount : null,
                amountLabel: step.amountLabel,
                isDateOnly: step.isDateOnly,
                isTextField: step.isTextField,
                textValue: step.textValue,
                onToggle: onToggle != null
                    ? () => onToggle!(step.name, !step.isCompleted)
                    : null,
                onNotesChanged: onNotesChanged != null
                    ? (notes) => onNotesChanged!(step.name, notes)
                    : null,
                onAmountChanged:
                    step.hasAmountField && onAmountChanged != null
                        ? (amount) => onAmountChanged!(step.name, amount)
                        : null,
                onTextChanged: step.isTextField && onTextChanged != null
                    ? (text) => onTextChanged!(step.name, text)
                    : null,
                onDateChanged: step.isDateOnly && onDateChanged != null
                    ? (date) => onDateChanged!(step.name, date)
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// A scaffold for step-based screens with consistent layout
class StepScreenScaffold extends StatelessWidget {
  final String title;
  final Widget? customerInfo;
  final List<StepDefinition> steps;
  final StepToggleCallback? onToggle;
  final StepNotesCallback? onNotesChanged;
  final StepAmountCallback? onAmountChanged;
  final StepTextCallback? onTextChanged;
  final StepDateCallback? onDateChanged;
  final String? progressLabel;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onRetry;

  const StepScreenScaffold({
    super.key,
    required this.title,
    this.customerInfo,
    required this.steps,
    this.onToggle,
    this.onNotesChanged,
    this.onAmountChanged,
    this.onTextChanged,
    this.onDateChanged,
    this.progressLabel,
    this.actions,
    this.floatingActionButton,
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: _buildBody(context),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildBody(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              errorMessage!,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('إعادة المحاولة'),
              ),
            ],
          ],
        ),
      );
    }

    return Column(
      children: [
        if (customerInfo != null) customerInfo!,
        Expanded(
          child: StepListWidget(
            steps: steps,
            onToggle: onToggle,
            onNotesChanged: onNotesChanged,
            onAmountChanged: onAmountChanged,
            onTextChanged: onTextChanged,
            onDateChanged: onDateChanged,
            progressLabel: progressLabel,
          ),
        ),
      ],
    );
  }
}

/// Customer info card for step screens
class CustomerInfoCard extends StatelessWidget {
  final String customerName;
  final String? ownerName;
  final String? plotNumber;
  final String? phone;
  final VoidCallback? onTap;

  const CustomerInfoCard({
    super.key,
    required this.customerName,
    this.ownerName,
    this.plotNumber,
    this.phone,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (ownerName != null)
                      Text(
                        'المالك: $ownerName',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    Row(
                      children: [
                        if (plotNumber != null) ...[
                          const Icon(Icons.location_on, size: 14),
                          Text(plotNumber!),
                          const SizedBox(width: 16),
                        ],
                        if (phone != null) ...[
                          const Icon(Icons.phone, size: 14),
                          Text(phone!),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                const Icon(Icons.chevron_left),
            ],
          ),
        ),
      ),
    );
  }
}
