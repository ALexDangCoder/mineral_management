class ListProposalPlanFilter {
  String? projectName;
  String? areaId;
  String? mineralId;
  String? mineId;
  int? status;

  ListProposalPlanFilter({
    this.projectName,
    this.areaId,
    this.mineralId,
    this.mineId,
    this.status,
  });

  ListProposalPlanFilter copyWith({
    String? projectName,
    String? areaId,
    String? mineralId,
    String? mineId,
    int? status,
  }) =>
      ListProposalPlanFilter(
        projectName: projectName ?? this.projectName,
        areaId: areaId ?? this.areaId,
        mineralId: mineralId ?? this.mineralId,
        mineId: mineId ?? this.mineId,
        status: status ?? this.status,
      );

  factory ListProposalPlanFilter.fromJson(Map<String, dynamic> json) => ListProposalPlanFilter(
    projectName: json["projectName"],
    areaId: json["areaId"],
    mineralId: json["mineralId"],
    mineId: json["mineId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "projectName": projectName,
    "areaId": areaId,
    "mineralId": mineralId,
    "mineId": mineId,
    "status": status,
  };
}