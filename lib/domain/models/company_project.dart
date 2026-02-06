import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_project.freezed.dart';
part 'company_project.g.dart';

@freezed
abstract class CompanyProject with _$CompanyProject {
  const factory CompanyProject({
    required int id,
    @JsonKey(name: 'project_name') required String projectName,
    @JsonKey(name: 'current_status') String? currentStatus,
    String? notes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _CompanyProject;

  factory CompanyProject.fromJson(Map<String, dynamic> json) =>
      _$CompanyProjectFromJson(json);
}
