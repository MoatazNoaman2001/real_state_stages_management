import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheduled_alert.freezed.dart';
part 'scheduled_alert.g.dart';

enum RepeatType {
  @JsonValue('once')
  once,
  @JsonValue('daily')
  daily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('monthly')
  monthly,
}

@freezed
abstract class ScheduledAlert with _$ScheduledAlert {
  const factory ScheduledAlert({
    required int id,
    @JsonKey(name: 'customer_id') int? customerId,

    // Alert details
    required String title,
    String? message,
    @JsonKey(name: 'alert_date') required DateTime alertDate,
    @JsonKey(name: 'alert_time') String? alertTime,

    // Repeat settings
    @JsonKey(name: 'repeat_type') @Default(RepeatType.once) RepeatType repeatType,

    // Status
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'is_triggered') @Default(false) bool isTriggered,

    // Related entity (for linking to specific records)
    @JsonKey(name: 'related_table') String? relatedTable,
    @JsonKey(name: 'related_id') int? relatedId,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ScheduledAlert;

  const ScheduledAlert._();

  factory ScheduledAlert.fromJson(Map<String, dynamic> json) =>
      _$ScheduledAlertFromJson(json);

  /// Check if alert is due (current time >= alert time)
  bool get isDue {
    final now = DateTime.now();
    return now.isAfter(alertDate) || now.isAtSameMomentAs(alertDate);
  }

  /// Check if alert is upcoming (within specified hours)
  bool isUpcoming({int hours = 24}) {
    final now = DateTime.now();
    final threshold = now.add(Duration(hours: hours));
    return alertDate.isAfter(now) && alertDate.isBefore(threshold);
  }

  /// Get days until alert
  int get daysUntilAlert {
    return alertDate.difference(DateTime.now()).inDays;
  }

  /// Get human-readable repeat type in Arabic
  String get repeatTypeArabic {
    switch (repeatType) {
      case RepeatType.once:
        return 'مرة واحدة';
      case RepeatType.daily:
        return 'يومياً';
      case RepeatType.weekly:
        return 'أسبوعياً';
      case RepeatType.monthly:
        return 'شهرياً';
    }
  }

  /// Calculate next alert date based on repeat type
  DateTime? get nextAlertDate {
    if (!isActive || repeatType == RepeatType.once) return null;

    final now = DateTime.now();
    var next = alertDate;

    while (next.isBefore(now)) {
      switch (repeatType) {
        case RepeatType.daily:
          next = next.add(const Duration(days: 1));
          break;
        case RepeatType.weekly:
          next = next.add(const Duration(days: 7));
          break;
        case RepeatType.monthly:
          next = DateTime(next.year, next.month + 1, next.day);
          break;
        case RepeatType.once:
          return null;
      }
    }

    return next;
  }
}
