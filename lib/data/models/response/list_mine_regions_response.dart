import 'dart:convert';

import 'package:bnv_opendata/data/models/model_exports.dart';

ListMineRegionsResponse listMineRegionsModelFromJson(String str) =>
    ListMineRegionsResponse.fromJson(json.decode(str));

String listMineRegionsModelToJson(ListMineRegionsResponse data) =>
    json.encode(data.toJson());

class ListMineRegionsResponse {
  int? pageSize;
  int? pageNow;
  Filter? filter;
  int? pageTotal;
  int? recordTotal;
  List<MineRegionModel>? items;

  ListMineRegionsResponse({
    this.pageSize,
    this.pageNow,
    this.filter,
    this.pageTotal,
    this.recordTotal,
    this.items,
  });

  ListMineRegionsResponse copyWith({
    int? pageSize,
    int? pageNow,
    Filter? filter,
    int? pageTotal,
    int? recordTotal,
    List<MineRegionModel>? items,
  }) =>
      ListMineRegionsResponse(
        pageSize: pageSize ?? this.pageSize,
        pageNow: pageNow ?? this.pageNow,
        filter: filter ?? this.filter,
        pageTotal: pageTotal ?? this.pageTotal,
        recordTotal: recordTotal ?? this.recordTotal,
        items: items ?? this.items,
      );

  factory ListMineRegionsResponse.fromJson(Map<String, dynamic> json) =>
      ListMineRegionsResponse(
        pageSize: json["pageSize"],
        pageNow: json["pageNow"],
        filter: json["filter"] == null ? null : Filter.fromJson(json["filter"]),
        pageTotal: json["pageTotal"],
        recordTotal: json["recordTotal"],
        items: json["items"] == null
            ? []
            : List<MineRegionModel>.from(
                json["items"]!.map((x) => MineRegionModel.fromJson(x)),),
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "pageNow": pageNow,
        "filter": filter?.toJson(),
        "pageTotal": pageTotal,
        "recordTotal": recordTotal,
        "items": items == null
            ? []
            : List<MineRegionModel>.from(items!.map((x) => x.toJson())),
      };
}

class Filter {
  String? regionName;
  int? status;

  Filter({
    this.regionName,
    this.status,
  });

  Filter copyWith({
    String? regionName,
    int? status,
  }) =>
      Filter(
        regionName: regionName ?? this.regionName,
        status: status ?? this.status,
      );

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        regionName: json["regionName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "status": status,
      };
}
