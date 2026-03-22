class ListGeologicalReportFilter {
  String? mineralId;
  String? reportName;
  String? areaId;
  String? reportingUnit;
  String? approvalUnit;
  String? calculationTime;

  ListGeologicalReportFilter({
    this.mineralId,
    this.reportName,
    this.areaId,
    this.reportingUnit,
    this.approvalUnit,
    this.calculationTime,
  });

  ListGeologicalReportFilter copyWith({
    String? mineralId,
    String? reportName,
    String? areaId,
    String? reportingUnit,
    String? approvalUnit,
    String? calculationTime,
  }) =>
      ListGeologicalReportFilter(
        mineralId: mineralId ?? this.mineralId,
        reportName: reportName ?? this.reportName,
        areaId: areaId ?? this.areaId,
        reportingUnit: reportingUnit ?? this.reportingUnit,
        approvalUnit: approvalUnit ?? this.approvalUnit,
        calculationTime: calculationTime ?? this.calculationTime,
      );

  factory ListGeologicalReportFilter.fromJson(Map<String, dynamic> json) => ListGeologicalReportFilter(
    mineralId: json["mineralId"],
    reportName: json["reportName"],
    areaId: json["areaId"],
    reportingUnit: json["reportingUnit"],
    approvalUnit: json["approvalUnit"],
    calculationTime: json["calculationTime"],
  );

  Map<String, dynamic> toJson() => {
    "mineralId": mineralId,
    "reportName": reportName,
    "areaId": areaId,
    "reportingUnit": reportingUnit,
    "approvalUnit": approvalUnit,
    "calculationTime": calculationTime,
  };
}
