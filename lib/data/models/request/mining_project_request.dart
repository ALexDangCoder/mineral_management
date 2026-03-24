import 'package:freezed_annotation/freezed_annotation.dart';

part 'mining_project_request.freezed.dart';
part 'mining_project_request.g.dart';

@freezed
sealed class MiningProjectRequest with _$MiningProjectRequest {
  const factory MiningProjectRequest({
    int? pageSize,
    int? pageNow,
    MiningProjectFilter? filter,
    String? exportType,
  }) = _MiningProjectRequest;

  factory MiningProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$MiningProjectRequestFromJson(json);
}

@freezed
sealed class MiningProjectFilter with _$MiningProjectFilter {
  const factory MiningProjectFilter({
    String? areaId,
    String? miningName,
    String? mineralId,
    int? status,
  }) = _MiningProjectFilter;

  factory MiningProjectFilter.fromJson(Map<String, dynamic> json) =>
      _$MiningProjectFilterFromJson(json);
}
