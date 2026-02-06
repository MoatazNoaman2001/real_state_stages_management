// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExecutionStage _$ExecutionStageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ExecutionStage',
  json,
  ($checkedConvert) {
    final val = _ExecutionStage(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
      survey1: $checkedConvert('survey_1', (v) => v as bool? ?? false),
      survey1Date: $checkedConvert(
        'survey_1_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      survey1Notes: $checkedConvert('survey_1_notes', (v) => v as String?),
      excavation: $checkedConvert('excavation', (v) => v as bool? ?? false),
      excavationDate: $checkedConvert(
        'excavation_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      excavationNotes: $checkedConvert('excavation_notes', (v) => v as String?),
      replacement: $checkedConvert('replacement', (v) => v as bool? ?? false),
      replacementDate: $checkedConvert(
        'replacement_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      replacementNotes: $checkedConvert(
        'replacement_notes',
        (v) => v as String?,
      ),
      survey2: $checkedConvert('survey_2', (v) => v as bool? ?? false),
      survey2Date: $checkedConvert(
        'survey_2_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      survey2Notes: $checkedConvert('survey_2_notes', (v) => v as String?),
      plainConcrete: $checkedConvert(
        'plain_concrete',
        (v) => v as bool? ?? false,
      ),
      plainConcreteDate: $checkedConvert(
        'plain_concrete_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      plainConcreteNotes: $checkedConvert(
        'plain_concrete_notes',
        (v) => v as String?,
      ),
      reinforcedConcrete: $checkedConvert(
        'reinforced_concrete',
        (v) => v as bool? ?? false,
      ),
      reinforcedConcreteDate: $checkedConvert(
        'reinforced_concrete_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      reinforcedConcreteNotes: $checkedConvert(
        'reinforced_concrete_notes',
        (v) => v as String?,
      ),
      basementColumns: $checkedConvert(
        'basement_columns',
        (v) => v as bool? ?? false,
      ),
      basementColumnsDate: $checkedConvert(
        'basement_columns_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      basementColumnsNotes: $checkedConvert(
        'basement_columns_notes',
        (v) => v as String?,
      ),
      basementCeiling: $checkedConvert(
        'basement_ceiling',
        (v) => v as bool? ?? false,
      ),
      basementCeilingDate: $checkedConvert(
        'basement_ceiling_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      basementCeilingNotes: $checkedConvert(
        'basement_ceiling_notes',
        (v) => v as String?,
      ),
      groundColumns: $checkedConvert(
        'ground_columns',
        (v) => v as bool? ?? false,
      ),
      groundColumnsDate: $checkedConvert(
        'ground_columns_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      groundColumnsNotes: $checkedConvert(
        'ground_columns_notes',
        (v) => v as String?,
      ),
      groundCeiling: $checkedConvert(
        'ground_ceiling',
        (v) => v as bool? ?? false,
      ),
      groundCeilingDate: $checkedConvert(
        'ground_ceiling_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      groundCeilingNotes: $checkedConvert(
        'ground_ceiling_notes',
        (v) => v as String?,
      ),
      firstColumns: $checkedConvert(
        'first_columns',
        (v) => v as bool? ?? false,
      ),
      firstColumnsDate: $checkedConvert(
        'first_columns_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      firstColumnsNotes: $checkedConvert(
        'first_columns_notes',
        (v) => v as String?,
      ),
      firstCeiling: $checkedConvert(
        'first_ceiling',
        (v) => v as bool? ?? false,
      ),
      firstCeilingDate: $checkedConvert(
        'first_ceiling_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      firstCeilingNotes: $checkedConvert(
        'first_ceiling_notes',
        (v) => v as String?,
      ),
      secondColumns: $checkedConvert(
        'second_columns',
        (v) => v as bool? ?? false,
      ),
      secondColumnsDate: $checkedConvert(
        'second_columns_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      secondColumnsNotes: $checkedConvert(
        'second_columns_notes',
        (v) => v as String?,
      ),
      secondCeiling: $checkedConvert(
        'second_ceiling',
        (v) => v as bool? ?? false,
      ),
      secondCeilingDate: $checkedConvert(
        'second_ceiling_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      secondCeilingNotes: $checkedConvert(
        'second_ceiling_notes',
        (v) => v as String?,
      ),
      thirdColumns: $checkedConvert(
        'third_columns',
        (v) => v as bool? ?? false,
      ),
      thirdColumnsDate: $checkedConvert(
        'third_columns_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      thirdColumnsNotes: $checkedConvert(
        'third_columns_notes',
        (v) => v as String?,
      ),
      thirdCeiling: $checkedConvert(
        'third_ceiling',
        (v) => v as bool? ?? false,
      ),
      thirdCeilingDate: $checkedConvert(
        'third_ceiling_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      thirdCeilingNotes: $checkedConvert(
        'third_ceiling_notes',
        (v) => v as String?,
      ),
      fourthColumns: $checkedConvert(
        'fourth_columns',
        (v) => v as bool? ?? false,
      ),
      fourthColumnsDate: $checkedConvert(
        'fourth_columns_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      fourthColumnsNotes: $checkedConvert(
        'fourth_columns_notes',
        (v) => v as String?,
      ),
      fourthCeiling: $checkedConvert(
        'fourth_ceiling',
        (v) => v as bool? ?? false,
      ),
      fourthCeilingDate: $checkedConvert(
        'fourth_ceiling_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      fourthCeilingNotes: $checkedConvert(
        'fourth_ceiling_notes',
        (v) => v as String?,
      ),
      fifthColumns: $checkedConvert(
        'fifth_columns',
        (v) => v as bool? ?? false,
      ),
      fifthColumnsDate: $checkedConvert(
        'fifth_columns_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      fifthColumnsNotes: $checkedConvert(
        'fifth_columns_notes',
        (v) => v as String?,
      ),
      fifthCeiling: $checkedConvert(
        'fifth_ceiling',
        (v) => v as bool? ?? false,
      ),
      fifthCeilingDate: $checkedConvert(
        'fifth_ceiling_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      fifthCeilingNotes: $checkedConvert(
        'fifth_ceiling_notes',
        (v) => v as String?,
      ),
      stageNotes: $checkedConvert('stage_notes', (v) => v as String?),
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
    'survey1': 'survey_1',
    'survey1Date': 'survey_1_date',
    'survey1Notes': 'survey_1_notes',
    'excavationDate': 'excavation_date',
    'excavationNotes': 'excavation_notes',
    'replacementDate': 'replacement_date',
    'replacementNotes': 'replacement_notes',
    'survey2': 'survey_2',
    'survey2Date': 'survey_2_date',
    'survey2Notes': 'survey_2_notes',
    'plainConcrete': 'plain_concrete',
    'plainConcreteDate': 'plain_concrete_date',
    'plainConcreteNotes': 'plain_concrete_notes',
    'reinforcedConcrete': 'reinforced_concrete',
    'reinforcedConcreteDate': 'reinforced_concrete_date',
    'reinforcedConcreteNotes': 'reinforced_concrete_notes',
    'basementColumns': 'basement_columns',
    'basementColumnsDate': 'basement_columns_date',
    'basementColumnsNotes': 'basement_columns_notes',
    'basementCeiling': 'basement_ceiling',
    'basementCeilingDate': 'basement_ceiling_date',
    'basementCeilingNotes': 'basement_ceiling_notes',
    'groundColumns': 'ground_columns',
    'groundColumnsDate': 'ground_columns_date',
    'groundColumnsNotes': 'ground_columns_notes',
    'groundCeiling': 'ground_ceiling',
    'groundCeilingDate': 'ground_ceiling_date',
    'groundCeilingNotes': 'ground_ceiling_notes',
    'firstColumns': 'first_columns',
    'firstColumnsDate': 'first_columns_date',
    'firstColumnsNotes': 'first_columns_notes',
    'firstCeiling': 'first_ceiling',
    'firstCeilingDate': 'first_ceiling_date',
    'firstCeilingNotes': 'first_ceiling_notes',
    'secondColumns': 'second_columns',
    'secondColumnsDate': 'second_columns_date',
    'secondColumnsNotes': 'second_columns_notes',
    'secondCeiling': 'second_ceiling',
    'secondCeilingDate': 'second_ceiling_date',
    'secondCeilingNotes': 'second_ceiling_notes',
    'thirdColumns': 'third_columns',
    'thirdColumnsDate': 'third_columns_date',
    'thirdColumnsNotes': 'third_columns_notes',
    'thirdCeiling': 'third_ceiling',
    'thirdCeilingDate': 'third_ceiling_date',
    'thirdCeilingNotes': 'third_ceiling_notes',
    'fourthColumns': 'fourth_columns',
    'fourthColumnsDate': 'fourth_columns_date',
    'fourthColumnsNotes': 'fourth_columns_notes',
    'fourthCeiling': 'fourth_ceiling',
    'fourthCeilingDate': 'fourth_ceiling_date',
    'fourthCeilingNotes': 'fourth_ceiling_notes',
    'fifthColumns': 'fifth_columns',
    'fifthColumnsDate': 'fifth_columns_date',
    'fifthColumnsNotes': 'fifth_columns_notes',
    'fifthCeiling': 'fifth_ceiling',
    'fifthCeilingDate': 'fifth_ceiling_date',
    'fifthCeilingNotes': 'fifth_ceiling_notes',
    'stageNotes': 'stage_notes',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ExecutionStageToJson(_ExecutionStage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'survey_1': instance.survey1,
      'survey_1_date': ?instance.survey1Date?.toIso8601String(),
      'survey_1_notes': ?instance.survey1Notes,
      'excavation': instance.excavation,
      'excavation_date': ?instance.excavationDate?.toIso8601String(),
      'excavation_notes': ?instance.excavationNotes,
      'replacement': instance.replacement,
      'replacement_date': ?instance.replacementDate?.toIso8601String(),
      'replacement_notes': ?instance.replacementNotes,
      'survey_2': instance.survey2,
      'survey_2_date': ?instance.survey2Date?.toIso8601String(),
      'survey_2_notes': ?instance.survey2Notes,
      'plain_concrete': instance.plainConcrete,
      'plain_concrete_date': ?instance.plainConcreteDate?.toIso8601String(),
      'plain_concrete_notes': ?instance.plainConcreteNotes,
      'reinforced_concrete': instance.reinforcedConcrete,
      'reinforced_concrete_date': ?instance.reinforcedConcreteDate
          ?.toIso8601String(),
      'reinforced_concrete_notes': ?instance.reinforcedConcreteNotes,
      'basement_columns': instance.basementColumns,
      'basement_columns_date': ?instance.basementColumnsDate?.toIso8601String(),
      'basement_columns_notes': ?instance.basementColumnsNotes,
      'basement_ceiling': instance.basementCeiling,
      'basement_ceiling_date': ?instance.basementCeilingDate?.toIso8601String(),
      'basement_ceiling_notes': ?instance.basementCeilingNotes,
      'ground_columns': instance.groundColumns,
      'ground_columns_date': ?instance.groundColumnsDate?.toIso8601String(),
      'ground_columns_notes': ?instance.groundColumnsNotes,
      'ground_ceiling': instance.groundCeiling,
      'ground_ceiling_date': ?instance.groundCeilingDate?.toIso8601String(),
      'ground_ceiling_notes': ?instance.groundCeilingNotes,
      'first_columns': instance.firstColumns,
      'first_columns_date': ?instance.firstColumnsDate?.toIso8601String(),
      'first_columns_notes': ?instance.firstColumnsNotes,
      'first_ceiling': instance.firstCeiling,
      'first_ceiling_date': ?instance.firstCeilingDate?.toIso8601String(),
      'first_ceiling_notes': ?instance.firstCeilingNotes,
      'second_columns': instance.secondColumns,
      'second_columns_date': ?instance.secondColumnsDate?.toIso8601String(),
      'second_columns_notes': ?instance.secondColumnsNotes,
      'second_ceiling': instance.secondCeiling,
      'second_ceiling_date': ?instance.secondCeilingDate?.toIso8601String(),
      'second_ceiling_notes': ?instance.secondCeilingNotes,
      'third_columns': instance.thirdColumns,
      'third_columns_date': ?instance.thirdColumnsDate?.toIso8601String(),
      'third_columns_notes': ?instance.thirdColumnsNotes,
      'third_ceiling': instance.thirdCeiling,
      'third_ceiling_date': ?instance.thirdCeilingDate?.toIso8601String(),
      'third_ceiling_notes': ?instance.thirdCeilingNotes,
      'fourth_columns': instance.fourthColumns,
      'fourth_columns_date': ?instance.fourthColumnsDate?.toIso8601String(),
      'fourth_columns_notes': ?instance.fourthColumnsNotes,
      'fourth_ceiling': instance.fourthCeiling,
      'fourth_ceiling_date': ?instance.fourthCeilingDate?.toIso8601String(),
      'fourth_ceiling_notes': ?instance.fourthCeilingNotes,
      'fifth_columns': instance.fifthColumns,
      'fifth_columns_date': ?instance.fifthColumnsDate?.toIso8601String(),
      'fifth_columns_notes': ?instance.fifthColumnsNotes,
      'fifth_ceiling': instance.fifthCeiling,
      'fifth_ceiling_date': ?instance.fifthCeilingDate?.toIso8601String(),
      'fifth_ceiling_notes': ?instance.fifthCeilingNotes,
      'stage_notes': ?instance.stageNotes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
