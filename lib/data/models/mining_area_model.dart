import 'package:freezed_annotation/freezed_annotation.dart';

part 'mining_area_model.freezed.dart';
part 'mining_area_model.g.dart';

@freezed
sealed class MiningAreaModel with _$MiningAreaModel {
  const factory MiningAreaModel({
    int? id,
    String? name,
    String? description,
    List<SubMiningAreaModel>? subAreas,
    String? icon,
  }) = _MiningAreaModel;

  factory MiningAreaModel.fromJson(Map<String, dynamic> json) =>
      _$MiningAreaModelFromJson(json);
}

@freezed
sealed class SubMiningAreaModel with _$SubMiningAreaModel {
  const factory SubMiningAreaModel({
    int? id,
    String? name,
    String? description,
    int? miningAreaId,
    List<ProjectModel>? projects,
  }) = _SubMiningAreaModel;

  factory SubMiningAreaModel.fromJson(Map<String, dynamic> json) =>
      _$SubMiningAreaModelFromJson(json);
}

@freezed
sealed class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    int? id,
    String? name,
    String? description,
    int? subMiningAreaId,
    List<ProjectItemModel>? items,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

@freezed
sealed class ProjectItemModel with _$ProjectItemModel {
  const factory ProjectItemModel({
    int? id,
    String? name,
    String? type,
    int? projectId,
  }) = _ProjectItemModel;

  factory ProjectItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemModelFromJson(json);
}
