import 'package:freezed_annotation/freezed_annotation.dart';

part 'utility_meter.freezed.dart';
part 'utility_meter.g.dart';

@freezed
abstract class UtilityMeter with _$UtilityMeter {
  const factory UtilityMeter({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    // Step 1: استلام الأوراق
    @Default(false) @JsonKey(name: 'receive_documents') bool receiveDocuments,
    @JsonKey(name: 'receive_documents_date') DateTime? receiveDocumentsDate,
    @JsonKey(name: 'receive_documents_notes') String? receiveDocumentsNotes,

    // Step 2: التوكيل
    @Default(false) bool authorization_var,
    @JsonKey(name: 'authorization_var_date') DateTime? authorizationDate,
    @JsonKey(name: 'authorization_var_notes') String? authorizationNotes,

    // Step 3: التقديم علي العداد
    @Default(false) @JsonKey(name: 'apply_for_meter') bool applyForMeter,
    @JsonKey(name: 'apply_for_meter_date') DateTime? applyForMeterDate,
    @JsonKey(name: 'apply_for_meter_notes') String? applyForMeterNotes,

    // Step 4: تحديد ميعاد المعاينة (has money field)
    @JsonKey(name: 'inspection_date') DateTime? inspectionDate,
    @JsonKey(name: 'inspection_amount') double? inspectionAmount,
    @JsonKey(name: 'inspection_notes') String? inspectionNotes,

    // Step 5: طباعة الجوابات (NEW)
    @Default(false) @JsonKey(name: 'print_letters') bool printLetters,
    @JsonKey(name: 'print_letters_date') DateTime? printLettersDate,
    @JsonKey(name: 'print_letters_notes') String? printLettersNotes,

    // Step 6: التوريد علي العداد (4 money fields)
    @Default(false) @JsonKey(name: 'supply_to_meter') bool supplyToMeter,
    @JsonKey(name: 'supply_to_meter_date') DateTime? supplyToMeterDate,
    @JsonKey(name: 'supply_to_meter_notes') String? supplyToMeterNotes,
    @JsonKey(name: 'supply_amount_1') double? supplyAmount1,
    @JsonKey(name: 'supply_amount_2') double? supplyAmount2,
    @JsonKey(name: 'supply_amount_3') double? supplyAmount3,
    @JsonKey(name: 'supply_amount_4') double? supplyAmount4,

    // Step 7: التعاقد علي العداد
    @Default(false) @JsonKey(name: 'contract_meter') bool contractMeter,
    @JsonKey(name: 'contract_meter_date') DateTime? contractMeterDate,
    @JsonKey(name: 'contract_meter_notes') String? contractMeterNotes,

    // Step 8: استلام العداد
    @Default(false) @JsonKey(name: 'receive_meter') bool receiveMeter,
    @JsonKey(name: 'receive_meter_date') DateTime? receiveMeterDate,
    @JsonKey(name: 'receive_meter_notes') String? receiveMeterNotes,

    // General stage notes
    @JsonKey(name: 'stage_notes') String? stageNotes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UtilityMeter;

  const UtilityMeter._();

  factory UtilityMeter.fromJson(Map<String, dynamic> json) =>
      _$UtilityMeterFromJson(json);

  static const int totalSteps = 8;

  int get completedSteps {
    int count = 0;
    if (receiveDocuments) count++;
    if (authorization_var) count++;
    if (applyForMeter) count++;
    if (inspectionDate != null) count++;
    if (printLetters) count++;
    if (supplyToMeter) count++;
    if (contractMeter) count++;
    if (receiveMeter) count++;
    return count;
  }

  double get progress => (completedSteps / totalSteps) * 100;
  bool get isComplete => completedSteps == totalSteps;

  double get totalSupplyAmount =>
      (supplyAmount1 ?? 0) +
      (supplyAmount2 ?? 0) +
      (supplyAmount3 ?? 0) +
      (supplyAmount4 ?? 0);

  double get totalAmount => (inspectionAmount ?? 0) + totalSupplyAmount;
}
