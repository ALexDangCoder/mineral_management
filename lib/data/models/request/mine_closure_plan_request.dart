import 'package:freezed_annotation/freezed_annotation.dart';

part 'mine_closure_plan_request.freezed.dart';
part 'mine_closure_plan_request.g.dart';

@freezed
sealed class MineClosurePlanRequest with _$MineClosurePlanRequest {
  const factory MineClosurePlanRequest({
    int? pageSize,
    int? pageNow,
    MineClosurePlanFilter? filter,
    String? exportType,
  }) = _MineClosurePlanRequest;

  factory MineClosurePlanRequest.fromJson(Map<String, dynamic> json) =>
      _$MineClosurePlanRequestFromJson(json);
}

@freezed
sealed class MineClosurePlanFilter with _$MineClosurePlanFilter {
  const factory MineClosurePlanFilter({
    String? closurePlanName,
    String? areaId,
    String? mineralId,
    int? status,
  }) = _MineClosurePlanFilter;

  factory MineClosurePlanFilter.fromJson(Map<String, dynamic> json) =>
      _$MineClosurePlanFilterFromJson(json);
}
