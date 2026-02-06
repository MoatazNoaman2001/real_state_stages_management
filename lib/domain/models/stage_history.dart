import 'package:freezed_annotation/freezed_annotation.dart';

part 'stage_history.freezed.dart';
part 'stage_history.g.dart';

@freezed
abstract class StageHistory with _$StageHistory {
  const factory StageHistory({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    @JsonKey(name: 'stage_name') String? stageName,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'duration_days') int? durationDays,

    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _StageHistory;

  const StageHistory._();

  factory StageHistory.fromJson(Map<String, dynamic> json) =>
      _$StageHistoryFromJson(json);

  bool get isCompleted => completedAt != null;
  bool get isInProgress => startedAt != null && completedAt == null;
}
