import 'package:bnv_opendata/data/models/geological_report_model.dart';

class ListGeologicalReportsResponse {
  int? pageSize;
  int? pageNow;
  int? pageTotal;
  int? recordTotal;
  List<GeologicalReportModel>? items;

  ListGeologicalReportsResponse({
    this.pageSize,
    this.pageNow,
    this.pageTotal,
    this.recordTotal,
    this.items,
  });

  ListGeologicalReportsResponse copyWith({
    int? pageSize,
    int? pageNow,
    int? pageTotal,
    int? recordTotal,
    List<GeologicalReportModel>? items,
  }) =>
      ListGeologicalReportsResponse(
        pageSize: pageSize ?? this.pageSize,
        pageNow: pageNow ?? this.pageNow,
        pageTotal: pageTotal ?? this.pageTotal,
        recordTotal: recordTotal ?? this.recordTotal,
        items: items ?? this.items,
      );

  factory ListGeologicalReportsResponse.fromJson(Map<String, dynamic> json) =>
      ListGeologicalReportsResponse(
        pageSize: json["pageSize"],
        pageNow: json["pageNow"],
        pageTotal: json["pageTotal"],
        recordTotal: json["recordTotal"],
        items: json["items"] == null
            ? []
            : List<GeologicalReportModel>.from(
                json["items"]!.map((x) => GeologicalReportModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "pageNow": pageNow,
        "pageTotal": pageTotal,
        "recordTotal": recordTotal,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
