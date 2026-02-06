import 'package:freezed_annotation/freezed_annotation.dart';

part 'road_work.freezed.dart';
part 'road_work.g.dart';

@freezed
abstract class RoadWork with _$RoadWork {
  const factory RoadWork({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    // Step 1: تقديم الطلب
    @Default(false) @JsonKey(name: 'submit_request') bool submitRequest,
    @JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,
    @JsonKey(name: 'submit_request_notes') String? submitRequestNotes,

    // Step 2: التوريد (has money field)
    @Default(false) @JsonKey(name: 'supply') bool supply,
    @JsonKey(name: 'supply_date') DateTime? supplyDate,
    @JsonKey(name: 'supply_notes') String? supplyNotes,
    @JsonKey(name: 'supply_amount') double? supplyAmount,

    // Monthly renewal alert
    @JsonKey(name: 'renewal_date') DateTime? renewalDate,
    @JsonKey(name: 'renewal_alert_enabled') @Default(false) bool renewalAlertEnabled,

    // General stage notes
    @JsonKey(name: 'stage_notes') String? stageNotes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _RoadWork;

  const RoadWork._();

  factory RoadWork.fromJson(Map<String, dynamic> json) =>
      _$RoadWorkFromJson(json);

  static const int totalSteps = 2;

  int get completedSteps {
    int count = 0;
    if (submitRequest) count++;
    if (supply) count++;
    return count;
  }

  double get progress => (completedSteps / totalSteps) * 100;
  bool get isComplete => completedSteps == totalSteps;

  bool get needsRenewal {
    if (renewalDate == null) return false;
    return DateTime.now().isAfter(renewalDate!);
  }

  int? get daysUntilRenewal {
    if (renewalDate == null) return null;
    return renewalDate!.difference(DateTime.now()).inDays;
  }
}
