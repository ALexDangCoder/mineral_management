import 'package:freezed_annotation/freezed_annotation.dart';

part 'mining_project_model.freezed.dart';
part 'mining_project_model.g.dart';

@freezed
sealed class MiningProjectModel with _$MiningProjectModel {
  const factory MiningProjectModel({
    int? objectId,
    String? miningId,
    String? miningName,
    String? areaId,
    String? mineralId,
    String? mineralName,
    String? permitId,
    double? designedCapacity,
    String? expectedStartDate,
    String? expectedEndDate,
    String? actualStartDate,
    double? expectedReserve,
    double? totalInvestment,
    int? status,
    double? completionRate,
  }) = _MiningProjectModel;

  factory MiningProjectModel.fromJson(Map<String, dynamic> json) =>
      _$MiningProjectModelFromJson(json);
}
