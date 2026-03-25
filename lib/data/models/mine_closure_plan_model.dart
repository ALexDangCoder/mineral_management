import 'package:freezed_annotation/freezed_annotation.dart';

part 'mine_closure_plan_model.freezed.dart';
part 'mine_closure_plan_model.g.dart';

@freezed
sealed class MineClosurePlanModel with _$MineClosurePlanModel {
  const factory MineClosurePlanModel({
    int? objectId,
    String? closurePlanId,
    String? closurePlanName,
    String? areaId,
    String? exploitLicenseId,
    String? mineralId,
    String? mineralName,
    int? executionYear,
    DateTime? approvalDateDA,
    DateTime? approvalDateDCM,
    String? approvalUnitDA,
    DateTime? expirationDate,
    int? status,
  }) = _MineClosurePlanModel;

  factory MineClosurePlanModel.fromJson(Map<String, dynamic> json) =>
      _$MineClosurePlanModelFromJson(json);
}
