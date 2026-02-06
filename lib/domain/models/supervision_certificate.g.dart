// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervision_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupervisionCertificate _$SupervisionCertificateFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SupervisionCertificate',
  json,
  ($checkedConvert) {
    final val = _SupervisionCertificate(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
      engineerName: $checkedConvert('engineer_name', (v) => v as String?),
      certificateDate: $checkedConvert(
        'certificate_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'customerId': 'customer_id',
    'engineerName': 'engineer_name',
    'certificateDate': 'certificate_date',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$SupervisionCertificateToJson(
  _SupervisionCertificate instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'engineer_name': ?instance.engineerName,
  'certificate_date': ?instance.certificateDate?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
