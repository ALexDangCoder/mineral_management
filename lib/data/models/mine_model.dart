import 'package:bnv_opendata/utils/constants/enums/mine_status_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mine_model.freezed.dart';
part 'mine_model.g.dart';

@freezed
sealed class MineModel with _$MineModel {
  const factory MineModel({
    int? id,
    String? mineName,
    MineStatusEnum? status,
    String? mineralType,
  }) = _MineModel;

  factory MineModel.fromJson(Map<String, dynamic> json) =>
      _$MineModelFromJson(json);
}
