import 'package:freezed_annotation/freezed_annotation.dart';

part 'supervision_certificate.freezed.dart';
part 'supervision_certificate.g.dart';

@freezed
abstract class SupervisionCertificate with _$SupervisionCertificate {
  const factory SupervisionCertificate({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    @JsonKey(name: 'engineer_name') String? engineerName,
    @JsonKey(name: 'certificate_date') DateTime? certificateDate,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _SupervisionCertificate;

  factory SupervisionCertificate.fromJson(Map<String, dynamic> json) =>
      _$SupervisionCertificateFromJson(json);
}
