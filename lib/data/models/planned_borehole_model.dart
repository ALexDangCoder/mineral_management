import 'package:freezed_annotation/freezed_annotation.dart';

part 'planned_borehole_model.freezed.dart';
part 'planned_borehole_model.g.dart';

@freezed
sealed class PlannedBoreholeModel with _$PlannedBoreholeModel {
  const factory PlannedBoreholeModel({
    int? objectId,
    String? boreholeId,
    String? boreholeName,
    String? routeName,
    String? studyMission,
    double? constructedDepth,
    int? completedStatus,
    int? plannedDepth,
    String? seamName,
    int? notStartedStatus,
    int? inProgressStatus,
  }) = _PlannedBoreholeModel;

  factory PlannedBoreholeModel.fromJson(Map<String, dynamic> json) =>
      _$PlannedBoreholeModelFromJson(json);
}
