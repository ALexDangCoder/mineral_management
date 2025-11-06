import 'package:bnv_opendata/data/models/mine_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drill_hole_model.freezed.dart';
part 'drill_hole_model.g.dart';

@freezed
sealed class DrillHoleModel with _$DrillHoleModel {
  const factory DrillHoleModel({
    int? holeId,
    String? holeName,
    String? description,
    MineModel? mine,
  }) = _DrillHoleModel;

  factory DrillHoleModel.fromJson(Map<String, dynamic> json) =>
      _$DrillHoleModelFromJson(json);
}
