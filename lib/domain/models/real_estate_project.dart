import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_estate_project.freezed.dart';
part 'real_estate_project.g.dart';

@freezed
abstract class RealEstateProject with _$RealEstateProject {
  const factory RealEstateProject({
    required int id,
    @JsonKey(name: 'project_name') required String projectName,
    @JsonKey(name: 'current_status') String? currentStatus,
    String? notes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _RealEstateProject;

  factory RealEstateProject.fromJson(Map<String, dynamic> json) =>
      _$RealEstateProjectFromJson(json);
}
