// To parse this JSON data, do
//
//     final listMineAreasModel = listMineAreasModelFromJson(jsonString);

import 'dart:convert';

import 'package:bnv_opendata/data/models/model_exports.dart';

ListMineAreasResponse listMineAreasModelFromJson(String str) =>
    ListMineAreasResponse.fromJson(json.decode(str));

String listMineAreasModelToJson(ListMineAreasResponse data) =>
    json.encode(data.toJson());

class ListMineAreasResponse {
  int? pageSize;
  int? pageNow;
  Filter? filter;
  int? pageTotal;
  int? recordTotal;
  List<MineAreaModel>? items;

  ListMineAreasResponse({
    this.pageSize,
    this.pageNow,
    this.filter,
    this.pageTotal,
    this.recordTotal,
    this.items,
  });

  ListMineAreasResponse copyWith({
    int? pageSize,
    int? pageNow,
    Filter? filter,
    int? pageTotal,
    int? recordTotal,
    List<MineAreaModel>? items,
  }) =>
      ListMineAreasResponse(
        pageSize: pageSize ?? this.pageSize,
        pageNow: pageNow ?? this.pageNow,
        filter: filter ?? this.filter,
        pageTotal: pageTotal ?? this.pageTotal,
        recordTotal: recordTotal ?? this.recordTotal,
        items: items ?? this.items,
      );

  factory ListMineAreasResponse.fromJson(Map<String, dynamic> json) =>
      ListMineAreasResponse(
        pageSize: json["pageSize"],
        pageNow: json["pageNow"],
        filter: json["filter"] == null ? null : Filter.fromJson(json["filter"]),
        pageTotal: json["pageTotal"],
        recordTotal: json["recordTotal"],
        items: json["items"] == null
            ? []
            : List<MineAreaModel>.from(json["items"]!.map((x) => MineAreaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "pageNow": pageNow,
        "filter": filter?.toJson(),
        "pageTotal": pageTotal,
        "recordTotal": recordTotal,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
