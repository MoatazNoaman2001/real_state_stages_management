import 'package:freezed_annotation/freezed_annotation.dart';

part 'execution_stage.freezed.dart';
part 'execution_stage.g.dart';

@freezed
abstract class ExecutionStage with _$ExecutionStage {
  const factory ExecutionStage({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    // Step 1: مساحة
    @Default(false) @JsonKey(name: 'survey_1') bool survey1,
    @JsonKey(name: 'survey_1_date') DateTime? survey1Date,
    @JsonKey(name: 'survey_1_notes') String? survey1Notes,

    // Step 2: حفر
    @Default(false) bool excavation,
    @JsonKey(name: 'excavation_date') DateTime? excavationDate,
    @JsonKey(name: 'excavation_notes') String? excavationNotes,

    // Step 3: إحلال
    @Default(false) bool replacement,
    @JsonKey(name: 'replacement_date') DateTime? replacementDate,
    @JsonKey(name: 'replacement_notes') String? replacementNotes,

    // Step 4: مساحة
    @Default(false) @JsonKey(name: 'survey_2') bool survey2,
    @JsonKey(name: 'survey_2_date') DateTime? survey2Date,
    @JsonKey(name: 'survey_2_notes') String? survey2Notes,

    // Step 5: خرسانة عادية
    @Default(false) @JsonKey(name: 'plain_concrete') bool plainConcrete,
    @JsonKey(name: 'plain_concrete_date') DateTime? plainConcreteDate,
    @JsonKey(name: 'plain_concrete_notes') String? plainConcreteNotes,

    // Step 6: خرسانة مسلحة
    @Default(false) @JsonKey(name: 'reinforced_concrete') bool reinforcedConcrete,
    @JsonKey(name: 'reinforced_concrete_date') DateTime? reinforcedConcreteDate,
    @JsonKey(name: 'reinforced_concrete_notes') String? reinforcedConcreteNotes,

    // Step 7: أعمدة البدروم
    @Default(false) @JsonKey(name: 'basement_columns') bool basementColumns,
    @JsonKey(name: 'basement_columns_date') DateTime? basementColumnsDate,
    @JsonKey(name: 'basement_columns_notes') String? basementColumnsNotes,

    // Step 8: سقف البدروم
    @Default(false) @JsonKey(name: 'basement_ceiling') bool basementCeiling,
    @JsonKey(name: 'basement_ceiling_date') DateTime? basementCeilingDate,
    @JsonKey(name: 'basement_ceiling_notes') String? basementCeilingNotes,

    // Step 9: أعمدة الارضي
    @Default(false) @JsonKey(name: 'ground_columns') bool groundColumns,
    @JsonKey(name: 'ground_columns_date') DateTime? groundColumnsDate,
    @JsonKey(name: 'ground_columns_notes') String? groundColumnsNotes,

    // Step 10: سقف الارضي
    @Default(false) @JsonKey(name: 'ground_ceiling') bool groundCeiling,
    @JsonKey(name: 'ground_ceiling_date') DateTime? groundCeilingDate,
    @JsonKey(name: 'ground_ceiling_notes') String? groundCeilingNotes,

    // Step 11: أعمدة الأول علوي
    @Default(false) @JsonKey(name: 'first_columns') bool firstColumns,
    @JsonKey(name: 'first_columns_date') DateTime? firstColumnsDate,
    @JsonKey(name: 'first_columns_notes') String? firstColumnsNotes,

    // Step 12: سقف الأول علوي
    @Default(false) @JsonKey(name: 'first_ceiling') bool firstCeiling,
    @JsonKey(name: 'first_ceiling_date') DateTime? firstCeilingDate,
    @JsonKey(name: 'first_ceiling_notes') String? firstCeilingNotes,

    // Step 13: أعمدة الثاني علوي
    @Default(false) @JsonKey(name: 'second_columns') bool secondColumns,
    @JsonKey(name: 'second_columns_date') DateTime? secondColumnsDate,
    @JsonKey(name: 'second_columns_notes') String? secondColumnsNotes,

    // Step 14: سقف الثاني علوي
    @Default(false) @JsonKey(name: 'second_ceiling') bool secondCeiling,
    @JsonKey(name: 'second_ceiling_date') DateTime? secondCeilingDate,
    @JsonKey(name: 'second_ceiling_notes') String? secondCeilingNotes,

    // Step 15: أعمدة الثالث علوي
    @Default(false) @JsonKey(name: 'third_columns') bool thirdColumns,
    @JsonKey(name: 'third_columns_date') DateTime? thirdColumnsDate,
    @JsonKey(name: 'third_columns_notes') String? thirdColumnsNotes,

    // Step 16: سقف الثالث علوي
    @Default(false) @JsonKey(name: 'third_ceiling') bool thirdCeiling,
    @JsonKey(name: 'third_ceiling_date') DateTime? thirdCeilingDate,
    @JsonKey(name: 'third_ceiling_notes') String? thirdCeilingNotes,

    // Step 17: أعمدة الرابع علوي
    @Default(false) @JsonKey(name: 'fourth_columns') bool fourthColumns,
    @JsonKey(name: 'fourth_columns_date') DateTime? fourthColumnsDate,
    @JsonKey(name: 'fourth_columns_notes') String? fourthColumnsNotes,

    // Step 18: سقف الرابع علوي
    @Default(false) @JsonKey(name: 'fourth_ceiling') bool fourthCeiling,
    @JsonKey(name: 'fourth_ceiling_date') DateTime? fourthCeilingDate,
    @JsonKey(name: 'fourth_ceiling_notes') String? fourthCeilingNotes,

    // Step 19: أعمدة الخامس علوي
    @Default(false) @JsonKey(name: 'fifth_columns') bool fifthColumns,
    @JsonKey(name: 'fifth_columns_date') DateTime? fifthColumnsDate,
    @JsonKey(name: 'fifth_columns_notes') String? fifthColumnsNotes,

    // Step 20: سقف الخامس علوي
    @Default(false) @JsonKey(name: 'fifth_ceiling') bool fifthCeiling,
    @JsonKey(name: 'fifth_ceiling_date') DateTime? fifthCeilingDate,
    @JsonKey(name: 'fifth_ceiling_notes') String? fifthCeilingNotes,

    // General stage notes
    @JsonKey(name: 'stage_notes') String? stageNotes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ExecutionStage;

  const ExecutionStage._();

  factory ExecutionStage.fromJson(Map<String, dynamic> json) =>
      _$ExecutionStageFromJson(json);

  static const int totalSteps = 20;

  int get completedSteps {
    int count = 0;
    if (survey1) count++;
    if (excavation) count++;
    if (replacement) count++;
    if (survey2) count++;
    if (plainConcrete) count++;
    if (reinforcedConcrete) count++;
    if (basementColumns) count++;
    if (basementCeiling) count++;
    if (groundColumns) count++;
    if (groundCeiling) count++;
    if (firstColumns) count++;
    if (firstCeiling) count++;
    if (secondColumns) count++;
    if (secondCeiling) count++;
    if (thirdColumns) count++;
    if (thirdCeiling) count++;
    if (fourthColumns) count++;
    if (fourthCeiling) count++;
    if (fifthColumns) count++;
    if (fifthCeiling) count++;
    return count;
  }

  double get progress => (completedSteps / totalSteps) * 100;
  bool get isComplete => completedSteps == totalSteps;

  String get currentStageName {
    if (fifthCeiling) return 'مكتمل';
    if (fifthColumns) return 'سقف الخامس علوي';
    if (fourthCeiling) return 'أعمدة الخامس علوي';
    if (fourthColumns) return 'سقف الرابع علوي';
    if (thirdCeiling) return 'أعمدة الرابع علوي';
    if (thirdColumns) return 'سقف الثالث علوي';
    if (secondCeiling) return 'أعمدة الثالث علوي';
    if (secondColumns) return 'سقف الثاني علوي';
    if (firstCeiling) return 'أعمدة الثاني علوي';
    if (firstColumns) return 'سقف الأول علوي';
    if (groundCeiling) return 'أعمدة الأول علوي';
    if (groundColumns) return 'سقف الارضي';
    if (basementCeiling) return 'أعمدة الارضي';
    if (basementColumns) return 'سقف البدروم';
    if (reinforcedConcrete) return 'أعمدة البدروم';
    if (plainConcrete) return 'خرسانة مسلحة';
    if (survey2) return 'خرسانة عادية';
    if (replacement) return 'مساحة';
    if (excavation) return 'إحلال';
    if (survey1) return 'حفر';
    return 'مساحة';
  }
}
