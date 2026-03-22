import 'package:bnv_opendata/data/models/model_exports.dart';

class ListProposalPlanResponse {
  int? pageSize;
  int? pageNow;
  int? pageTotal;
  int? recordTotal;
  List<ProposalPlanModel>? items;

  ListProposalPlanResponse({
    this.pageSize,
    this.pageNow,
    this.pageTotal,
    this.recordTotal,
    this.items,
  });

  ListProposalPlanResponse copyWith({
    int? pageSize,
    int? pageNow,
    int? pageTotal,
    int? recordTotal,
    List<ProposalPlanModel>? items,
  }) =>
      ListProposalPlanResponse(
        pageSize: pageSize ?? this.pageSize,
        pageNow: pageNow ?? this.pageNow,
        pageTotal: pageTotal ?? this.pageTotal,
        recordTotal: recordTotal ?? this.recordTotal,
        items: items ?? this.items,
      );

  factory ListProposalPlanResponse.fromJson(Map<String, dynamic> json) =>
      ListProposalPlanResponse(
        pageSize: json["pageSize"],
        pageNow: json["pageNow"],
        pageTotal: json["pageTotal"],
        recordTotal: json["recordTotal"],
        items: json["items"] == null
            ? []
            : List<ProposalPlanModel>.from(
                json["items"]!.map((x) => ProposalPlanModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "pageNow": pageNow,
        "pageTotal": pageTotal,
        "recordTotal": recordTotal,
        "items": items == null
            ? []
            : List<ProposalPlanModel>.from(items!.map((x) => x.toJson())),
      };
}
