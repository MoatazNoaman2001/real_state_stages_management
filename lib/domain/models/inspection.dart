import 'package:freezed_annotation/freezed_annotation.dart';

part 'inspection.freezed.dart';
part 'inspection.g.dart';

@freezed
abstract class Inspection with _$Inspection {
  const factory Inspection({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    String? reason,
    @JsonKey(name: 'inspection_date') DateTime? inspectionDate,
    @Default('pending') String status,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Inspection;

  const Inspection._();

  factory Inspection.fromJson(Map<String, dynamic> json) =>
      _$InspectionFromJson(json);

  bool get isPending => status == 'pending';
  bool get isCompleted => status == 'completed';
  bool get isCancelled => status == 'cancelled';
}
