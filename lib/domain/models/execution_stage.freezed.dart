// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'execution_stage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExecutionStage {

 int get id;@JsonKey(name: 'customer_id') int get customerId;// Step 1: مساحة
@JsonKey(name: 'survey_1') bool get survey1;@JsonKey(name: 'survey_1_date') DateTime? get survey1Date;@JsonKey(name: 'survey_1_notes') String? get survey1Notes;// Step 2: حفر
 bool get excavation;@JsonKey(name: 'excavation_date') DateTime? get excavationDate;@JsonKey(name: 'excavation_notes') String? get excavationNotes;// Step 3: إحلال
 bool get replacement;@JsonKey(name: 'replacement_date') DateTime? get replacementDate;@JsonKey(name: 'replacement_notes') String? get replacementNotes;// Step 4: مساحة
@JsonKey(name: 'survey_2') bool get survey2;@JsonKey(name: 'survey_2_date') DateTime? get survey2Date;@JsonKey(name: 'survey_2_notes') String? get survey2Notes;// Step 5: خرسانة عادية
@JsonKey(name: 'plain_concrete') bool get plainConcrete;@JsonKey(name: 'plain_concrete_date') DateTime? get plainConcreteDate;@JsonKey(name: 'plain_concrete_notes') String? get plainConcreteNotes;// Step 6: خرسانة مسلحة
@JsonKey(name: 'reinforced_concrete') bool get reinforcedConcrete;@JsonKey(name: 'reinforced_concrete_date') DateTime? get reinforcedConcreteDate;@JsonKey(name: 'reinforced_concrete_notes') String? get reinforcedConcreteNotes;// Step 7: أعمدة البدروم
@JsonKey(name: 'basement_columns') bool get basementColumns;@JsonKey(name: 'basement_columns_date') DateTime? get basementColumnsDate;@JsonKey(name: 'basement_columns_notes') String? get basementColumnsNotes;// Step 8: سقف البدروم
@JsonKey(name: 'basement_ceiling') bool get basementCeiling;@JsonKey(name: 'basement_ceiling_date') DateTime? get basementCeilingDate;@JsonKey(name: 'basement_ceiling_notes') String? get basementCeilingNotes;// Step 9: أعمدة الارضي
@JsonKey(name: 'ground_columns') bool get groundColumns;@JsonKey(name: 'ground_columns_date') DateTime? get groundColumnsDate;@JsonKey(name: 'ground_columns_notes') String? get groundColumnsNotes;// Step 10: سقف الارضي
@JsonKey(name: 'ground_ceiling') bool get groundCeiling;@JsonKey(name: 'ground_ceiling_date') DateTime? get groundCeilingDate;@JsonKey(name: 'ground_ceiling_notes') String? get groundCeilingNotes;// Step 11: أعمدة الأول علوي
@JsonKey(name: 'first_columns') bool get firstColumns;@JsonKey(name: 'first_columns_date') DateTime? get firstColumnsDate;@JsonKey(name: 'first_columns_notes') String? get firstColumnsNotes;// Step 12: سقف الأول علوي
@JsonKey(name: 'first_ceiling') bool get firstCeiling;@JsonKey(name: 'first_ceiling_date') DateTime? get firstCeilingDate;@JsonKey(name: 'first_ceiling_notes') String? get firstCeilingNotes;// Step 13: أعمدة الثاني علوي
@JsonKey(name: 'second_columns') bool get secondColumns;@JsonKey(name: 'second_columns_date') DateTime? get secondColumnsDate;@JsonKey(name: 'second_columns_notes') String? get secondColumnsNotes;// Step 14: سقف الثاني علوي
@JsonKey(name: 'second_ceiling') bool get secondCeiling;@JsonKey(name: 'second_ceiling_date') DateTime? get secondCeilingDate;@JsonKey(name: 'second_ceiling_notes') String? get secondCeilingNotes;// Step 15: أعمدة الثالث علوي
@JsonKey(name: 'third_columns') bool get thirdColumns;@JsonKey(name: 'third_columns_date') DateTime? get thirdColumnsDate;@JsonKey(name: 'third_columns_notes') String? get thirdColumnsNotes;// Step 16: سقف الثالث علوي
@JsonKey(name: 'third_ceiling') bool get thirdCeiling;@JsonKey(name: 'third_ceiling_date') DateTime? get thirdCeilingDate;@JsonKey(name: 'third_ceiling_notes') String? get thirdCeilingNotes;// Step 17: أعمدة الرابع علوي
@JsonKey(name: 'fourth_columns') bool get fourthColumns;@JsonKey(name: 'fourth_columns_date') DateTime? get fourthColumnsDate;@JsonKey(name: 'fourth_columns_notes') String? get fourthColumnsNotes;// Step 18: سقف الرابع علوي
@JsonKey(name: 'fourth_ceiling') bool get fourthCeiling;@JsonKey(name: 'fourth_ceiling_date') DateTime? get fourthCeilingDate;@JsonKey(name: 'fourth_ceiling_notes') String? get fourthCeilingNotes;// Step 19: أعمدة الخامس علوي
@JsonKey(name: 'fifth_columns') bool get fifthColumns;@JsonKey(name: 'fifth_columns_date') DateTime? get fifthColumnsDate;@JsonKey(name: 'fifth_columns_notes') String? get fifthColumnsNotes;// Step 20: سقف الخامس علوي
@JsonKey(name: 'fifth_ceiling') bool get fifthCeiling;@JsonKey(name: 'fifth_ceiling_date') DateTime? get fifthCeilingDate;@JsonKey(name: 'fifth_ceiling_notes') String? get fifthCeilingNotes;// General stage notes
@JsonKey(name: 'stage_notes') String? get stageNotes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ExecutionStage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionStageCopyWith<ExecutionStage> get copyWith => _$ExecutionStageCopyWithImpl<ExecutionStage>(this as ExecutionStage, _$identity);

  /// Serializes this ExecutionStage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionStage&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.survey1, survey1) || other.survey1 == survey1)&&(identical(other.survey1Date, survey1Date) || other.survey1Date == survey1Date)&&(identical(other.survey1Notes, survey1Notes) || other.survey1Notes == survey1Notes)&&(identical(other.excavation, excavation) || other.excavation == excavation)&&(identical(other.excavationDate, excavationDate) || other.excavationDate == excavationDate)&&(identical(other.excavationNotes, excavationNotes) || other.excavationNotes == excavationNotes)&&(identical(other.replacement, replacement) || other.replacement == replacement)&&(identical(other.replacementDate, replacementDate) || other.replacementDate == replacementDate)&&(identical(other.replacementNotes, replacementNotes) || other.replacementNotes == replacementNotes)&&(identical(other.survey2, survey2) || other.survey2 == survey2)&&(identical(other.survey2Date, survey2Date) || other.survey2Date == survey2Date)&&(identical(other.survey2Notes, survey2Notes) || other.survey2Notes == survey2Notes)&&(identical(other.plainConcrete, plainConcrete) || other.plainConcrete == plainConcrete)&&(identical(other.plainConcreteDate, plainConcreteDate) || other.plainConcreteDate == plainConcreteDate)&&(identical(other.plainConcreteNotes, plainConcreteNotes) || other.plainConcreteNotes == plainConcreteNotes)&&(identical(other.reinforcedConcrete, reinforcedConcrete) || other.reinforcedConcrete == reinforcedConcrete)&&(identical(other.reinforcedConcreteDate, reinforcedConcreteDate) || other.reinforcedConcreteDate == reinforcedConcreteDate)&&(identical(other.reinforcedConcreteNotes, reinforcedConcreteNotes) || other.reinforcedConcreteNotes == reinforcedConcreteNotes)&&(identical(other.basementColumns, basementColumns) || other.basementColumns == basementColumns)&&(identical(other.basementColumnsDate, basementColumnsDate) || other.basementColumnsDate == basementColumnsDate)&&(identical(other.basementColumnsNotes, basementColumnsNotes) || other.basementColumnsNotes == basementColumnsNotes)&&(identical(other.basementCeiling, basementCeiling) || other.basementCeiling == basementCeiling)&&(identical(other.basementCeilingDate, basementCeilingDate) || other.basementCeilingDate == basementCeilingDate)&&(identical(other.basementCeilingNotes, basementCeilingNotes) || other.basementCeilingNotes == basementCeilingNotes)&&(identical(other.groundColumns, groundColumns) || other.groundColumns == groundColumns)&&(identical(other.groundColumnsDate, groundColumnsDate) || other.groundColumnsDate == groundColumnsDate)&&(identical(other.groundColumnsNotes, groundColumnsNotes) || other.groundColumnsNotes == groundColumnsNotes)&&(identical(other.groundCeiling, groundCeiling) || other.groundCeiling == groundCeiling)&&(identical(other.groundCeilingDate, groundCeilingDate) || other.groundCeilingDate == groundCeilingDate)&&(identical(other.groundCeilingNotes, groundCeilingNotes) || other.groundCeilingNotes == groundCeilingNotes)&&(identical(other.firstColumns, firstColumns) || other.firstColumns == firstColumns)&&(identical(other.firstColumnsDate, firstColumnsDate) || other.firstColumnsDate == firstColumnsDate)&&(identical(other.firstColumnsNotes, firstColumnsNotes) || other.firstColumnsNotes == firstColumnsNotes)&&(identical(other.firstCeiling, firstCeiling) || other.firstCeiling == firstCeiling)&&(identical(other.firstCeilingDate, firstCeilingDate) || other.firstCeilingDate == firstCeilingDate)&&(identical(other.firstCeilingNotes, firstCeilingNotes) || other.firstCeilingNotes == firstCeilingNotes)&&(identical(other.secondColumns, secondColumns) || other.secondColumns == secondColumns)&&(identical(other.secondColumnsDate, secondColumnsDate) || other.secondColumnsDate == secondColumnsDate)&&(identical(other.secondColumnsNotes, secondColumnsNotes) || other.secondColumnsNotes == secondColumnsNotes)&&(identical(other.secondCeiling, secondCeiling) || other.secondCeiling == secondCeiling)&&(identical(other.secondCeilingDate, secondCeilingDate) || other.secondCeilingDate == secondCeilingDate)&&(identical(other.secondCeilingNotes, secondCeilingNotes) || other.secondCeilingNotes == secondCeilingNotes)&&(identical(other.thirdColumns, thirdColumns) || other.thirdColumns == thirdColumns)&&(identical(other.thirdColumnsDate, thirdColumnsDate) || other.thirdColumnsDate == thirdColumnsDate)&&(identical(other.thirdColumnsNotes, thirdColumnsNotes) || other.thirdColumnsNotes == thirdColumnsNotes)&&(identical(other.thirdCeiling, thirdCeiling) || other.thirdCeiling == thirdCeiling)&&(identical(other.thirdCeilingDate, thirdCeilingDate) || other.thirdCeilingDate == thirdCeilingDate)&&(identical(other.thirdCeilingNotes, thirdCeilingNotes) || other.thirdCeilingNotes == thirdCeilingNotes)&&(identical(other.fourthColumns, fourthColumns) || other.fourthColumns == fourthColumns)&&(identical(other.fourthColumnsDate, fourthColumnsDate) || other.fourthColumnsDate == fourthColumnsDate)&&(identical(other.fourthColumnsNotes, fourthColumnsNotes) || other.fourthColumnsNotes == fourthColumnsNotes)&&(identical(other.fourthCeiling, fourthCeiling) || other.fourthCeiling == fourthCeiling)&&(identical(other.fourthCeilingDate, fourthCeilingDate) || other.fourthCeilingDate == fourthCeilingDate)&&(identical(other.fourthCeilingNotes, fourthCeilingNotes) || other.fourthCeilingNotes == fourthCeilingNotes)&&(identical(other.fifthColumns, fifthColumns) || other.fifthColumns == fifthColumns)&&(identical(other.fifthColumnsDate, fifthColumnsDate) || other.fifthColumnsDate == fifthColumnsDate)&&(identical(other.fifthColumnsNotes, fifthColumnsNotes) || other.fifthColumnsNotes == fifthColumnsNotes)&&(identical(other.fifthCeiling, fifthCeiling) || other.fifthCeiling == fifthCeiling)&&(identical(other.fifthCeilingDate, fifthCeilingDate) || other.fifthCeilingDate == fifthCeilingDate)&&(identical(other.fifthCeilingNotes, fifthCeilingNotes) || other.fifthCeilingNotes == fifthCeilingNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,survey1,survey1Date,survey1Notes,excavation,excavationDate,excavationNotes,replacement,replacementDate,replacementNotes,survey2,survey2Date,survey2Notes,plainConcrete,plainConcreteDate,plainConcreteNotes,reinforcedConcrete,reinforcedConcreteDate,reinforcedConcreteNotes,basementColumns,basementColumnsDate,basementColumnsNotes,basementCeiling,basementCeilingDate,basementCeilingNotes,groundColumns,groundColumnsDate,groundColumnsNotes,groundCeiling,groundCeilingDate,groundCeilingNotes,firstColumns,firstColumnsDate,firstColumnsNotes,firstCeiling,firstCeilingDate,firstCeilingNotes,secondColumns,secondColumnsDate,secondColumnsNotes,secondCeiling,secondCeilingDate,secondCeilingNotes,thirdColumns,thirdColumnsDate,thirdColumnsNotes,thirdCeiling,thirdCeilingDate,thirdCeilingNotes,fourthColumns,fourthColumnsDate,fourthColumnsNotes,fourthCeiling,fourthCeilingDate,fourthCeilingNotes,fifthColumns,fifthColumnsDate,fifthColumnsNotes,fifthCeiling,fifthCeilingDate,fifthCeilingNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'ExecutionStage(id: $id, customerId: $customerId, survey1: $survey1, survey1Date: $survey1Date, survey1Notes: $survey1Notes, excavation: $excavation, excavationDate: $excavationDate, excavationNotes: $excavationNotes, replacement: $replacement, replacementDate: $replacementDate, replacementNotes: $replacementNotes, survey2: $survey2, survey2Date: $survey2Date, survey2Notes: $survey2Notes, plainConcrete: $plainConcrete, plainConcreteDate: $plainConcreteDate, plainConcreteNotes: $plainConcreteNotes, reinforcedConcrete: $reinforcedConcrete, reinforcedConcreteDate: $reinforcedConcreteDate, reinforcedConcreteNotes: $reinforcedConcreteNotes, basementColumns: $basementColumns, basementColumnsDate: $basementColumnsDate, basementColumnsNotes: $basementColumnsNotes, basementCeiling: $basementCeiling, basementCeilingDate: $basementCeilingDate, basementCeilingNotes: $basementCeilingNotes, groundColumns: $groundColumns, groundColumnsDate: $groundColumnsDate, groundColumnsNotes: $groundColumnsNotes, groundCeiling: $groundCeiling, groundCeilingDate: $groundCeilingDate, groundCeilingNotes: $groundCeilingNotes, firstColumns: $firstColumns, firstColumnsDate: $firstColumnsDate, firstColumnsNotes: $firstColumnsNotes, firstCeiling: $firstCeiling, firstCeilingDate: $firstCeilingDate, firstCeilingNotes: $firstCeilingNotes, secondColumns: $secondColumns, secondColumnsDate: $secondColumnsDate, secondColumnsNotes: $secondColumnsNotes, secondCeiling: $secondCeiling, secondCeilingDate: $secondCeilingDate, secondCeilingNotes: $secondCeilingNotes, thirdColumns: $thirdColumns, thirdColumnsDate: $thirdColumnsDate, thirdColumnsNotes: $thirdColumnsNotes, thirdCeiling: $thirdCeiling, thirdCeilingDate: $thirdCeilingDate, thirdCeilingNotes: $thirdCeilingNotes, fourthColumns: $fourthColumns, fourthColumnsDate: $fourthColumnsDate, fourthColumnsNotes: $fourthColumnsNotes, fourthCeiling: $fourthCeiling, fourthCeilingDate: $fourthCeilingDate, fourthCeilingNotes: $fourthCeilingNotes, fifthColumns: $fifthColumns, fifthColumnsDate: $fifthColumnsDate, fifthColumnsNotes: $fifthColumnsNotes, fifthCeiling: $fifthCeiling, fifthCeilingDate: $fifthCeilingDate, fifthCeilingNotes: $fifthCeilingNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ExecutionStageCopyWith<$Res>  {
  factory $ExecutionStageCopyWith(ExecutionStage value, $Res Function(ExecutionStage) _then) = _$ExecutionStageCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'survey_1') bool survey1,@JsonKey(name: 'survey_1_date') DateTime? survey1Date,@JsonKey(name: 'survey_1_notes') String? survey1Notes, bool excavation,@JsonKey(name: 'excavation_date') DateTime? excavationDate,@JsonKey(name: 'excavation_notes') String? excavationNotes, bool replacement,@JsonKey(name: 'replacement_date') DateTime? replacementDate,@JsonKey(name: 'replacement_notes') String? replacementNotes,@JsonKey(name: 'survey_2') bool survey2,@JsonKey(name: 'survey_2_date') DateTime? survey2Date,@JsonKey(name: 'survey_2_notes') String? survey2Notes,@JsonKey(name: 'plain_concrete') bool plainConcrete,@JsonKey(name: 'plain_concrete_date') DateTime? plainConcreteDate,@JsonKey(name: 'plain_concrete_notes') String? plainConcreteNotes,@JsonKey(name: 'reinforced_concrete') bool reinforcedConcrete,@JsonKey(name: 'reinforced_concrete_date') DateTime? reinforcedConcreteDate,@JsonKey(name: 'reinforced_concrete_notes') String? reinforcedConcreteNotes,@JsonKey(name: 'basement_columns') bool basementColumns,@JsonKey(name: 'basement_columns_date') DateTime? basementColumnsDate,@JsonKey(name: 'basement_columns_notes') String? basementColumnsNotes,@JsonKey(name: 'basement_ceiling') bool basementCeiling,@JsonKey(name: 'basement_ceiling_date') DateTime? basementCeilingDate,@JsonKey(name: 'basement_ceiling_notes') String? basementCeilingNotes,@JsonKey(name: 'ground_columns') bool groundColumns,@JsonKey(name: 'ground_columns_date') DateTime? groundColumnsDate,@JsonKey(name: 'ground_columns_notes') String? groundColumnsNotes,@JsonKey(name: 'ground_ceiling') bool groundCeiling,@JsonKey(name: 'ground_ceiling_date') DateTime? groundCeilingDate,@JsonKey(name: 'ground_ceiling_notes') String? groundCeilingNotes,@JsonKey(name: 'first_columns') bool firstColumns,@JsonKey(name: 'first_columns_date') DateTime? firstColumnsDate,@JsonKey(name: 'first_columns_notes') String? firstColumnsNotes,@JsonKey(name: 'first_ceiling') bool firstCeiling,@JsonKey(name: 'first_ceiling_date') DateTime? firstCeilingDate,@JsonKey(name: 'first_ceiling_notes') String? firstCeilingNotes,@JsonKey(name: 'second_columns') bool secondColumns,@JsonKey(name: 'second_columns_date') DateTime? secondColumnsDate,@JsonKey(name: 'second_columns_notes') String? secondColumnsNotes,@JsonKey(name: 'second_ceiling') bool secondCeiling,@JsonKey(name: 'second_ceiling_date') DateTime? secondCeilingDate,@JsonKey(name: 'second_ceiling_notes') String? secondCeilingNotes,@JsonKey(name: 'third_columns') bool thirdColumns,@JsonKey(name: 'third_columns_date') DateTime? thirdColumnsDate,@JsonKey(name: 'third_columns_notes') String? thirdColumnsNotes,@JsonKey(name: 'third_ceiling') bool thirdCeiling,@JsonKey(name: 'third_ceiling_date') DateTime? thirdCeilingDate,@JsonKey(name: 'third_ceiling_notes') String? thirdCeilingNotes,@JsonKey(name: 'fourth_columns') bool fourthColumns,@JsonKey(name: 'fourth_columns_date') DateTime? fourthColumnsDate,@JsonKey(name: 'fourth_columns_notes') String? fourthColumnsNotes,@JsonKey(name: 'fourth_ceiling') bool fourthCeiling,@JsonKey(name: 'fourth_ceiling_date') DateTime? fourthCeilingDate,@JsonKey(name: 'fourth_ceiling_notes') String? fourthCeilingNotes,@JsonKey(name: 'fifth_columns') bool fifthColumns,@JsonKey(name: 'fifth_columns_date') DateTime? fifthColumnsDate,@JsonKey(name: 'fifth_columns_notes') String? fifthColumnsNotes,@JsonKey(name: 'fifth_ceiling') bool fifthCeiling,@JsonKey(name: 'fifth_ceiling_date') DateTime? fifthCeilingDate,@JsonKey(name: 'fifth_ceiling_notes') String? fifthCeilingNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ExecutionStageCopyWithImpl<$Res>
    implements $ExecutionStageCopyWith<$Res> {
  _$ExecutionStageCopyWithImpl(this._self, this._then);

  final ExecutionStage _self;
  final $Res Function(ExecutionStage) _then;

/// Create a copy of ExecutionStage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? survey1 = null,Object? survey1Date = freezed,Object? survey1Notes = freezed,Object? excavation = null,Object? excavationDate = freezed,Object? excavationNotes = freezed,Object? replacement = null,Object? replacementDate = freezed,Object? replacementNotes = freezed,Object? survey2 = null,Object? survey2Date = freezed,Object? survey2Notes = freezed,Object? plainConcrete = null,Object? plainConcreteDate = freezed,Object? plainConcreteNotes = freezed,Object? reinforcedConcrete = null,Object? reinforcedConcreteDate = freezed,Object? reinforcedConcreteNotes = freezed,Object? basementColumns = null,Object? basementColumnsDate = freezed,Object? basementColumnsNotes = freezed,Object? basementCeiling = null,Object? basementCeilingDate = freezed,Object? basementCeilingNotes = freezed,Object? groundColumns = null,Object? groundColumnsDate = freezed,Object? groundColumnsNotes = freezed,Object? groundCeiling = null,Object? groundCeilingDate = freezed,Object? groundCeilingNotes = freezed,Object? firstColumns = null,Object? firstColumnsDate = freezed,Object? firstColumnsNotes = freezed,Object? firstCeiling = null,Object? firstCeilingDate = freezed,Object? firstCeilingNotes = freezed,Object? secondColumns = null,Object? secondColumnsDate = freezed,Object? secondColumnsNotes = freezed,Object? secondCeiling = null,Object? secondCeilingDate = freezed,Object? secondCeilingNotes = freezed,Object? thirdColumns = null,Object? thirdColumnsDate = freezed,Object? thirdColumnsNotes = freezed,Object? thirdCeiling = null,Object? thirdCeilingDate = freezed,Object? thirdCeilingNotes = freezed,Object? fourthColumns = null,Object? fourthColumnsDate = freezed,Object? fourthColumnsNotes = freezed,Object? fourthCeiling = null,Object? fourthCeilingDate = freezed,Object? fourthCeilingNotes = freezed,Object? fifthColumns = null,Object? fifthColumnsDate = freezed,Object? fifthColumnsNotes = freezed,Object? fifthCeiling = null,Object? fifthCeilingDate = freezed,Object? fifthCeilingNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,survey1: null == survey1 ? _self.survey1 : survey1 // ignore: cast_nullable_to_non_nullable
as bool,survey1Date: freezed == survey1Date ? _self.survey1Date : survey1Date // ignore: cast_nullable_to_non_nullable
as DateTime?,survey1Notes: freezed == survey1Notes ? _self.survey1Notes : survey1Notes // ignore: cast_nullable_to_non_nullable
as String?,excavation: null == excavation ? _self.excavation : excavation // ignore: cast_nullable_to_non_nullable
as bool,excavationDate: freezed == excavationDate ? _self.excavationDate : excavationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,excavationNotes: freezed == excavationNotes ? _self.excavationNotes : excavationNotes // ignore: cast_nullable_to_non_nullable
as String?,replacement: null == replacement ? _self.replacement : replacement // ignore: cast_nullable_to_non_nullable
as bool,replacementDate: freezed == replacementDate ? _self.replacementDate : replacementDate // ignore: cast_nullable_to_non_nullable
as DateTime?,replacementNotes: freezed == replacementNotes ? _self.replacementNotes : replacementNotes // ignore: cast_nullable_to_non_nullable
as String?,survey2: null == survey2 ? _self.survey2 : survey2 // ignore: cast_nullable_to_non_nullable
as bool,survey2Date: freezed == survey2Date ? _self.survey2Date : survey2Date // ignore: cast_nullable_to_non_nullable
as DateTime?,survey2Notes: freezed == survey2Notes ? _self.survey2Notes : survey2Notes // ignore: cast_nullable_to_non_nullable
as String?,plainConcrete: null == plainConcrete ? _self.plainConcrete : plainConcrete // ignore: cast_nullable_to_non_nullable
as bool,plainConcreteDate: freezed == plainConcreteDate ? _self.plainConcreteDate : plainConcreteDate // ignore: cast_nullable_to_non_nullable
as DateTime?,plainConcreteNotes: freezed == plainConcreteNotes ? _self.plainConcreteNotes : plainConcreteNotes // ignore: cast_nullable_to_non_nullable
as String?,reinforcedConcrete: null == reinforcedConcrete ? _self.reinforcedConcrete : reinforcedConcrete // ignore: cast_nullable_to_non_nullable
as bool,reinforcedConcreteDate: freezed == reinforcedConcreteDate ? _self.reinforcedConcreteDate : reinforcedConcreteDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reinforcedConcreteNotes: freezed == reinforcedConcreteNotes ? _self.reinforcedConcreteNotes : reinforcedConcreteNotes // ignore: cast_nullable_to_non_nullable
as String?,basementColumns: null == basementColumns ? _self.basementColumns : basementColumns // ignore: cast_nullable_to_non_nullable
as bool,basementColumnsDate: freezed == basementColumnsDate ? _self.basementColumnsDate : basementColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,basementColumnsNotes: freezed == basementColumnsNotes ? _self.basementColumnsNotes : basementColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,basementCeiling: null == basementCeiling ? _self.basementCeiling : basementCeiling // ignore: cast_nullable_to_non_nullable
as bool,basementCeilingDate: freezed == basementCeilingDate ? _self.basementCeilingDate : basementCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,basementCeilingNotes: freezed == basementCeilingNotes ? _self.basementCeilingNotes : basementCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,groundColumns: null == groundColumns ? _self.groundColumns : groundColumns // ignore: cast_nullable_to_non_nullable
as bool,groundColumnsDate: freezed == groundColumnsDate ? _self.groundColumnsDate : groundColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,groundColumnsNotes: freezed == groundColumnsNotes ? _self.groundColumnsNotes : groundColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,groundCeiling: null == groundCeiling ? _self.groundCeiling : groundCeiling // ignore: cast_nullable_to_non_nullable
as bool,groundCeilingDate: freezed == groundCeilingDate ? _self.groundCeilingDate : groundCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,groundCeilingNotes: freezed == groundCeilingNotes ? _self.groundCeilingNotes : groundCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,firstColumns: null == firstColumns ? _self.firstColumns : firstColumns // ignore: cast_nullable_to_non_nullable
as bool,firstColumnsDate: freezed == firstColumnsDate ? _self.firstColumnsDate : firstColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstColumnsNotes: freezed == firstColumnsNotes ? _self.firstColumnsNotes : firstColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,firstCeiling: null == firstCeiling ? _self.firstCeiling : firstCeiling // ignore: cast_nullable_to_non_nullable
as bool,firstCeilingDate: freezed == firstCeilingDate ? _self.firstCeilingDate : firstCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstCeilingNotes: freezed == firstCeilingNotes ? _self.firstCeilingNotes : firstCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,secondColumns: null == secondColumns ? _self.secondColumns : secondColumns // ignore: cast_nullable_to_non_nullable
as bool,secondColumnsDate: freezed == secondColumnsDate ? _self.secondColumnsDate : secondColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,secondColumnsNotes: freezed == secondColumnsNotes ? _self.secondColumnsNotes : secondColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,secondCeiling: null == secondCeiling ? _self.secondCeiling : secondCeiling // ignore: cast_nullable_to_non_nullable
as bool,secondCeilingDate: freezed == secondCeilingDate ? _self.secondCeilingDate : secondCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,secondCeilingNotes: freezed == secondCeilingNotes ? _self.secondCeilingNotes : secondCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,thirdColumns: null == thirdColumns ? _self.thirdColumns : thirdColumns // ignore: cast_nullable_to_non_nullable
as bool,thirdColumnsDate: freezed == thirdColumnsDate ? _self.thirdColumnsDate : thirdColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,thirdColumnsNotes: freezed == thirdColumnsNotes ? _self.thirdColumnsNotes : thirdColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,thirdCeiling: null == thirdCeiling ? _self.thirdCeiling : thirdCeiling // ignore: cast_nullable_to_non_nullable
as bool,thirdCeilingDate: freezed == thirdCeilingDate ? _self.thirdCeilingDate : thirdCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,thirdCeilingNotes: freezed == thirdCeilingNotes ? _self.thirdCeilingNotes : thirdCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,fourthColumns: null == fourthColumns ? _self.fourthColumns : fourthColumns // ignore: cast_nullable_to_non_nullable
as bool,fourthColumnsDate: freezed == fourthColumnsDate ? _self.fourthColumnsDate : fourthColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fourthColumnsNotes: freezed == fourthColumnsNotes ? _self.fourthColumnsNotes : fourthColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,fourthCeiling: null == fourthCeiling ? _self.fourthCeiling : fourthCeiling // ignore: cast_nullable_to_non_nullable
as bool,fourthCeilingDate: freezed == fourthCeilingDate ? _self.fourthCeilingDate : fourthCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fourthCeilingNotes: freezed == fourthCeilingNotes ? _self.fourthCeilingNotes : fourthCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,fifthColumns: null == fifthColumns ? _self.fifthColumns : fifthColumns // ignore: cast_nullable_to_non_nullable
as bool,fifthColumnsDate: freezed == fifthColumnsDate ? _self.fifthColumnsDate : fifthColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fifthColumnsNotes: freezed == fifthColumnsNotes ? _self.fifthColumnsNotes : fifthColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,fifthCeiling: null == fifthCeiling ? _self.fifthCeiling : fifthCeiling // ignore: cast_nullable_to_non_nullable
as bool,fifthCeilingDate: freezed == fifthCeilingDate ? _self.fifthCeilingDate : fifthCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fifthCeilingNotes: freezed == fifthCeilingNotes ? _self.fifthCeilingNotes : fifthCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ExecutionStage].
extension ExecutionStagePatterns on ExecutionStage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExecutionStage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExecutionStage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExecutionStage value)  $default,){
final _that = this;
switch (_that) {
case _ExecutionStage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExecutionStage value)?  $default,){
final _that = this;
switch (_that) {
case _ExecutionStage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'survey_1')  bool survey1, @JsonKey(name: 'survey_1_date')  DateTime? survey1Date, @JsonKey(name: 'survey_1_notes')  String? survey1Notes,  bool excavation, @JsonKey(name: 'excavation_date')  DateTime? excavationDate, @JsonKey(name: 'excavation_notes')  String? excavationNotes,  bool replacement, @JsonKey(name: 'replacement_date')  DateTime? replacementDate, @JsonKey(name: 'replacement_notes')  String? replacementNotes, @JsonKey(name: 'survey_2')  bool survey2, @JsonKey(name: 'survey_2_date')  DateTime? survey2Date, @JsonKey(name: 'survey_2_notes')  String? survey2Notes, @JsonKey(name: 'plain_concrete')  bool plainConcrete, @JsonKey(name: 'plain_concrete_date')  DateTime? plainConcreteDate, @JsonKey(name: 'plain_concrete_notes')  String? plainConcreteNotes, @JsonKey(name: 'reinforced_concrete')  bool reinforcedConcrete, @JsonKey(name: 'reinforced_concrete_date')  DateTime? reinforcedConcreteDate, @JsonKey(name: 'reinforced_concrete_notes')  String? reinforcedConcreteNotes, @JsonKey(name: 'basement_columns')  bool basementColumns, @JsonKey(name: 'basement_columns_date')  DateTime? basementColumnsDate, @JsonKey(name: 'basement_columns_notes')  String? basementColumnsNotes, @JsonKey(name: 'basement_ceiling')  bool basementCeiling, @JsonKey(name: 'basement_ceiling_date')  DateTime? basementCeilingDate, @JsonKey(name: 'basement_ceiling_notes')  String? basementCeilingNotes, @JsonKey(name: 'ground_columns')  bool groundColumns, @JsonKey(name: 'ground_columns_date')  DateTime? groundColumnsDate, @JsonKey(name: 'ground_columns_notes')  String? groundColumnsNotes, @JsonKey(name: 'ground_ceiling')  bool groundCeiling, @JsonKey(name: 'ground_ceiling_date')  DateTime? groundCeilingDate, @JsonKey(name: 'ground_ceiling_notes')  String? groundCeilingNotes, @JsonKey(name: 'first_columns')  bool firstColumns, @JsonKey(name: 'first_columns_date')  DateTime? firstColumnsDate, @JsonKey(name: 'first_columns_notes')  String? firstColumnsNotes, @JsonKey(name: 'first_ceiling')  bool firstCeiling, @JsonKey(name: 'first_ceiling_date')  DateTime? firstCeilingDate, @JsonKey(name: 'first_ceiling_notes')  String? firstCeilingNotes, @JsonKey(name: 'second_columns')  bool secondColumns, @JsonKey(name: 'second_columns_date')  DateTime? secondColumnsDate, @JsonKey(name: 'second_columns_notes')  String? secondColumnsNotes, @JsonKey(name: 'second_ceiling')  bool secondCeiling, @JsonKey(name: 'second_ceiling_date')  DateTime? secondCeilingDate, @JsonKey(name: 'second_ceiling_notes')  String? secondCeilingNotes, @JsonKey(name: 'third_columns')  bool thirdColumns, @JsonKey(name: 'third_columns_date')  DateTime? thirdColumnsDate, @JsonKey(name: 'third_columns_notes')  String? thirdColumnsNotes, @JsonKey(name: 'third_ceiling')  bool thirdCeiling, @JsonKey(name: 'third_ceiling_date')  DateTime? thirdCeilingDate, @JsonKey(name: 'third_ceiling_notes')  String? thirdCeilingNotes, @JsonKey(name: 'fourth_columns')  bool fourthColumns, @JsonKey(name: 'fourth_columns_date')  DateTime? fourthColumnsDate, @JsonKey(name: 'fourth_columns_notes')  String? fourthColumnsNotes, @JsonKey(name: 'fourth_ceiling')  bool fourthCeiling, @JsonKey(name: 'fourth_ceiling_date')  DateTime? fourthCeilingDate, @JsonKey(name: 'fourth_ceiling_notes')  String? fourthCeilingNotes, @JsonKey(name: 'fifth_columns')  bool fifthColumns, @JsonKey(name: 'fifth_columns_date')  DateTime? fifthColumnsDate, @JsonKey(name: 'fifth_columns_notes')  String? fifthColumnsNotes, @JsonKey(name: 'fifth_ceiling')  bool fifthCeiling, @JsonKey(name: 'fifth_ceiling_date')  DateTime? fifthCeilingDate, @JsonKey(name: 'fifth_ceiling_notes')  String? fifthCeilingNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExecutionStage() when $default != null:
return $default(_that.id,_that.customerId,_that.survey1,_that.survey1Date,_that.survey1Notes,_that.excavation,_that.excavationDate,_that.excavationNotes,_that.replacement,_that.replacementDate,_that.replacementNotes,_that.survey2,_that.survey2Date,_that.survey2Notes,_that.plainConcrete,_that.plainConcreteDate,_that.plainConcreteNotes,_that.reinforcedConcrete,_that.reinforcedConcreteDate,_that.reinforcedConcreteNotes,_that.basementColumns,_that.basementColumnsDate,_that.basementColumnsNotes,_that.basementCeiling,_that.basementCeilingDate,_that.basementCeilingNotes,_that.groundColumns,_that.groundColumnsDate,_that.groundColumnsNotes,_that.groundCeiling,_that.groundCeilingDate,_that.groundCeilingNotes,_that.firstColumns,_that.firstColumnsDate,_that.firstColumnsNotes,_that.firstCeiling,_that.firstCeilingDate,_that.firstCeilingNotes,_that.secondColumns,_that.secondColumnsDate,_that.secondColumnsNotes,_that.secondCeiling,_that.secondCeilingDate,_that.secondCeilingNotes,_that.thirdColumns,_that.thirdColumnsDate,_that.thirdColumnsNotes,_that.thirdCeiling,_that.thirdCeilingDate,_that.thirdCeilingNotes,_that.fourthColumns,_that.fourthColumnsDate,_that.fourthColumnsNotes,_that.fourthCeiling,_that.fourthCeilingDate,_that.fourthCeilingNotes,_that.fifthColumns,_that.fifthColumnsDate,_that.fifthColumnsNotes,_that.fifthCeiling,_that.fifthCeilingDate,_that.fifthCeilingNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'survey_1')  bool survey1, @JsonKey(name: 'survey_1_date')  DateTime? survey1Date, @JsonKey(name: 'survey_1_notes')  String? survey1Notes,  bool excavation, @JsonKey(name: 'excavation_date')  DateTime? excavationDate, @JsonKey(name: 'excavation_notes')  String? excavationNotes,  bool replacement, @JsonKey(name: 'replacement_date')  DateTime? replacementDate, @JsonKey(name: 'replacement_notes')  String? replacementNotes, @JsonKey(name: 'survey_2')  bool survey2, @JsonKey(name: 'survey_2_date')  DateTime? survey2Date, @JsonKey(name: 'survey_2_notes')  String? survey2Notes, @JsonKey(name: 'plain_concrete')  bool plainConcrete, @JsonKey(name: 'plain_concrete_date')  DateTime? plainConcreteDate, @JsonKey(name: 'plain_concrete_notes')  String? plainConcreteNotes, @JsonKey(name: 'reinforced_concrete')  bool reinforcedConcrete, @JsonKey(name: 'reinforced_concrete_date')  DateTime? reinforcedConcreteDate, @JsonKey(name: 'reinforced_concrete_notes')  String? reinforcedConcreteNotes, @JsonKey(name: 'basement_columns')  bool basementColumns, @JsonKey(name: 'basement_columns_date')  DateTime? basementColumnsDate, @JsonKey(name: 'basement_columns_notes')  String? basementColumnsNotes, @JsonKey(name: 'basement_ceiling')  bool basementCeiling, @JsonKey(name: 'basement_ceiling_date')  DateTime? basementCeilingDate, @JsonKey(name: 'basement_ceiling_notes')  String? basementCeilingNotes, @JsonKey(name: 'ground_columns')  bool groundColumns, @JsonKey(name: 'ground_columns_date')  DateTime? groundColumnsDate, @JsonKey(name: 'ground_columns_notes')  String? groundColumnsNotes, @JsonKey(name: 'ground_ceiling')  bool groundCeiling, @JsonKey(name: 'ground_ceiling_date')  DateTime? groundCeilingDate, @JsonKey(name: 'ground_ceiling_notes')  String? groundCeilingNotes, @JsonKey(name: 'first_columns')  bool firstColumns, @JsonKey(name: 'first_columns_date')  DateTime? firstColumnsDate, @JsonKey(name: 'first_columns_notes')  String? firstColumnsNotes, @JsonKey(name: 'first_ceiling')  bool firstCeiling, @JsonKey(name: 'first_ceiling_date')  DateTime? firstCeilingDate, @JsonKey(name: 'first_ceiling_notes')  String? firstCeilingNotes, @JsonKey(name: 'second_columns')  bool secondColumns, @JsonKey(name: 'second_columns_date')  DateTime? secondColumnsDate, @JsonKey(name: 'second_columns_notes')  String? secondColumnsNotes, @JsonKey(name: 'second_ceiling')  bool secondCeiling, @JsonKey(name: 'second_ceiling_date')  DateTime? secondCeilingDate, @JsonKey(name: 'second_ceiling_notes')  String? secondCeilingNotes, @JsonKey(name: 'third_columns')  bool thirdColumns, @JsonKey(name: 'third_columns_date')  DateTime? thirdColumnsDate, @JsonKey(name: 'third_columns_notes')  String? thirdColumnsNotes, @JsonKey(name: 'third_ceiling')  bool thirdCeiling, @JsonKey(name: 'third_ceiling_date')  DateTime? thirdCeilingDate, @JsonKey(name: 'third_ceiling_notes')  String? thirdCeilingNotes, @JsonKey(name: 'fourth_columns')  bool fourthColumns, @JsonKey(name: 'fourth_columns_date')  DateTime? fourthColumnsDate, @JsonKey(name: 'fourth_columns_notes')  String? fourthColumnsNotes, @JsonKey(name: 'fourth_ceiling')  bool fourthCeiling, @JsonKey(name: 'fourth_ceiling_date')  DateTime? fourthCeilingDate, @JsonKey(name: 'fourth_ceiling_notes')  String? fourthCeilingNotes, @JsonKey(name: 'fifth_columns')  bool fifthColumns, @JsonKey(name: 'fifth_columns_date')  DateTime? fifthColumnsDate, @JsonKey(name: 'fifth_columns_notes')  String? fifthColumnsNotes, @JsonKey(name: 'fifth_ceiling')  bool fifthCeiling, @JsonKey(name: 'fifth_ceiling_date')  DateTime? fifthCeilingDate, @JsonKey(name: 'fifth_ceiling_notes')  String? fifthCeilingNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ExecutionStage():
return $default(_that.id,_that.customerId,_that.survey1,_that.survey1Date,_that.survey1Notes,_that.excavation,_that.excavationDate,_that.excavationNotes,_that.replacement,_that.replacementDate,_that.replacementNotes,_that.survey2,_that.survey2Date,_that.survey2Notes,_that.plainConcrete,_that.plainConcreteDate,_that.plainConcreteNotes,_that.reinforcedConcrete,_that.reinforcedConcreteDate,_that.reinforcedConcreteNotes,_that.basementColumns,_that.basementColumnsDate,_that.basementColumnsNotes,_that.basementCeiling,_that.basementCeilingDate,_that.basementCeilingNotes,_that.groundColumns,_that.groundColumnsDate,_that.groundColumnsNotes,_that.groundCeiling,_that.groundCeilingDate,_that.groundCeilingNotes,_that.firstColumns,_that.firstColumnsDate,_that.firstColumnsNotes,_that.firstCeiling,_that.firstCeilingDate,_that.firstCeilingNotes,_that.secondColumns,_that.secondColumnsDate,_that.secondColumnsNotes,_that.secondCeiling,_that.secondCeilingDate,_that.secondCeilingNotes,_that.thirdColumns,_that.thirdColumnsDate,_that.thirdColumnsNotes,_that.thirdCeiling,_that.thirdCeilingDate,_that.thirdCeilingNotes,_that.fourthColumns,_that.fourthColumnsDate,_that.fourthColumnsNotes,_that.fourthCeiling,_that.fourthCeilingDate,_that.fourthCeilingNotes,_that.fifthColumns,_that.fifthColumnsDate,_that.fifthColumnsNotes,_that.fifthCeiling,_that.fifthCeilingDate,_that.fifthCeilingNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'survey_1')  bool survey1, @JsonKey(name: 'survey_1_date')  DateTime? survey1Date, @JsonKey(name: 'survey_1_notes')  String? survey1Notes,  bool excavation, @JsonKey(name: 'excavation_date')  DateTime? excavationDate, @JsonKey(name: 'excavation_notes')  String? excavationNotes,  bool replacement, @JsonKey(name: 'replacement_date')  DateTime? replacementDate, @JsonKey(name: 'replacement_notes')  String? replacementNotes, @JsonKey(name: 'survey_2')  bool survey2, @JsonKey(name: 'survey_2_date')  DateTime? survey2Date, @JsonKey(name: 'survey_2_notes')  String? survey2Notes, @JsonKey(name: 'plain_concrete')  bool plainConcrete, @JsonKey(name: 'plain_concrete_date')  DateTime? plainConcreteDate, @JsonKey(name: 'plain_concrete_notes')  String? plainConcreteNotes, @JsonKey(name: 'reinforced_concrete')  bool reinforcedConcrete, @JsonKey(name: 'reinforced_concrete_date')  DateTime? reinforcedConcreteDate, @JsonKey(name: 'reinforced_concrete_notes')  String? reinforcedConcreteNotes, @JsonKey(name: 'basement_columns')  bool basementColumns, @JsonKey(name: 'basement_columns_date')  DateTime? basementColumnsDate, @JsonKey(name: 'basement_columns_notes')  String? basementColumnsNotes, @JsonKey(name: 'basement_ceiling')  bool basementCeiling, @JsonKey(name: 'basement_ceiling_date')  DateTime? basementCeilingDate, @JsonKey(name: 'basement_ceiling_notes')  String? basementCeilingNotes, @JsonKey(name: 'ground_columns')  bool groundColumns, @JsonKey(name: 'ground_columns_date')  DateTime? groundColumnsDate, @JsonKey(name: 'ground_columns_notes')  String? groundColumnsNotes, @JsonKey(name: 'ground_ceiling')  bool groundCeiling, @JsonKey(name: 'ground_ceiling_date')  DateTime? groundCeilingDate, @JsonKey(name: 'ground_ceiling_notes')  String? groundCeilingNotes, @JsonKey(name: 'first_columns')  bool firstColumns, @JsonKey(name: 'first_columns_date')  DateTime? firstColumnsDate, @JsonKey(name: 'first_columns_notes')  String? firstColumnsNotes, @JsonKey(name: 'first_ceiling')  bool firstCeiling, @JsonKey(name: 'first_ceiling_date')  DateTime? firstCeilingDate, @JsonKey(name: 'first_ceiling_notes')  String? firstCeilingNotes, @JsonKey(name: 'second_columns')  bool secondColumns, @JsonKey(name: 'second_columns_date')  DateTime? secondColumnsDate, @JsonKey(name: 'second_columns_notes')  String? secondColumnsNotes, @JsonKey(name: 'second_ceiling')  bool secondCeiling, @JsonKey(name: 'second_ceiling_date')  DateTime? secondCeilingDate, @JsonKey(name: 'second_ceiling_notes')  String? secondCeilingNotes, @JsonKey(name: 'third_columns')  bool thirdColumns, @JsonKey(name: 'third_columns_date')  DateTime? thirdColumnsDate, @JsonKey(name: 'third_columns_notes')  String? thirdColumnsNotes, @JsonKey(name: 'third_ceiling')  bool thirdCeiling, @JsonKey(name: 'third_ceiling_date')  DateTime? thirdCeilingDate, @JsonKey(name: 'third_ceiling_notes')  String? thirdCeilingNotes, @JsonKey(name: 'fourth_columns')  bool fourthColumns, @JsonKey(name: 'fourth_columns_date')  DateTime? fourthColumnsDate, @JsonKey(name: 'fourth_columns_notes')  String? fourthColumnsNotes, @JsonKey(name: 'fourth_ceiling')  bool fourthCeiling, @JsonKey(name: 'fourth_ceiling_date')  DateTime? fourthCeilingDate, @JsonKey(name: 'fourth_ceiling_notes')  String? fourthCeilingNotes, @JsonKey(name: 'fifth_columns')  bool fifthColumns, @JsonKey(name: 'fifth_columns_date')  DateTime? fifthColumnsDate, @JsonKey(name: 'fifth_columns_notes')  String? fifthColumnsNotes, @JsonKey(name: 'fifth_ceiling')  bool fifthCeiling, @JsonKey(name: 'fifth_ceiling_date')  DateTime? fifthCeilingDate, @JsonKey(name: 'fifth_ceiling_notes')  String? fifthCeilingNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ExecutionStage() when $default != null:
return $default(_that.id,_that.customerId,_that.survey1,_that.survey1Date,_that.survey1Notes,_that.excavation,_that.excavationDate,_that.excavationNotes,_that.replacement,_that.replacementDate,_that.replacementNotes,_that.survey2,_that.survey2Date,_that.survey2Notes,_that.plainConcrete,_that.plainConcreteDate,_that.plainConcreteNotes,_that.reinforcedConcrete,_that.reinforcedConcreteDate,_that.reinforcedConcreteNotes,_that.basementColumns,_that.basementColumnsDate,_that.basementColumnsNotes,_that.basementCeiling,_that.basementCeilingDate,_that.basementCeilingNotes,_that.groundColumns,_that.groundColumnsDate,_that.groundColumnsNotes,_that.groundCeiling,_that.groundCeilingDate,_that.groundCeilingNotes,_that.firstColumns,_that.firstColumnsDate,_that.firstColumnsNotes,_that.firstCeiling,_that.firstCeilingDate,_that.firstCeilingNotes,_that.secondColumns,_that.secondColumnsDate,_that.secondColumnsNotes,_that.secondCeiling,_that.secondCeilingDate,_that.secondCeilingNotes,_that.thirdColumns,_that.thirdColumnsDate,_that.thirdColumnsNotes,_that.thirdCeiling,_that.thirdCeilingDate,_that.thirdCeilingNotes,_that.fourthColumns,_that.fourthColumnsDate,_that.fourthColumnsNotes,_that.fourthCeiling,_that.fourthCeilingDate,_that.fourthCeilingNotes,_that.fifthColumns,_that.fifthColumnsDate,_that.fifthColumnsNotes,_that.fifthCeiling,_that.fifthCeilingDate,_that.fifthCeilingNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExecutionStage extends ExecutionStage {
  const _ExecutionStage({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'survey_1') this.survey1 = false, @JsonKey(name: 'survey_1_date') this.survey1Date, @JsonKey(name: 'survey_1_notes') this.survey1Notes, this.excavation = false, @JsonKey(name: 'excavation_date') this.excavationDate, @JsonKey(name: 'excavation_notes') this.excavationNotes, this.replacement = false, @JsonKey(name: 'replacement_date') this.replacementDate, @JsonKey(name: 'replacement_notes') this.replacementNotes, @JsonKey(name: 'survey_2') this.survey2 = false, @JsonKey(name: 'survey_2_date') this.survey2Date, @JsonKey(name: 'survey_2_notes') this.survey2Notes, @JsonKey(name: 'plain_concrete') this.plainConcrete = false, @JsonKey(name: 'plain_concrete_date') this.plainConcreteDate, @JsonKey(name: 'plain_concrete_notes') this.plainConcreteNotes, @JsonKey(name: 'reinforced_concrete') this.reinforcedConcrete = false, @JsonKey(name: 'reinforced_concrete_date') this.reinforcedConcreteDate, @JsonKey(name: 'reinforced_concrete_notes') this.reinforcedConcreteNotes, @JsonKey(name: 'basement_columns') this.basementColumns = false, @JsonKey(name: 'basement_columns_date') this.basementColumnsDate, @JsonKey(name: 'basement_columns_notes') this.basementColumnsNotes, @JsonKey(name: 'basement_ceiling') this.basementCeiling = false, @JsonKey(name: 'basement_ceiling_date') this.basementCeilingDate, @JsonKey(name: 'basement_ceiling_notes') this.basementCeilingNotes, @JsonKey(name: 'ground_columns') this.groundColumns = false, @JsonKey(name: 'ground_columns_date') this.groundColumnsDate, @JsonKey(name: 'ground_columns_notes') this.groundColumnsNotes, @JsonKey(name: 'ground_ceiling') this.groundCeiling = false, @JsonKey(name: 'ground_ceiling_date') this.groundCeilingDate, @JsonKey(name: 'ground_ceiling_notes') this.groundCeilingNotes, @JsonKey(name: 'first_columns') this.firstColumns = false, @JsonKey(name: 'first_columns_date') this.firstColumnsDate, @JsonKey(name: 'first_columns_notes') this.firstColumnsNotes, @JsonKey(name: 'first_ceiling') this.firstCeiling = false, @JsonKey(name: 'first_ceiling_date') this.firstCeilingDate, @JsonKey(name: 'first_ceiling_notes') this.firstCeilingNotes, @JsonKey(name: 'second_columns') this.secondColumns = false, @JsonKey(name: 'second_columns_date') this.secondColumnsDate, @JsonKey(name: 'second_columns_notes') this.secondColumnsNotes, @JsonKey(name: 'second_ceiling') this.secondCeiling = false, @JsonKey(name: 'second_ceiling_date') this.secondCeilingDate, @JsonKey(name: 'second_ceiling_notes') this.secondCeilingNotes, @JsonKey(name: 'third_columns') this.thirdColumns = false, @JsonKey(name: 'third_columns_date') this.thirdColumnsDate, @JsonKey(name: 'third_columns_notes') this.thirdColumnsNotes, @JsonKey(name: 'third_ceiling') this.thirdCeiling = false, @JsonKey(name: 'third_ceiling_date') this.thirdCeilingDate, @JsonKey(name: 'third_ceiling_notes') this.thirdCeilingNotes, @JsonKey(name: 'fourth_columns') this.fourthColumns = false, @JsonKey(name: 'fourth_columns_date') this.fourthColumnsDate, @JsonKey(name: 'fourth_columns_notes') this.fourthColumnsNotes, @JsonKey(name: 'fourth_ceiling') this.fourthCeiling = false, @JsonKey(name: 'fourth_ceiling_date') this.fourthCeilingDate, @JsonKey(name: 'fourth_ceiling_notes') this.fourthCeilingNotes, @JsonKey(name: 'fifth_columns') this.fifthColumns = false, @JsonKey(name: 'fifth_columns_date') this.fifthColumnsDate, @JsonKey(name: 'fifth_columns_notes') this.fifthColumnsNotes, @JsonKey(name: 'fifth_ceiling') this.fifthCeiling = false, @JsonKey(name: 'fifth_ceiling_date') this.fifthCeilingDate, @JsonKey(name: 'fifth_ceiling_notes') this.fifthCeilingNotes, @JsonKey(name: 'stage_notes') this.stageNotes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _ExecutionStage.fromJson(Map<String, dynamic> json) => _$ExecutionStageFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
// Step 1: مساحة
@override@JsonKey(name: 'survey_1') final  bool survey1;
@override@JsonKey(name: 'survey_1_date') final  DateTime? survey1Date;
@override@JsonKey(name: 'survey_1_notes') final  String? survey1Notes;
// Step 2: حفر
@override@JsonKey() final  bool excavation;
@override@JsonKey(name: 'excavation_date') final  DateTime? excavationDate;
@override@JsonKey(name: 'excavation_notes') final  String? excavationNotes;
// Step 3: إحلال
@override@JsonKey() final  bool replacement;
@override@JsonKey(name: 'replacement_date') final  DateTime? replacementDate;
@override@JsonKey(name: 'replacement_notes') final  String? replacementNotes;
// Step 4: مساحة
@override@JsonKey(name: 'survey_2') final  bool survey2;
@override@JsonKey(name: 'survey_2_date') final  DateTime? survey2Date;
@override@JsonKey(name: 'survey_2_notes') final  String? survey2Notes;
// Step 5: خرسانة عادية
@override@JsonKey(name: 'plain_concrete') final  bool plainConcrete;
@override@JsonKey(name: 'plain_concrete_date') final  DateTime? plainConcreteDate;
@override@JsonKey(name: 'plain_concrete_notes') final  String? plainConcreteNotes;
// Step 6: خرسانة مسلحة
@override@JsonKey(name: 'reinforced_concrete') final  bool reinforcedConcrete;
@override@JsonKey(name: 'reinforced_concrete_date') final  DateTime? reinforcedConcreteDate;
@override@JsonKey(name: 'reinforced_concrete_notes') final  String? reinforcedConcreteNotes;
// Step 7: أعمدة البدروم
@override@JsonKey(name: 'basement_columns') final  bool basementColumns;
@override@JsonKey(name: 'basement_columns_date') final  DateTime? basementColumnsDate;
@override@JsonKey(name: 'basement_columns_notes') final  String? basementColumnsNotes;
// Step 8: سقف البدروم
@override@JsonKey(name: 'basement_ceiling') final  bool basementCeiling;
@override@JsonKey(name: 'basement_ceiling_date') final  DateTime? basementCeilingDate;
@override@JsonKey(name: 'basement_ceiling_notes') final  String? basementCeilingNotes;
// Step 9: أعمدة الارضي
@override@JsonKey(name: 'ground_columns') final  bool groundColumns;
@override@JsonKey(name: 'ground_columns_date') final  DateTime? groundColumnsDate;
@override@JsonKey(name: 'ground_columns_notes') final  String? groundColumnsNotes;
// Step 10: سقف الارضي
@override@JsonKey(name: 'ground_ceiling') final  bool groundCeiling;
@override@JsonKey(name: 'ground_ceiling_date') final  DateTime? groundCeilingDate;
@override@JsonKey(name: 'ground_ceiling_notes') final  String? groundCeilingNotes;
// Step 11: أعمدة الأول علوي
@override@JsonKey(name: 'first_columns') final  bool firstColumns;
@override@JsonKey(name: 'first_columns_date') final  DateTime? firstColumnsDate;
@override@JsonKey(name: 'first_columns_notes') final  String? firstColumnsNotes;
// Step 12: سقف الأول علوي
@override@JsonKey(name: 'first_ceiling') final  bool firstCeiling;
@override@JsonKey(name: 'first_ceiling_date') final  DateTime? firstCeilingDate;
@override@JsonKey(name: 'first_ceiling_notes') final  String? firstCeilingNotes;
// Step 13: أعمدة الثاني علوي
@override@JsonKey(name: 'second_columns') final  bool secondColumns;
@override@JsonKey(name: 'second_columns_date') final  DateTime? secondColumnsDate;
@override@JsonKey(name: 'second_columns_notes') final  String? secondColumnsNotes;
// Step 14: سقف الثاني علوي
@override@JsonKey(name: 'second_ceiling') final  bool secondCeiling;
@override@JsonKey(name: 'second_ceiling_date') final  DateTime? secondCeilingDate;
@override@JsonKey(name: 'second_ceiling_notes') final  String? secondCeilingNotes;
// Step 15: أعمدة الثالث علوي
@override@JsonKey(name: 'third_columns') final  bool thirdColumns;
@override@JsonKey(name: 'third_columns_date') final  DateTime? thirdColumnsDate;
@override@JsonKey(name: 'third_columns_notes') final  String? thirdColumnsNotes;
// Step 16: سقف الثالث علوي
@override@JsonKey(name: 'third_ceiling') final  bool thirdCeiling;
@override@JsonKey(name: 'third_ceiling_date') final  DateTime? thirdCeilingDate;
@override@JsonKey(name: 'third_ceiling_notes') final  String? thirdCeilingNotes;
// Step 17: أعمدة الرابع علوي
@override@JsonKey(name: 'fourth_columns') final  bool fourthColumns;
@override@JsonKey(name: 'fourth_columns_date') final  DateTime? fourthColumnsDate;
@override@JsonKey(name: 'fourth_columns_notes') final  String? fourthColumnsNotes;
// Step 18: سقف الرابع علوي
@override@JsonKey(name: 'fourth_ceiling') final  bool fourthCeiling;
@override@JsonKey(name: 'fourth_ceiling_date') final  DateTime? fourthCeilingDate;
@override@JsonKey(name: 'fourth_ceiling_notes') final  String? fourthCeilingNotes;
// Step 19: أعمدة الخامس علوي
@override@JsonKey(name: 'fifth_columns') final  bool fifthColumns;
@override@JsonKey(name: 'fifth_columns_date') final  DateTime? fifthColumnsDate;
@override@JsonKey(name: 'fifth_columns_notes') final  String? fifthColumnsNotes;
// Step 20: سقف الخامس علوي
@override@JsonKey(name: 'fifth_ceiling') final  bool fifthCeiling;
@override@JsonKey(name: 'fifth_ceiling_date') final  DateTime? fifthCeilingDate;
@override@JsonKey(name: 'fifth_ceiling_notes') final  String? fifthCeilingNotes;
// General stage notes
@override@JsonKey(name: 'stage_notes') final  String? stageNotes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ExecutionStage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExecutionStageCopyWith<_ExecutionStage> get copyWith => __$ExecutionStageCopyWithImpl<_ExecutionStage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionStageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExecutionStage&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.survey1, survey1) || other.survey1 == survey1)&&(identical(other.survey1Date, survey1Date) || other.survey1Date == survey1Date)&&(identical(other.survey1Notes, survey1Notes) || other.survey1Notes == survey1Notes)&&(identical(other.excavation, excavation) || other.excavation == excavation)&&(identical(other.excavationDate, excavationDate) || other.excavationDate == excavationDate)&&(identical(other.excavationNotes, excavationNotes) || other.excavationNotes == excavationNotes)&&(identical(other.replacement, replacement) || other.replacement == replacement)&&(identical(other.replacementDate, replacementDate) || other.replacementDate == replacementDate)&&(identical(other.replacementNotes, replacementNotes) || other.replacementNotes == replacementNotes)&&(identical(other.survey2, survey2) || other.survey2 == survey2)&&(identical(other.survey2Date, survey2Date) || other.survey2Date == survey2Date)&&(identical(other.survey2Notes, survey2Notes) || other.survey2Notes == survey2Notes)&&(identical(other.plainConcrete, plainConcrete) || other.plainConcrete == plainConcrete)&&(identical(other.plainConcreteDate, plainConcreteDate) || other.plainConcreteDate == plainConcreteDate)&&(identical(other.plainConcreteNotes, plainConcreteNotes) || other.plainConcreteNotes == plainConcreteNotes)&&(identical(other.reinforcedConcrete, reinforcedConcrete) || other.reinforcedConcrete == reinforcedConcrete)&&(identical(other.reinforcedConcreteDate, reinforcedConcreteDate) || other.reinforcedConcreteDate == reinforcedConcreteDate)&&(identical(other.reinforcedConcreteNotes, reinforcedConcreteNotes) || other.reinforcedConcreteNotes == reinforcedConcreteNotes)&&(identical(other.basementColumns, basementColumns) || other.basementColumns == basementColumns)&&(identical(other.basementColumnsDate, basementColumnsDate) || other.basementColumnsDate == basementColumnsDate)&&(identical(other.basementColumnsNotes, basementColumnsNotes) || other.basementColumnsNotes == basementColumnsNotes)&&(identical(other.basementCeiling, basementCeiling) || other.basementCeiling == basementCeiling)&&(identical(other.basementCeilingDate, basementCeilingDate) || other.basementCeilingDate == basementCeilingDate)&&(identical(other.basementCeilingNotes, basementCeilingNotes) || other.basementCeilingNotes == basementCeilingNotes)&&(identical(other.groundColumns, groundColumns) || other.groundColumns == groundColumns)&&(identical(other.groundColumnsDate, groundColumnsDate) || other.groundColumnsDate == groundColumnsDate)&&(identical(other.groundColumnsNotes, groundColumnsNotes) || other.groundColumnsNotes == groundColumnsNotes)&&(identical(other.groundCeiling, groundCeiling) || other.groundCeiling == groundCeiling)&&(identical(other.groundCeilingDate, groundCeilingDate) || other.groundCeilingDate == groundCeilingDate)&&(identical(other.groundCeilingNotes, groundCeilingNotes) || other.groundCeilingNotes == groundCeilingNotes)&&(identical(other.firstColumns, firstColumns) || other.firstColumns == firstColumns)&&(identical(other.firstColumnsDate, firstColumnsDate) || other.firstColumnsDate == firstColumnsDate)&&(identical(other.firstColumnsNotes, firstColumnsNotes) || other.firstColumnsNotes == firstColumnsNotes)&&(identical(other.firstCeiling, firstCeiling) || other.firstCeiling == firstCeiling)&&(identical(other.firstCeilingDate, firstCeilingDate) || other.firstCeilingDate == firstCeilingDate)&&(identical(other.firstCeilingNotes, firstCeilingNotes) || other.firstCeilingNotes == firstCeilingNotes)&&(identical(other.secondColumns, secondColumns) || other.secondColumns == secondColumns)&&(identical(other.secondColumnsDate, secondColumnsDate) || other.secondColumnsDate == secondColumnsDate)&&(identical(other.secondColumnsNotes, secondColumnsNotes) || other.secondColumnsNotes == secondColumnsNotes)&&(identical(other.secondCeiling, secondCeiling) || other.secondCeiling == secondCeiling)&&(identical(other.secondCeilingDate, secondCeilingDate) || other.secondCeilingDate == secondCeilingDate)&&(identical(other.secondCeilingNotes, secondCeilingNotes) || other.secondCeilingNotes == secondCeilingNotes)&&(identical(other.thirdColumns, thirdColumns) || other.thirdColumns == thirdColumns)&&(identical(other.thirdColumnsDate, thirdColumnsDate) || other.thirdColumnsDate == thirdColumnsDate)&&(identical(other.thirdColumnsNotes, thirdColumnsNotes) || other.thirdColumnsNotes == thirdColumnsNotes)&&(identical(other.thirdCeiling, thirdCeiling) || other.thirdCeiling == thirdCeiling)&&(identical(other.thirdCeilingDate, thirdCeilingDate) || other.thirdCeilingDate == thirdCeilingDate)&&(identical(other.thirdCeilingNotes, thirdCeilingNotes) || other.thirdCeilingNotes == thirdCeilingNotes)&&(identical(other.fourthColumns, fourthColumns) || other.fourthColumns == fourthColumns)&&(identical(other.fourthColumnsDate, fourthColumnsDate) || other.fourthColumnsDate == fourthColumnsDate)&&(identical(other.fourthColumnsNotes, fourthColumnsNotes) || other.fourthColumnsNotes == fourthColumnsNotes)&&(identical(other.fourthCeiling, fourthCeiling) || other.fourthCeiling == fourthCeiling)&&(identical(other.fourthCeilingDate, fourthCeilingDate) || other.fourthCeilingDate == fourthCeilingDate)&&(identical(other.fourthCeilingNotes, fourthCeilingNotes) || other.fourthCeilingNotes == fourthCeilingNotes)&&(identical(other.fifthColumns, fifthColumns) || other.fifthColumns == fifthColumns)&&(identical(other.fifthColumnsDate, fifthColumnsDate) || other.fifthColumnsDate == fifthColumnsDate)&&(identical(other.fifthColumnsNotes, fifthColumnsNotes) || other.fifthColumnsNotes == fifthColumnsNotes)&&(identical(other.fifthCeiling, fifthCeiling) || other.fifthCeiling == fifthCeiling)&&(identical(other.fifthCeilingDate, fifthCeilingDate) || other.fifthCeilingDate == fifthCeilingDate)&&(identical(other.fifthCeilingNotes, fifthCeilingNotes) || other.fifthCeilingNotes == fifthCeilingNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,survey1,survey1Date,survey1Notes,excavation,excavationDate,excavationNotes,replacement,replacementDate,replacementNotes,survey2,survey2Date,survey2Notes,plainConcrete,plainConcreteDate,plainConcreteNotes,reinforcedConcrete,reinforcedConcreteDate,reinforcedConcreteNotes,basementColumns,basementColumnsDate,basementColumnsNotes,basementCeiling,basementCeilingDate,basementCeilingNotes,groundColumns,groundColumnsDate,groundColumnsNotes,groundCeiling,groundCeilingDate,groundCeilingNotes,firstColumns,firstColumnsDate,firstColumnsNotes,firstCeiling,firstCeilingDate,firstCeilingNotes,secondColumns,secondColumnsDate,secondColumnsNotes,secondCeiling,secondCeilingDate,secondCeilingNotes,thirdColumns,thirdColumnsDate,thirdColumnsNotes,thirdCeiling,thirdCeilingDate,thirdCeilingNotes,fourthColumns,fourthColumnsDate,fourthColumnsNotes,fourthCeiling,fourthCeilingDate,fourthCeilingNotes,fifthColumns,fifthColumnsDate,fifthColumnsNotes,fifthCeiling,fifthCeilingDate,fifthCeilingNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'ExecutionStage(id: $id, customerId: $customerId, survey1: $survey1, survey1Date: $survey1Date, survey1Notes: $survey1Notes, excavation: $excavation, excavationDate: $excavationDate, excavationNotes: $excavationNotes, replacement: $replacement, replacementDate: $replacementDate, replacementNotes: $replacementNotes, survey2: $survey2, survey2Date: $survey2Date, survey2Notes: $survey2Notes, plainConcrete: $plainConcrete, plainConcreteDate: $plainConcreteDate, plainConcreteNotes: $plainConcreteNotes, reinforcedConcrete: $reinforcedConcrete, reinforcedConcreteDate: $reinforcedConcreteDate, reinforcedConcreteNotes: $reinforcedConcreteNotes, basementColumns: $basementColumns, basementColumnsDate: $basementColumnsDate, basementColumnsNotes: $basementColumnsNotes, basementCeiling: $basementCeiling, basementCeilingDate: $basementCeilingDate, basementCeilingNotes: $basementCeilingNotes, groundColumns: $groundColumns, groundColumnsDate: $groundColumnsDate, groundColumnsNotes: $groundColumnsNotes, groundCeiling: $groundCeiling, groundCeilingDate: $groundCeilingDate, groundCeilingNotes: $groundCeilingNotes, firstColumns: $firstColumns, firstColumnsDate: $firstColumnsDate, firstColumnsNotes: $firstColumnsNotes, firstCeiling: $firstCeiling, firstCeilingDate: $firstCeilingDate, firstCeilingNotes: $firstCeilingNotes, secondColumns: $secondColumns, secondColumnsDate: $secondColumnsDate, secondColumnsNotes: $secondColumnsNotes, secondCeiling: $secondCeiling, secondCeilingDate: $secondCeilingDate, secondCeilingNotes: $secondCeilingNotes, thirdColumns: $thirdColumns, thirdColumnsDate: $thirdColumnsDate, thirdColumnsNotes: $thirdColumnsNotes, thirdCeiling: $thirdCeiling, thirdCeilingDate: $thirdCeilingDate, thirdCeilingNotes: $thirdCeilingNotes, fourthColumns: $fourthColumns, fourthColumnsDate: $fourthColumnsDate, fourthColumnsNotes: $fourthColumnsNotes, fourthCeiling: $fourthCeiling, fourthCeilingDate: $fourthCeilingDate, fourthCeilingNotes: $fourthCeilingNotes, fifthColumns: $fifthColumns, fifthColumnsDate: $fifthColumnsDate, fifthColumnsNotes: $fifthColumnsNotes, fifthCeiling: $fifthCeiling, fifthCeilingDate: $fifthCeilingDate, fifthCeilingNotes: $fifthCeilingNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ExecutionStageCopyWith<$Res> implements $ExecutionStageCopyWith<$Res> {
  factory _$ExecutionStageCopyWith(_ExecutionStage value, $Res Function(_ExecutionStage) _then) = __$ExecutionStageCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'survey_1') bool survey1,@JsonKey(name: 'survey_1_date') DateTime? survey1Date,@JsonKey(name: 'survey_1_notes') String? survey1Notes, bool excavation,@JsonKey(name: 'excavation_date') DateTime? excavationDate,@JsonKey(name: 'excavation_notes') String? excavationNotes, bool replacement,@JsonKey(name: 'replacement_date') DateTime? replacementDate,@JsonKey(name: 'replacement_notes') String? replacementNotes,@JsonKey(name: 'survey_2') bool survey2,@JsonKey(name: 'survey_2_date') DateTime? survey2Date,@JsonKey(name: 'survey_2_notes') String? survey2Notes,@JsonKey(name: 'plain_concrete') bool plainConcrete,@JsonKey(name: 'plain_concrete_date') DateTime? plainConcreteDate,@JsonKey(name: 'plain_concrete_notes') String? plainConcreteNotes,@JsonKey(name: 'reinforced_concrete') bool reinforcedConcrete,@JsonKey(name: 'reinforced_concrete_date') DateTime? reinforcedConcreteDate,@JsonKey(name: 'reinforced_concrete_notes') String? reinforcedConcreteNotes,@JsonKey(name: 'basement_columns') bool basementColumns,@JsonKey(name: 'basement_columns_date') DateTime? basementColumnsDate,@JsonKey(name: 'basement_columns_notes') String? basementColumnsNotes,@JsonKey(name: 'basement_ceiling') bool basementCeiling,@JsonKey(name: 'basement_ceiling_date') DateTime? basementCeilingDate,@JsonKey(name: 'basement_ceiling_notes') String? basementCeilingNotes,@JsonKey(name: 'ground_columns') bool groundColumns,@JsonKey(name: 'ground_columns_date') DateTime? groundColumnsDate,@JsonKey(name: 'ground_columns_notes') String? groundColumnsNotes,@JsonKey(name: 'ground_ceiling') bool groundCeiling,@JsonKey(name: 'ground_ceiling_date') DateTime? groundCeilingDate,@JsonKey(name: 'ground_ceiling_notes') String? groundCeilingNotes,@JsonKey(name: 'first_columns') bool firstColumns,@JsonKey(name: 'first_columns_date') DateTime? firstColumnsDate,@JsonKey(name: 'first_columns_notes') String? firstColumnsNotes,@JsonKey(name: 'first_ceiling') bool firstCeiling,@JsonKey(name: 'first_ceiling_date') DateTime? firstCeilingDate,@JsonKey(name: 'first_ceiling_notes') String? firstCeilingNotes,@JsonKey(name: 'second_columns') bool secondColumns,@JsonKey(name: 'second_columns_date') DateTime? secondColumnsDate,@JsonKey(name: 'second_columns_notes') String? secondColumnsNotes,@JsonKey(name: 'second_ceiling') bool secondCeiling,@JsonKey(name: 'second_ceiling_date') DateTime? secondCeilingDate,@JsonKey(name: 'second_ceiling_notes') String? secondCeilingNotes,@JsonKey(name: 'third_columns') bool thirdColumns,@JsonKey(name: 'third_columns_date') DateTime? thirdColumnsDate,@JsonKey(name: 'third_columns_notes') String? thirdColumnsNotes,@JsonKey(name: 'third_ceiling') bool thirdCeiling,@JsonKey(name: 'third_ceiling_date') DateTime? thirdCeilingDate,@JsonKey(name: 'third_ceiling_notes') String? thirdCeilingNotes,@JsonKey(name: 'fourth_columns') bool fourthColumns,@JsonKey(name: 'fourth_columns_date') DateTime? fourthColumnsDate,@JsonKey(name: 'fourth_columns_notes') String? fourthColumnsNotes,@JsonKey(name: 'fourth_ceiling') bool fourthCeiling,@JsonKey(name: 'fourth_ceiling_date') DateTime? fourthCeilingDate,@JsonKey(name: 'fourth_ceiling_notes') String? fourthCeilingNotes,@JsonKey(name: 'fifth_columns') bool fifthColumns,@JsonKey(name: 'fifth_columns_date') DateTime? fifthColumnsDate,@JsonKey(name: 'fifth_columns_notes') String? fifthColumnsNotes,@JsonKey(name: 'fifth_ceiling') bool fifthCeiling,@JsonKey(name: 'fifth_ceiling_date') DateTime? fifthCeilingDate,@JsonKey(name: 'fifth_ceiling_notes') String? fifthCeilingNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ExecutionStageCopyWithImpl<$Res>
    implements _$ExecutionStageCopyWith<$Res> {
  __$ExecutionStageCopyWithImpl(this._self, this._then);

  final _ExecutionStage _self;
  final $Res Function(_ExecutionStage) _then;

/// Create a copy of ExecutionStage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? survey1 = null,Object? survey1Date = freezed,Object? survey1Notes = freezed,Object? excavation = null,Object? excavationDate = freezed,Object? excavationNotes = freezed,Object? replacement = null,Object? replacementDate = freezed,Object? replacementNotes = freezed,Object? survey2 = null,Object? survey2Date = freezed,Object? survey2Notes = freezed,Object? plainConcrete = null,Object? plainConcreteDate = freezed,Object? plainConcreteNotes = freezed,Object? reinforcedConcrete = null,Object? reinforcedConcreteDate = freezed,Object? reinforcedConcreteNotes = freezed,Object? basementColumns = null,Object? basementColumnsDate = freezed,Object? basementColumnsNotes = freezed,Object? basementCeiling = null,Object? basementCeilingDate = freezed,Object? basementCeilingNotes = freezed,Object? groundColumns = null,Object? groundColumnsDate = freezed,Object? groundColumnsNotes = freezed,Object? groundCeiling = null,Object? groundCeilingDate = freezed,Object? groundCeilingNotes = freezed,Object? firstColumns = null,Object? firstColumnsDate = freezed,Object? firstColumnsNotes = freezed,Object? firstCeiling = null,Object? firstCeilingDate = freezed,Object? firstCeilingNotes = freezed,Object? secondColumns = null,Object? secondColumnsDate = freezed,Object? secondColumnsNotes = freezed,Object? secondCeiling = null,Object? secondCeilingDate = freezed,Object? secondCeilingNotes = freezed,Object? thirdColumns = null,Object? thirdColumnsDate = freezed,Object? thirdColumnsNotes = freezed,Object? thirdCeiling = null,Object? thirdCeilingDate = freezed,Object? thirdCeilingNotes = freezed,Object? fourthColumns = null,Object? fourthColumnsDate = freezed,Object? fourthColumnsNotes = freezed,Object? fourthCeiling = null,Object? fourthCeilingDate = freezed,Object? fourthCeilingNotes = freezed,Object? fifthColumns = null,Object? fifthColumnsDate = freezed,Object? fifthColumnsNotes = freezed,Object? fifthCeiling = null,Object? fifthCeilingDate = freezed,Object? fifthCeilingNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ExecutionStage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,survey1: null == survey1 ? _self.survey1 : survey1 // ignore: cast_nullable_to_non_nullable
as bool,survey1Date: freezed == survey1Date ? _self.survey1Date : survey1Date // ignore: cast_nullable_to_non_nullable
as DateTime?,survey1Notes: freezed == survey1Notes ? _self.survey1Notes : survey1Notes // ignore: cast_nullable_to_non_nullable
as String?,excavation: null == excavation ? _self.excavation : excavation // ignore: cast_nullable_to_non_nullable
as bool,excavationDate: freezed == excavationDate ? _self.excavationDate : excavationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,excavationNotes: freezed == excavationNotes ? _self.excavationNotes : excavationNotes // ignore: cast_nullable_to_non_nullable
as String?,replacement: null == replacement ? _self.replacement : replacement // ignore: cast_nullable_to_non_nullable
as bool,replacementDate: freezed == replacementDate ? _self.replacementDate : replacementDate // ignore: cast_nullable_to_non_nullable
as DateTime?,replacementNotes: freezed == replacementNotes ? _self.replacementNotes : replacementNotes // ignore: cast_nullable_to_non_nullable
as String?,survey2: null == survey2 ? _self.survey2 : survey2 // ignore: cast_nullable_to_non_nullable
as bool,survey2Date: freezed == survey2Date ? _self.survey2Date : survey2Date // ignore: cast_nullable_to_non_nullable
as DateTime?,survey2Notes: freezed == survey2Notes ? _self.survey2Notes : survey2Notes // ignore: cast_nullable_to_non_nullable
as String?,plainConcrete: null == plainConcrete ? _self.plainConcrete : plainConcrete // ignore: cast_nullable_to_non_nullable
as bool,plainConcreteDate: freezed == plainConcreteDate ? _self.plainConcreteDate : plainConcreteDate // ignore: cast_nullable_to_non_nullable
as DateTime?,plainConcreteNotes: freezed == plainConcreteNotes ? _self.plainConcreteNotes : plainConcreteNotes // ignore: cast_nullable_to_non_nullable
as String?,reinforcedConcrete: null == reinforcedConcrete ? _self.reinforcedConcrete : reinforcedConcrete // ignore: cast_nullable_to_non_nullable
as bool,reinforcedConcreteDate: freezed == reinforcedConcreteDate ? _self.reinforcedConcreteDate : reinforcedConcreteDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reinforcedConcreteNotes: freezed == reinforcedConcreteNotes ? _self.reinforcedConcreteNotes : reinforcedConcreteNotes // ignore: cast_nullable_to_non_nullable
as String?,basementColumns: null == basementColumns ? _self.basementColumns : basementColumns // ignore: cast_nullable_to_non_nullable
as bool,basementColumnsDate: freezed == basementColumnsDate ? _self.basementColumnsDate : basementColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,basementColumnsNotes: freezed == basementColumnsNotes ? _self.basementColumnsNotes : basementColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,basementCeiling: null == basementCeiling ? _self.basementCeiling : basementCeiling // ignore: cast_nullable_to_non_nullable
as bool,basementCeilingDate: freezed == basementCeilingDate ? _self.basementCeilingDate : basementCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,basementCeilingNotes: freezed == basementCeilingNotes ? _self.basementCeilingNotes : basementCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,groundColumns: null == groundColumns ? _self.groundColumns : groundColumns // ignore: cast_nullable_to_non_nullable
as bool,groundColumnsDate: freezed == groundColumnsDate ? _self.groundColumnsDate : groundColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,groundColumnsNotes: freezed == groundColumnsNotes ? _self.groundColumnsNotes : groundColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,groundCeiling: null == groundCeiling ? _self.groundCeiling : groundCeiling // ignore: cast_nullable_to_non_nullable
as bool,groundCeilingDate: freezed == groundCeilingDate ? _self.groundCeilingDate : groundCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,groundCeilingNotes: freezed == groundCeilingNotes ? _self.groundCeilingNotes : groundCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,firstColumns: null == firstColumns ? _self.firstColumns : firstColumns // ignore: cast_nullable_to_non_nullable
as bool,firstColumnsDate: freezed == firstColumnsDate ? _self.firstColumnsDate : firstColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstColumnsNotes: freezed == firstColumnsNotes ? _self.firstColumnsNotes : firstColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,firstCeiling: null == firstCeiling ? _self.firstCeiling : firstCeiling // ignore: cast_nullable_to_non_nullable
as bool,firstCeilingDate: freezed == firstCeilingDate ? _self.firstCeilingDate : firstCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstCeilingNotes: freezed == firstCeilingNotes ? _self.firstCeilingNotes : firstCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,secondColumns: null == secondColumns ? _self.secondColumns : secondColumns // ignore: cast_nullable_to_non_nullable
as bool,secondColumnsDate: freezed == secondColumnsDate ? _self.secondColumnsDate : secondColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,secondColumnsNotes: freezed == secondColumnsNotes ? _self.secondColumnsNotes : secondColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,secondCeiling: null == secondCeiling ? _self.secondCeiling : secondCeiling // ignore: cast_nullable_to_non_nullable
as bool,secondCeilingDate: freezed == secondCeilingDate ? _self.secondCeilingDate : secondCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,secondCeilingNotes: freezed == secondCeilingNotes ? _self.secondCeilingNotes : secondCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,thirdColumns: null == thirdColumns ? _self.thirdColumns : thirdColumns // ignore: cast_nullable_to_non_nullable
as bool,thirdColumnsDate: freezed == thirdColumnsDate ? _self.thirdColumnsDate : thirdColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,thirdColumnsNotes: freezed == thirdColumnsNotes ? _self.thirdColumnsNotes : thirdColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,thirdCeiling: null == thirdCeiling ? _self.thirdCeiling : thirdCeiling // ignore: cast_nullable_to_non_nullable
as bool,thirdCeilingDate: freezed == thirdCeilingDate ? _self.thirdCeilingDate : thirdCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,thirdCeilingNotes: freezed == thirdCeilingNotes ? _self.thirdCeilingNotes : thirdCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,fourthColumns: null == fourthColumns ? _self.fourthColumns : fourthColumns // ignore: cast_nullable_to_non_nullable
as bool,fourthColumnsDate: freezed == fourthColumnsDate ? _self.fourthColumnsDate : fourthColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fourthColumnsNotes: freezed == fourthColumnsNotes ? _self.fourthColumnsNotes : fourthColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,fourthCeiling: null == fourthCeiling ? _self.fourthCeiling : fourthCeiling // ignore: cast_nullable_to_non_nullable
as bool,fourthCeilingDate: freezed == fourthCeilingDate ? _self.fourthCeilingDate : fourthCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fourthCeilingNotes: freezed == fourthCeilingNotes ? _self.fourthCeilingNotes : fourthCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,fifthColumns: null == fifthColumns ? _self.fifthColumns : fifthColumns // ignore: cast_nullable_to_non_nullable
as bool,fifthColumnsDate: freezed == fifthColumnsDate ? _self.fifthColumnsDate : fifthColumnsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fifthColumnsNotes: freezed == fifthColumnsNotes ? _self.fifthColumnsNotes : fifthColumnsNotes // ignore: cast_nullable_to_non_nullable
as String?,fifthCeiling: null == fifthCeiling ? _self.fifthCeiling : fifthCeiling // ignore: cast_nullable_to_non_nullable
as bool,fifthCeilingDate: freezed == fifthCeilingDate ? _self.fifthCeilingDate : fifthCeilingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fifthCeilingNotes: freezed == fifthCeilingNotes ? _self.fifthCeilingNotes : fifthCeilingNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
