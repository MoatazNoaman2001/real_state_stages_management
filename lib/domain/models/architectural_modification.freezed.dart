// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'architectural_modification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArchitecturalModification {

 int get id;@JsonKey(name: 'customer_id') int get customerId;// Step 1: رسم اللوحات
@JsonKey(name: 'draw_boards') bool get drawBoards;@JsonKey(name: 'draw_boards_date') DateTime? get drawBoardsDate;@JsonKey(name: 'draw_boards_notes') String? get drawBoardsNotes;// Step 2: المعاينة علي الطبيعة
@JsonKey(name: 'field_inspection') bool get fieldInspection;@JsonKey(name: 'field_inspection_date') DateTime? get fieldInspectionDate;@JsonKey(name: 'field_inspection_notes') String? get fieldInspectionNotes;// Step 3: رسم التعديلات المعمارية
@JsonKey(name: 'draw_modifications') bool get drawModifications;@JsonKey(name: 'draw_modifications_date') DateTime? get drawModificationsDate;@JsonKey(name: 'draw_modifications_notes') String? get drawModificationsNotes;// Step 4: تقديم الطلب
@JsonKey(name: 'submit_request') bool get submitRequest;@JsonKey(name: 'submit_request_date') DateTime? get submitRequestDate;@JsonKey(name: 'submit_request_notes') String? get submitRequestNotes;// Step 5: رقم الطلب
@JsonKey(name: 'request_number') String? get requestNumber;@JsonKey(name: 'request_number_notes') String? get requestNumberNotes;// Step 6: ميعاد المعاينة من الجهاز (has money field)
@JsonKey(name: 'inspection_date') DateTime? get inspectionDate;@JsonKey(name: 'inspection_notes') String? get inspectionNotes;@DoubleConverter()@JsonKey(name: 'inspection_amount') double? get inspectionAmount;// Step 7: المعاينة من الجهاز
@JsonKey(name: 'inspection_from_agency') bool get inspectionFromAgency;@JsonKey(name: 'inspection_from_agency_date') DateTime? get inspectionFromAgencyDate;@JsonKey(name: 'inspection_from_agency_notes') String? get inspectionFromAgencyNotes;// Step 8: مراجعة مع الجهاز
@JsonKey(name: 'review_with_agency') bool get reviewWithAgency;@JsonKey(name: 'review_with_agency_date') DateTime? get reviewWithAgencyDate;@JsonKey(name: 'review_with_agency_notes') String? get reviewWithAgencyNotes;// Step 9: اعتماد اللوحات
@JsonKey(name: 'approve_boards') bool get approveBoards;@JsonKey(name: 'approve_boards_date') DateTime? get approveBoardsDate;@JsonKey(name: 'approve_boards_notes') String? get approveBoardsNotes;// Step 10: إعطاء النسخة للمالك
@JsonKey(name: 'give_copy_to_owner') bool get giveCopyToOwner;@JsonKey(name: 'give_copy_to_owner_date') DateTime? get giveCopyToOwnerDate;@JsonKey(name: 'give_copy_to_owner_notes') String? get giveCopyToOwnerNotes;// General stage notes
@JsonKey(name: 'stage_notes') String? get stageNotes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ArchitecturalModification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchitecturalModificationCopyWith<ArchitecturalModification> get copyWith => _$ArchitecturalModificationCopyWithImpl<ArchitecturalModification>(this as ArchitecturalModification, _$identity);

  /// Serializes this ArchitecturalModification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchitecturalModification&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.drawBoards, drawBoards) || other.drawBoards == drawBoards)&&(identical(other.drawBoardsDate, drawBoardsDate) || other.drawBoardsDate == drawBoardsDate)&&(identical(other.drawBoardsNotes, drawBoardsNotes) || other.drawBoardsNotes == drawBoardsNotes)&&(identical(other.fieldInspection, fieldInspection) || other.fieldInspection == fieldInspection)&&(identical(other.fieldInspectionDate, fieldInspectionDate) || other.fieldInspectionDate == fieldInspectionDate)&&(identical(other.fieldInspectionNotes, fieldInspectionNotes) || other.fieldInspectionNotes == fieldInspectionNotes)&&(identical(other.drawModifications, drawModifications) || other.drawModifications == drawModifications)&&(identical(other.drawModificationsDate, drawModificationsDate) || other.drawModificationsDate == drawModificationsDate)&&(identical(other.drawModificationsNotes, drawModificationsNotes) || other.drawModificationsNotes == drawModificationsNotes)&&(identical(other.submitRequest, submitRequest) || other.submitRequest == submitRequest)&&(identical(other.submitRequestDate, submitRequestDate) || other.submitRequestDate == submitRequestDate)&&(identical(other.submitRequestNotes, submitRequestNotes) || other.submitRequestNotes == submitRequestNotes)&&(identical(other.requestNumber, requestNumber) || other.requestNumber == requestNumber)&&(identical(other.requestNumberNotes, requestNumberNotes) || other.requestNumberNotes == requestNumberNotes)&&(identical(other.inspectionDate, inspectionDate) || other.inspectionDate == inspectionDate)&&(identical(other.inspectionNotes, inspectionNotes) || other.inspectionNotes == inspectionNotes)&&(identical(other.inspectionAmount, inspectionAmount) || other.inspectionAmount == inspectionAmount)&&(identical(other.inspectionFromAgency, inspectionFromAgency) || other.inspectionFromAgency == inspectionFromAgency)&&(identical(other.inspectionFromAgencyDate, inspectionFromAgencyDate) || other.inspectionFromAgencyDate == inspectionFromAgencyDate)&&(identical(other.inspectionFromAgencyNotes, inspectionFromAgencyNotes) || other.inspectionFromAgencyNotes == inspectionFromAgencyNotes)&&(identical(other.reviewWithAgency, reviewWithAgency) || other.reviewWithAgency == reviewWithAgency)&&(identical(other.reviewWithAgencyDate, reviewWithAgencyDate) || other.reviewWithAgencyDate == reviewWithAgencyDate)&&(identical(other.reviewWithAgencyNotes, reviewWithAgencyNotes) || other.reviewWithAgencyNotes == reviewWithAgencyNotes)&&(identical(other.approveBoards, approveBoards) || other.approveBoards == approveBoards)&&(identical(other.approveBoardsDate, approveBoardsDate) || other.approveBoardsDate == approveBoardsDate)&&(identical(other.approveBoardsNotes, approveBoardsNotes) || other.approveBoardsNotes == approveBoardsNotes)&&(identical(other.giveCopyToOwner, giveCopyToOwner) || other.giveCopyToOwner == giveCopyToOwner)&&(identical(other.giveCopyToOwnerDate, giveCopyToOwnerDate) || other.giveCopyToOwnerDate == giveCopyToOwnerDate)&&(identical(other.giveCopyToOwnerNotes, giveCopyToOwnerNotes) || other.giveCopyToOwnerNotes == giveCopyToOwnerNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,drawBoards,drawBoardsDate,drawBoardsNotes,fieldInspection,fieldInspectionDate,fieldInspectionNotes,drawModifications,drawModificationsDate,drawModificationsNotes,submitRequest,submitRequestDate,submitRequestNotes,requestNumber,requestNumberNotes,inspectionDate,inspectionNotes,inspectionAmount,inspectionFromAgency,inspectionFromAgencyDate,inspectionFromAgencyNotes,reviewWithAgency,reviewWithAgencyDate,reviewWithAgencyNotes,approveBoards,approveBoardsDate,approveBoardsNotes,giveCopyToOwner,giveCopyToOwnerDate,giveCopyToOwnerNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'ArchitecturalModification(id: $id, customerId: $customerId, drawBoards: $drawBoards, drawBoardsDate: $drawBoardsDate, drawBoardsNotes: $drawBoardsNotes, fieldInspection: $fieldInspection, fieldInspectionDate: $fieldInspectionDate, fieldInspectionNotes: $fieldInspectionNotes, drawModifications: $drawModifications, drawModificationsDate: $drawModificationsDate, drawModificationsNotes: $drawModificationsNotes, submitRequest: $submitRequest, submitRequestDate: $submitRequestDate, submitRequestNotes: $submitRequestNotes, requestNumber: $requestNumber, requestNumberNotes: $requestNumberNotes, inspectionDate: $inspectionDate, inspectionNotes: $inspectionNotes, inspectionAmount: $inspectionAmount, inspectionFromAgency: $inspectionFromAgency, inspectionFromAgencyDate: $inspectionFromAgencyDate, inspectionFromAgencyNotes: $inspectionFromAgencyNotes, reviewWithAgency: $reviewWithAgency, reviewWithAgencyDate: $reviewWithAgencyDate, reviewWithAgencyNotes: $reviewWithAgencyNotes, approveBoards: $approveBoards, approveBoardsDate: $approveBoardsDate, approveBoardsNotes: $approveBoardsNotes, giveCopyToOwner: $giveCopyToOwner, giveCopyToOwnerDate: $giveCopyToOwnerDate, giveCopyToOwnerNotes: $giveCopyToOwnerNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ArchitecturalModificationCopyWith<$Res>  {
  factory $ArchitecturalModificationCopyWith(ArchitecturalModification value, $Res Function(ArchitecturalModification) _then) = _$ArchitecturalModificationCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'draw_boards') bool drawBoards,@JsonKey(name: 'draw_boards_date') DateTime? drawBoardsDate,@JsonKey(name: 'draw_boards_notes') String? drawBoardsNotes,@JsonKey(name: 'field_inspection') bool fieldInspection,@JsonKey(name: 'field_inspection_date') DateTime? fieldInspectionDate,@JsonKey(name: 'field_inspection_notes') String? fieldInspectionNotes,@JsonKey(name: 'draw_modifications') bool drawModifications,@JsonKey(name: 'draw_modifications_date') DateTime? drawModificationsDate,@JsonKey(name: 'draw_modifications_notes') String? drawModificationsNotes,@JsonKey(name: 'submit_request') bool submitRequest,@JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,@JsonKey(name: 'submit_request_notes') String? submitRequestNotes,@JsonKey(name: 'request_number') String? requestNumber,@JsonKey(name: 'request_number_notes') String? requestNumberNotes,@JsonKey(name: 'inspection_date') DateTime? inspectionDate,@JsonKey(name: 'inspection_notes') String? inspectionNotes,@DoubleConverter()@JsonKey(name: 'inspection_amount') double? inspectionAmount,@JsonKey(name: 'inspection_from_agency') bool inspectionFromAgency,@JsonKey(name: 'inspection_from_agency_date') DateTime? inspectionFromAgencyDate,@JsonKey(name: 'inspection_from_agency_notes') String? inspectionFromAgencyNotes,@JsonKey(name: 'review_with_agency') bool reviewWithAgency,@JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,@JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,@JsonKey(name: 'approve_boards') bool approveBoards,@JsonKey(name: 'approve_boards_date') DateTime? approveBoardsDate,@JsonKey(name: 'approve_boards_notes') String? approveBoardsNotes,@JsonKey(name: 'give_copy_to_owner') bool giveCopyToOwner,@JsonKey(name: 'give_copy_to_owner_date') DateTime? giveCopyToOwnerDate,@JsonKey(name: 'give_copy_to_owner_notes') String? giveCopyToOwnerNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ArchitecturalModificationCopyWithImpl<$Res>
    implements $ArchitecturalModificationCopyWith<$Res> {
  _$ArchitecturalModificationCopyWithImpl(this._self, this._then);

  final ArchitecturalModification _self;
  final $Res Function(ArchitecturalModification) _then;

/// Create a copy of ArchitecturalModification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? drawBoards = null,Object? drawBoardsDate = freezed,Object? drawBoardsNotes = freezed,Object? fieldInspection = null,Object? fieldInspectionDate = freezed,Object? fieldInspectionNotes = freezed,Object? drawModifications = null,Object? drawModificationsDate = freezed,Object? drawModificationsNotes = freezed,Object? submitRequest = null,Object? submitRequestDate = freezed,Object? submitRequestNotes = freezed,Object? requestNumber = freezed,Object? requestNumberNotes = freezed,Object? inspectionDate = freezed,Object? inspectionNotes = freezed,Object? inspectionAmount = freezed,Object? inspectionFromAgency = null,Object? inspectionFromAgencyDate = freezed,Object? inspectionFromAgencyNotes = freezed,Object? reviewWithAgency = null,Object? reviewWithAgencyDate = freezed,Object? reviewWithAgencyNotes = freezed,Object? approveBoards = null,Object? approveBoardsDate = freezed,Object? approveBoardsNotes = freezed,Object? giveCopyToOwner = null,Object? giveCopyToOwnerDate = freezed,Object? giveCopyToOwnerNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,drawBoards: null == drawBoards ? _self.drawBoards : drawBoards // ignore: cast_nullable_to_non_nullable
as bool,drawBoardsDate: freezed == drawBoardsDate ? _self.drawBoardsDate : drawBoardsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,drawBoardsNotes: freezed == drawBoardsNotes ? _self.drawBoardsNotes : drawBoardsNotes // ignore: cast_nullable_to_non_nullable
as String?,fieldInspection: null == fieldInspection ? _self.fieldInspection : fieldInspection // ignore: cast_nullable_to_non_nullable
as bool,fieldInspectionDate: freezed == fieldInspectionDate ? _self.fieldInspectionDate : fieldInspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fieldInspectionNotes: freezed == fieldInspectionNotes ? _self.fieldInspectionNotes : fieldInspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,drawModifications: null == drawModifications ? _self.drawModifications : drawModifications // ignore: cast_nullable_to_non_nullable
as bool,drawModificationsDate: freezed == drawModificationsDate ? _self.drawModificationsDate : drawModificationsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,drawModificationsNotes: freezed == drawModificationsNotes ? _self.drawModificationsNotes : drawModificationsNotes // ignore: cast_nullable_to_non_nullable
as String?,submitRequest: null == submitRequest ? _self.submitRequest : submitRequest // ignore: cast_nullable_to_non_nullable
as bool,submitRequestDate: freezed == submitRequestDate ? _self.submitRequestDate : submitRequestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitRequestNotes: freezed == submitRequestNotes ? _self.submitRequestNotes : submitRequestNotes // ignore: cast_nullable_to_non_nullable
as String?,requestNumber: freezed == requestNumber ? _self.requestNumber : requestNumber // ignore: cast_nullable_to_non_nullable
as String?,requestNumberNotes: freezed == requestNumberNotes ? _self.requestNumberNotes : requestNumberNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionDate: freezed == inspectionDate ? _self.inspectionDate : inspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionNotes: freezed == inspectionNotes ? _self.inspectionNotes : inspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionAmount: freezed == inspectionAmount ? _self.inspectionAmount : inspectionAmount // ignore: cast_nullable_to_non_nullable
as double?,inspectionFromAgency: null == inspectionFromAgency ? _self.inspectionFromAgency : inspectionFromAgency // ignore: cast_nullable_to_non_nullable
as bool,inspectionFromAgencyDate: freezed == inspectionFromAgencyDate ? _self.inspectionFromAgencyDate : inspectionFromAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionFromAgencyNotes: freezed == inspectionFromAgencyNotes ? _self.inspectionFromAgencyNotes : inspectionFromAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,reviewWithAgency: null == reviewWithAgency ? _self.reviewWithAgency : reviewWithAgency // ignore: cast_nullable_to_non_nullable
as bool,reviewWithAgencyDate: freezed == reviewWithAgencyDate ? _self.reviewWithAgencyDate : reviewWithAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewWithAgencyNotes: freezed == reviewWithAgencyNotes ? _self.reviewWithAgencyNotes : reviewWithAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,approveBoards: null == approveBoards ? _self.approveBoards : approveBoards // ignore: cast_nullable_to_non_nullable
as bool,approveBoardsDate: freezed == approveBoardsDate ? _self.approveBoardsDate : approveBoardsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approveBoardsNotes: freezed == approveBoardsNotes ? _self.approveBoardsNotes : approveBoardsNotes // ignore: cast_nullable_to_non_nullable
as String?,giveCopyToOwner: null == giveCopyToOwner ? _self.giveCopyToOwner : giveCopyToOwner // ignore: cast_nullable_to_non_nullable
as bool,giveCopyToOwnerDate: freezed == giveCopyToOwnerDate ? _self.giveCopyToOwnerDate : giveCopyToOwnerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,giveCopyToOwnerNotes: freezed == giveCopyToOwnerNotes ? _self.giveCopyToOwnerNotes : giveCopyToOwnerNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ArchitecturalModification].
extension ArchitecturalModificationPatterns on ArchitecturalModification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchitecturalModification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchitecturalModification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchitecturalModification value)  $default,){
final _that = this;
switch (_that) {
case _ArchitecturalModification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchitecturalModification value)?  $default,){
final _that = this;
switch (_that) {
case _ArchitecturalModification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'draw_boards')  bool drawBoards, @JsonKey(name: 'draw_boards_date')  DateTime? drawBoardsDate, @JsonKey(name: 'draw_boards_notes')  String? drawBoardsNotes, @JsonKey(name: 'field_inspection')  bool fieldInspection, @JsonKey(name: 'field_inspection_date')  DateTime? fieldInspectionDate, @JsonKey(name: 'field_inspection_notes')  String? fieldInspectionNotes, @JsonKey(name: 'draw_modifications')  bool drawModifications, @JsonKey(name: 'draw_modifications_date')  DateTime? drawModificationsDate, @JsonKey(name: 'draw_modifications_notes')  String? drawModificationsNotes, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'request_number')  String? requestNumber, @JsonKey(name: 'request_number_notes')  String? requestNumberNotes, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @DoubleConverter()@JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_from_agency')  bool inspectionFromAgency, @JsonKey(name: 'inspection_from_agency_date')  DateTime? inspectionFromAgencyDate, @JsonKey(name: 'inspection_from_agency_notes')  String? inspectionFromAgencyNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'approve_boards')  bool approveBoards, @JsonKey(name: 'approve_boards_date')  DateTime? approveBoardsDate, @JsonKey(name: 'approve_boards_notes')  String? approveBoardsNotes, @JsonKey(name: 'give_copy_to_owner')  bool giveCopyToOwner, @JsonKey(name: 'give_copy_to_owner_date')  DateTime? giveCopyToOwnerDate, @JsonKey(name: 'give_copy_to_owner_notes')  String? giveCopyToOwnerNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchitecturalModification() when $default != null:
return $default(_that.id,_that.customerId,_that.drawBoards,_that.drawBoardsDate,_that.drawBoardsNotes,_that.fieldInspection,_that.fieldInspectionDate,_that.fieldInspectionNotes,_that.drawModifications,_that.drawModificationsDate,_that.drawModificationsNotes,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.requestNumber,_that.requestNumberNotes,_that.inspectionDate,_that.inspectionNotes,_that.inspectionAmount,_that.inspectionFromAgency,_that.inspectionFromAgencyDate,_that.inspectionFromAgencyNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.approveBoards,_that.approveBoardsDate,_that.approveBoardsNotes,_that.giveCopyToOwner,_that.giveCopyToOwnerDate,_that.giveCopyToOwnerNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'draw_boards')  bool drawBoards, @JsonKey(name: 'draw_boards_date')  DateTime? drawBoardsDate, @JsonKey(name: 'draw_boards_notes')  String? drawBoardsNotes, @JsonKey(name: 'field_inspection')  bool fieldInspection, @JsonKey(name: 'field_inspection_date')  DateTime? fieldInspectionDate, @JsonKey(name: 'field_inspection_notes')  String? fieldInspectionNotes, @JsonKey(name: 'draw_modifications')  bool drawModifications, @JsonKey(name: 'draw_modifications_date')  DateTime? drawModificationsDate, @JsonKey(name: 'draw_modifications_notes')  String? drawModificationsNotes, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'request_number')  String? requestNumber, @JsonKey(name: 'request_number_notes')  String? requestNumberNotes, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @DoubleConverter()@JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_from_agency')  bool inspectionFromAgency, @JsonKey(name: 'inspection_from_agency_date')  DateTime? inspectionFromAgencyDate, @JsonKey(name: 'inspection_from_agency_notes')  String? inspectionFromAgencyNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'approve_boards')  bool approveBoards, @JsonKey(name: 'approve_boards_date')  DateTime? approveBoardsDate, @JsonKey(name: 'approve_boards_notes')  String? approveBoardsNotes, @JsonKey(name: 'give_copy_to_owner')  bool giveCopyToOwner, @JsonKey(name: 'give_copy_to_owner_date')  DateTime? giveCopyToOwnerDate, @JsonKey(name: 'give_copy_to_owner_notes')  String? giveCopyToOwnerNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ArchitecturalModification():
return $default(_that.id,_that.customerId,_that.drawBoards,_that.drawBoardsDate,_that.drawBoardsNotes,_that.fieldInspection,_that.fieldInspectionDate,_that.fieldInspectionNotes,_that.drawModifications,_that.drawModificationsDate,_that.drawModificationsNotes,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.requestNumber,_that.requestNumberNotes,_that.inspectionDate,_that.inspectionNotes,_that.inspectionAmount,_that.inspectionFromAgency,_that.inspectionFromAgencyDate,_that.inspectionFromAgencyNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.approveBoards,_that.approveBoardsDate,_that.approveBoardsNotes,_that.giveCopyToOwner,_that.giveCopyToOwnerDate,_that.giveCopyToOwnerNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'draw_boards')  bool drawBoards, @JsonKey(name: 'draw_boards_date')  DateTime? drawBoardsDate, @JsonKey(name: 'draw_boards_notes')  String? drawBoardsNotes, @JsonKey(name: 'field_inspection')  bool fieldInspection, @JsonKey(name: 'field_inspection_date')  DateTime? fieldInspectionDate, @JsonKey(name: 'field_inspection_notes')  String? fieldInspectionNotes, @JsonKey(name: 'draw_modifications')  bool drawModifications, @JsonKey(name: 'draw_modifications_date')  DateTime? drawModificationsDate, @JsonKey(name: 'draw_modifications_notes')  String? drawModificationsNotes, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'request_number')  String? requestNumber, @JsonKey(name: 'request_number_notes')  String? requestNumberNotes, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @DoubleConverter()@JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_from_agency')  bool inspectionFromAgency, @JsonKey(name: 'inspection_from_agency_date')  DateTime? inspectionFromAgencyDate, @JsonKey(name: 'inspection_from_agency_notes')  String? inspectionFromAgencyNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'approve_boards')  bool approveBoards, @JsonKey(name: 'approve_boards_date')  DateTime? approveBoardsDate, @JsonKey(name: 'approve_boards_notes')  String? approveBoardsNotes, @JsonKey(name: 'give_copy_to_owner')  bool giveCopyToOwner, @JsonKey(name: 'give_copy_to_owner_date')  DateTime? giveCopyToOwnerDate, @JsonKey(name: 'give_copy_to_owner_notes')  String? giveCopyToOwnerNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ArchitecturalModification() when $default != null:
return $default(_that.id,_that.customerId,_that.drawBoards,_that.drawBoardsDate,_that.drawBoardsNotes,_that.fieldInspection,_that.fieldInspectionDate,_that.fieldInspectionNotes,_that.drawModifications,_that.drawModificationsDate,_that.drawModificationsNotes,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.requestNumber,_that.requestNumberNotes,_that.inspectionDate,_that.inspectionNotes,_that.inspectionAmount,_that.inspectionFromAgency,_that.inspectionFromAgencyDate,_that.inspectionFromAgencyNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.approveBoards,_that.approveBoardsDate,_that.approveBoardsNotes,_that.giveCopyToOwner,_that.giveCopyToOwnerDate,_that.giveCopyToOwnerNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArchitecturalModification extends ArchitecturalModification {
  const _ArchitecturalModification({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'draw_boards') this.drawBoards = false, @JsonKey(name: 'draw_boards_date') this.drawBoardsDate, @JsonKey(name: 'draw_boards_notes') this.drawBoardsNotes, @JsonKey(name: 'field_inspection') this.fieldInspection = false, @JsonKey(name: 'field_inspection_date') this.fieldInspectionDate, @JsonKey(name: 'field_inspection_notes') this.fieldInspectionNotes, @JsonKey(name: 'draw_modifications') this.drawModifications = false, @JsonKey(name: 'draw_modifications_date') this.drawModificationsDate, @JsonKey(name: 'draw_modifications_notes') this.drawModificationsNotes, @JsonKey(name: 'submit_request') this.submitRequest = false, @JsonKey(name: 'submit_request_date') this.submitRequestDate, @JsonKey(name: 'submit_request_notes') this.submitRequestNotes, @JsonKey(name: 'request_number') this.requestNumber, @JsonKey(name: 'request_number_notes') this.requestNumberNotes, @JsonKey(name: 'inspection_date') this.inspectionDate, @JsonKey(name: 'inspection_notes') this.inspectionNotes, @DoubleConverter()@JsonKey(name: 'inspection_amount') this.inspectionAmount, @JsonKey(name: 'inspection_from_agency') this.inspectionFromAgency = false, @JsonKey(name: 'inspection_from_agency_date') this.inspectionFromAgencyDate, @JsonKey(name: 'inspection_from_agency_notes') this.inspectionFromAgencyNotes, @JsonKey(name: 'review_with_agency') this.reviewWithAgency = false, @JsonKey(name: 'review_with_agency_date') this.reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes') this.reviewWithAgencyNotes, @JsonKey(name: 'approve_boards') this.approveBoards = false, @JsonKey(name: 'approve_boards_date') this.approveBoardsDate, @JsonKey(name: 'approve_boards_notes') this.approveBoardsNotes, @JsonKey(name: 'give_copy_to_owner') this.giveCopyToOwner = false, @JsonKey(name: 'give_copy_to_owner_date') this.giveCopyToOwnerDate, @JsonKey(name: 'give_copy_to_owner_notes') this.giveCopyToOwnerNotes, @JsonKey(name: 'stage_notes') this.stageNotes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _ArchitecturalModification.fromJson(Map<String, dynamic> json) => _$ArchitecturalModificationFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
// Step 1: رسم اللوحات
@override@JsonKey(name: 'draw_boards') final  bool drawBoards;
@override@JsonKey(name: 'draw_boards_date') final  DateTime? drawBoardsDate;
@override@JsonKey(name: 'draw_boards_notes') final  String? drawBoardsNotes;
// Step 2: المعاينة علي الطبيعة
@override@JsonKey(name: 'field_inspection') final  bool fieldInspection;
@override@JsonKey(name: 'field_inspection_date') final  DateTime? fieldInspectionDate;
@override@JsonKey(name: 'field_inspection_notes') final  String? fieldInspectionNotes;
// Step 3: رسم التعديلات المعمارية
@override@JsonKey(name: 'draw_modifications') final  bool drawModifications;
@override@JsonKey(name: 'draw_modifications_date') final  DateTime? drawModificationsDate;
@override@JsonKey(name: 'draw_modifications_notes') final  String? drawModificationsNotes;
// Step 4: تقديم الطلب
@override@JsonKey(name: 'submit_request') final  bool submitRequest;
@override@JsonKey(name: 'submit_request_date') final  DateTime? submitRequestDate;
@override@JsonKey(name: 'submit_request_notes') final  String? submitRequestNotes;
// Step 5: رقم الطلب
@override@JsonKey(name: 'request_number') final  String? requestNumber;
@override@JsonKey(name: 'request_number_notes') final  String? requestNumberNotes;
// Step 6: ميعاد المعاينة من الجهاز (has money field)
@override@JsonKey(name: 'inspection_date') final  DateTime? inspectionDate;
@override@JsonKey(name: 'inspection_notes') final  String? inspectionNotes;
@override@DoubleConverter()@JsonKey(name: 'inspection_amount') final  double? inspectionAmount;
// Step 7: المعاينة من الجهاز
@override@JsonKey(name: 'inspection_from_agency') final  bool inspectionFromAgency;
@override@JsonKey(name: 'inspection_from_agency_date') final  DateTime? inspectionFromAgencyDate;
@override@JsonKey(name: 'inspection_from_agency_notes') final  String? inspectionFromAgencyNotes;
// Step 8: مراجعة مع الجهاز
@override@JsonKey(name: 'review_with_agency') final  bool reviewWithAgency;
@override@JsonKey(name: 'review_with_agency_date') final  DateTime? reviewWithAgencyDate;
@override@JsonKey(name: 'review_with_agency_notes') final  String? reviewWithAgencyNotes;
// Step 9: اعتماد اللوحات
@override@JsonKey(name: 'approve_boards') final  bool approveBoards;
@override@JsonKey(name: 'approve_boards_date') final  DateTime? approveBoardsDate;
@override@JsonKey(name: 'approve_boards_notes') final  String? approveBoardsNotes;
// Step 10: إعطاء النسخة للمالك
@override@JsonKey(name: 'give_copy_to_owner') final  bool giveCopyToOwner;
@override@JsonKey(name: 'give_copy_to_owner_date') final  DateTime? giveCopyToOwnerDate;
@override@JsonKey(name: 'give_copy_to_owner_notes') final  String? giveCopyToOwnerNotes;
// General stage notes
@override@JsonKey(name: 'stage_notes') final  String? stageNotes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ArchitecturalModification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchitecturalModificationCopyWith<_ArchitecturalModification> get copyWith => __$ArchitecturalModificationCopyWithImpl<_ArchitecturalModification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArchitecturalModificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchitecturalModification&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.drawBoards, drawBoards) || other.drawBoards == drawBoards)&&(identical(other.drawBoardsDate, drawBoardsDate) || other.drawBoardsDate == drawBoardsDate)&&(identical(other.drawBoardsNotes, drawBoardsNotes) || other.drawBoardsNotes == drawBoardsNotes)&&(identical(other.fieldInspection, fieldInspection) || other.fieldInspection == fieldInspection)&&(identical(other.fieldInspectionDate, fieldInspectionDate) || other.fieldInspectionDate == fieldInspectionDate)&&(identical(other.fieldInspectionNotes, fieldInspectionNotes) || other.fieldInspectionNotes == fieldInspectionNotes)&&(identical(other.drawModifications, drawModifications) || other.drawModifications == drawModifications)&&(identical(other.drawModificationsDate, drawModificationsDate) || other.drawModificationsDate == drawModificationsDate)&&(identical(other.drawModificationsNotes, drawModificationsNotes) || other.drawModificationsNotes == drawModificationsNotes)&&(identical(other.submitRequest, submitRequest) || other.submitRequest == submitRequest)&&(identical(other.submitRequestDate, submitRequestDate) || other.submitRequestDate == submitRequestDate)&&(identical(other.submitRequestNotes, submitRequestNotes) || other.submitRequestNotes == submitRequestNotes)&&(identical(other.requestNumber, requestNumber) || other.requestNumber == requestNumber)&&(identical(other.requestNumberNotes, requestNumberNotes) || other.requestNumberNotes == requestNumberNotes)&&(identical(other.inspectionDate, inspectionDate) || other.inspectionDate == inspectionDate)&&(identical(other.inspectionNotes, inspectionNotes) || other.inspectionNotes == inspectionNotes)&&(identical(other.inspectionAmount, inspectionAmount) || other.inspectionAmount == inspectionAmount)&&(identical(other.inspectionFromAgency, inspectionFromAgency) || other.inspectionFromAgency == inspectionFromAgency)&&(identical(other.inspectionFromAgencyDate, inspectionFromAgencyDate) || other.inspectionFromAgencyDate == inspectionFromAgencyDate)&&(identical(other.inspectionFromAgencyNotes, inspectionFromAgencyNotes) || other.inspectionFromAgencyNotes == inspectionFromAgencyNotes)&&(identical(other.reviewWithAgency, reviewWithAgency) || other.reviewWithAgency == reviewWithAgency)&&(identical(other.reviewWithAgencyDate, reviewWithAgencyDate) || other.reviewWithAgencyDate == reviewWithAgencyDate)&&(identical(other.reviewWithAgencyNotes, reviewWithAgencyNotes) || other.reviewWithAgencyNotes == reviewWithAgencyNotes)&&(identical(other.approveBoards, approveBoards) || other.approveBoards == approveBoards)&&(identical(other.approveBoardsDate, approveBoardsDate) || other.approveBoardsDate == approveBoardsDate)&&(identical(other.approveBoardsNotes, approveBoardsNotes) || other.approveBoardsNotes == approveBoardsNotes)&&(identical(other.giveCopyToOwner, giveCopyToOwner) || other.giveCopyToOwner == giveCopyToOwner)&&(identical(other.giveCopyToOwnerDate, giveCopyToOwnerDate) || other.giveCopyToOwnerDate == giveCopyToOwnerDate)&&(identical(other.giveCopyToOwnerNotes, giveCopyToOwnerNotes) || other.giveCopyToOwnerNotes == giveCopyToOwnerNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,drawBoards,drawBoardsDate,drawBoardsNotes,fieldInspection,fieldInspectionDate,fieldInspectionNotes,drawModifications,drawModificationsDate,drawModificationsNotes,submitRequest,submitRequestDate,submitRequestNotes,requestNumber,requestNumberNotes,inspectionDate,inspectionNotes,inspectionAmount,inspectionFromAgency,inspectionFromAgencyDate,inspectionFromAgencyNotes,reviewWithAgency,reviewWithAgencyDate,reviewWithAgencyNotes,approveBoards,approveBoardsDate,approveBoardsNotes,giveCopyToOwner,giveCopyToOwnerDate,giveCopyToOwnerNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'ArchitecturalModification(id: $id, customerId: $customerId, drawBoards: $drawBoards, drawBoardsDate: $drawBoardsDate, drawBoardsNotes: $drawBoardsNotes, fieldInspection: $fieldInspection, fieldInspectionDate: $fieldInspectionDate, fieldInspectionNotes: $fieldInspectionNotes, drawModifications: $drawModifications, drawModificationsDate: $drawModificationsDate, drawModificationsNotes: $drawModificationsNotes, submitRequest: $submitRequest, submitRequestDate: $submitRequestDate, submitRequestNotes: $submitRequestNotes, requestNumber: $requestNumber, requestNumberNotes: $requestNumberNotes, inspectionDate: $inspectionDate, inspectionNotes: $inspectionNotes, inspectionAmount: $inspectionAmount, inspectionFromAgency: $inspectionFromAgency, inspectionFromAgencyDate: $inspectionFromAgencyDate, inspectionFromAgencyNotes: $inspectionFromAgencyNotes, reviewWithAgency: $reviewWithAgency, reviewWithAgencyDate: $reviewWithAgencyDate, reviewWithAgencyNotes: $reviewWithAgencyNotes, approveBoards: $approveBoards, approveBoardsDate: $approveBoardsDate, approveBoardsNotes: $approveBoardsNotes, giveCopyToOwner: $giveCopyToOwner, giveCopyToOwnerDate: $giveCopyToOwnerDate, giveCopyToOwnerNotes: $giveCopyToOwnerNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ArchitecturalModificationCopyWith<$Res> implements $ArchitecturalModificationCopyWith<$Res> {
  factory _$ArchitecturalModificationCopyWith(_ArchitecturalModification value, $Res Function(_ArchitecturalModification) _then) = __$ArchitecturalModificationCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'draw_boards') bool drawBoards,@JsonKey(name: 'draw_boards_date') DateTime? drawBoardsDate,@JsonKey(name: 'draw_boards_notes') String? drawBoardsNotes,@JsonKey(name: 'field_inspection') bool fieldInspection,@JsonKey(name: 'field_inspection_date') DateTime? fieldInspectionDate,@JsonKey(name: 'field_inspection_notes') String? fieldInspectionNotes,@JsonKey(name: 'draw_modifications') bool drawModifications,@JsonKey(name: 'draw_modifications_date') DateTime? drawModificationsDate,@JsonKey(name: 'draw_modifications_notes') String? drawModificationsNotes,@JsonKey(name: 'submit_request') bool submitRequest,@JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,@JsonKey(name: 'submit_request_notes') String? submitRequestNotes,@JsonKey(name: 'request_number') String? requestNumber,@JsonKey(name: 'request_number_notes') String? requestNumberNotes,@JsonKey(name: 'inspection_date') DateTime? inspectionDate,@JsonKey(name: 'inspection_notes') String? inspectionNotes,@DoubleConverter()@JsonKey(name: 'inspection_amount') double? inspectionAmount,@JsonKey(name: 'inspection_from_agency') bool inspectionFromAgency,@JsonKey(name: 'inspection_from_agency_date') DateTime? inspectionFromAgencyDate,@JsonKey(name: 'inspection_from_agency_notes') String? inspectionFromAgencyNotes,@JsonKey(name: 'review_with_agency') bool reviewWithAgency,@JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,@JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,@JsonKey(name: 'approve_boards') bool approveBoards,@JsonKey(name: 'approve_boards_date') DateTime? approveBoardsDate,@JsonKey(name: 'approve_boards_notes') String? approveBoardsNotes,@JsonKey(name: 'give_copy_to_owner') bool giveCopyToOwner,@JsonKey(name: 'give_copy_to_owner_date') DateTime? giveCopyToOwnerDate,@JsonKey(name: 'give_copy_to_owner_notes') String? giveCopyToOwnerNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ArchitecturalModificationCopyWithImpl<$Res>
    implements _$ArchitecturalModificationCopyWith<$Res> {
  __$ArchitecturalModificationCopyWithImpl(this._self, this._then);

  final _ArchitecturalModification _self;
  final $Res Function(_ArchitecturalModification) _then;

/// Create a copy of ArchitecturalModification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? drawBoards = null,Object? drawBoardsDate = freezed,Object? drawBoardsNotes = freezed,Object? fieldInspection = null,Object? fieldInspectionDate = freezed,Object? fieldInspectionNotes = freezed,Object? drawModifications = null,Object? drawModificationsDate = freezed,Object? drawModificationsNotes = freezed,Object? submitRequest = null,Object? submitRequestDate = freezed,Object? submitRequestNotes = freezed,Object? requestNumber = freezed,Object? requestNumberNotes = freezed,Object? inspectionDate = freezed,Object? inspectionNotes = freezed,Object? inspectionAmount = freezed,Object? inspectionFromAgency = null,Object? inspectionFromAgencyDate = freezed,Object? inspectionFromAgencyNotes = freezed,Object? reviewWithAgency = null,Object? reviewWithAgencyDate = freezed,Object? reviewWithAgencyNotes = freezed,Object? approveBoards = null,Object? approveBoardsDate = freezed,Object? approveBoardsNotes = freezed,Object? giveCopyToOwner = null,Object? giveCopyToOwnerDate = freezed,Object? giveCopyToOwnerNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ArchitecturalModification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,drawBoards: null == drawBoards ? _self.drawBoards : drawBoards // ignore: cast_nullable_to_non_nullable
as bool,drawBoardsDate: freezed == drawBoardsDate ? _self.drawBoardsDate : drawBoardsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,drawBoardsNotes: freezed == drawBoardsNotes ? _self.drawBoardsNotes : drawBoardsNotes // ignore: cast_nullable_to_non_nullable
as String?,fieldInspection: null == fieldInspection ? _self.fieldInspection : fieldInspection // ignore: cast_nullable_to_non_nullable
as bool,fieldInspectionDate: freezed == fieldInspectionDate ? _self.fieldInspectionDate : fieldInspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,fieldInspectionNotes: freezed == fieldInspectionNotes ? _self.fieldInspectionNotes : fieldInspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,drawModifications: null == drawModifications ? _self.drawModifications : drawModifications // ignore: cast_nullable_to_non_nullable
as bool,drawModificationsDate: freezed == drawModificationsDate ? _self.drawModificationsDate : drawModificationsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,drawModificationsNotes: freezed == drawModificationsNotes ? _self.drawModificationsNotes : drawModificationsNotes // ignore: cast_nullable_to_non_nullable
as String?,submitRequest: null == submitRequest ? _self.submitRequest : submitRequest // ignore: cast_nullable_to_non_nullable
as bool,submitRequestDate: freezed == submitRequestDate ? _self.submitRequestDate : submitRequestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitRequestNotes: freezed == submitRequestNotes ? _self.submitRequestNotes : submitRequestNotes // ignore: cast_nullable_to_non_nullable
as String?,requestNumber: freezed == requestNumber ? _self.requestNumber : requestNumber // ignore: cast_nullable_to_non_nullable
as String?,requestNumberNotes: freezed == requestNumberNotes ? _self.requestNumberNotes : requestNumberNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionDate: freezed == inspectionDate ? _self.inspectionDate : inspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionNotes: freezed == inspectionNotes ? _self.inspectionNotes : inspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionAmount: freezed == inspectionAmount ? _self.inspectionAmount : inspectionAmount // ignore: cast_nullable_to_non_nullable
as double?,inspectionFromAgency: null == inspectionFromAgency ? _self.inspectionFromAgency : inspectionFromAgency // ignore: cast_nullable_to_non_nullable
as bool,inspectionFromAgencyDate: freezed == inspectionFromAgencyDate ? _self.inspectionFromAgencyDate : inspectionFromAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionFromAgencyNotes: freezed == inspectionFromAgencyNotes ? _self.inspectionFromAgencyNotes : inspectionFromAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,reviewWithAgency: null == reviewWithAgency ? _self.reviewWithAgency : reviewWithAgency // ignore: cast_nullable_to_non_nullable
as bool,reviewWithAgencyDate: freezed == reviewWithAgencyDate ? _self.reviewWithAgencyDate : reviewWithAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewWithAgencyNotes: freezed == reviewWithAgencyNotes ? _self.reviewWithAgencyNotes : reviewWithAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,approveBoards: null == approveBoards ? _self.approveBoards : approveBoards // ignore: cast_nullable_to_non_nullable
as bool,approveBoardsDate: freezed == approveBoardsDate ? _self.approveBoardsDate : approveBoardsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approveBoardsNotes: freezed == approveBoardsNotes ? _self.approveBoardsNotes : approveBoardsNotes // ignore: cast_nullable_to_non_nullable
as String?,giveCopyToOwner: null == giveCopyToOwner ? _self.giveCopyToOwner : giveCopyToOwner // ignore: cast_nullable_to_non_nullable
as bool,giveCopyToOwnerDate: freezed == giveCopyToOwnerDate ? _self.giveCopyToOwnerDate : giveCopyToOwnerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,giveCopyToOwnerNotes: freezed == giveCopyToOwnerNotes ? _self.giveCopyToOwnerNotes : giveCopyToOwnerNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
