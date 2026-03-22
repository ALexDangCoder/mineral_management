class GeologicalReportModel {
  int? objectId;
  String? reportId;
  String? reportName;
  String? approvalUnit;
  int? reviewStatus;
  String? reportingUnit;
  int? status;
  DateTime? calculationTime;

  GeologicalReportModel({
    this.objectId,
    this.reportId,
    this.reportName,
    this.approvalUnit,
    this.reviewStatus,
    this.reportingUnit,
    this.status,
    this.calculationTime,
  });

  GeologicalReportModel copyWith({
    int? objectId,
    String? reportId,
    String? reportName,
    String? approvalUnit,
    int? reviewStatus,
    String? reportingUnit,
    int? status,
    DateTime? calculationTime,
  }) =>
      GeologicalReportModel(
        objectId: objectId ?? this.objectId,
        reportId: reportId ?? this.reportId,
        reportName: reportName ?? this.reportName,
        approvalUnit: approvalUnit ?? this.approvalUnit,
        reviewStatus: reviewStatus ?? this.reviewStatus,
        reportingUnit: reportingUnit ?? this.reportingUnit,
        status: status ?? this.status,
        calculationTime: calculationTime ?? this.calculationTime,
      );

  factory GeologicalReportModel.fromJson(Map<String, dynamic> json) => GeologicalReportModel(
    objectId: json["objectId"],
    reportId: json["reportId"],
    reportName: json["reportName"],
    approvalUnit: json["approvalUnit"],
    reviewStatus: json["reviewStatus"],
    reportingUnit: json["reportingUnit"],
    status: json["status"],
    calculationTime: json["calculationTime"] == null ? null : DateTime.parse(json["calculationTime"]),
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "reportId": reportId,
    "reportName": reportName,
    "approvalUnit": approvalUnit,
    "reviewStatus": reviewStatus,
    "reportingUnit": reportingUnit,
    "status": status,
    "calculationTime": calculationTime?.toIso8601String(),
  };
}