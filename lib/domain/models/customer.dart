import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
abstract class Customer with _$Customer {
  const factory Customer({
    required int id,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'owner_name') String? ownerName,
    String? phone,
    @JsonKey(name: 'plot_number') String? plotNumber,
    @JsonKey(name: 'project_number') String? projectNumber,
    String? username,
    String? password,
    @JsonKey(name: 'current_stage') String? currentStage,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
