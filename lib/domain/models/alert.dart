import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

@freezed
abstract class Alert with _$Alert {
  const factory Alert({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    @JsonKey(name: 'alert_type') String? alertType,
    String? message,
    @JsonKey(name: 'alert_date') DateTime? alertDate,
    @Default(true) @JsonKey(name: 'is_active') bool isActive,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}
