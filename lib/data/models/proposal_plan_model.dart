import 'package:freezed_annotation/freezed_annotation.dart';

part 'proposal_plan_model.freezed.dart';
part 'proposal_plan_model.g.dart';

@freezed
sealed class ProposalPlanModel with _$ProposalPlanModel {
  const factory ProposalPlanModel({
    int? objectId,
    String? projectId,
    String? projectName,
    String? areaName,
    String? mineName,
    DateTime? signDate,
    String? constructionUnitName,
    int? phase,
    int? status,
    String? approvalUnitName,
    int? reviewStatus,
    String? projectInfo,
    String? note,
  }) = _ProposalPlanModel;

  factory ProposalPlanModel.fromJson(Map<String, dynamic> json) =>
      _$ProposalPlanModelFromJson(json);
}
