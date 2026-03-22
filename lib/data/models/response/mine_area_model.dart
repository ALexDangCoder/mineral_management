class MineAreaModel {
  String? areaId;
  String? areaName;
  String? regionId;
  String? regionName;
  int? status;
  List<String>? mineralIds;
  String? mapName;

  MineAreaModel({
    this.areaId,
    this.areaName,
    this.regionId,
    this.regionName,
    this.status,
    this.mineralIds,
    this.mapName,
  });

  MineAreaModel copyWith({
    String? areaId,
    String? areaName,
    String? regionId,
    String? regionName,
    int? status,
    List<String>? mineralIds,
    String? mapName,
  }) =>
      MineAreaModel(
        areaId: areaId ?? this.areaId,
        areaName: areaName ?? this.areaName,
        regionId: regionId ?? this.regionId,
        regionName: regionName ?? this.regionName,
        status: status ?? this.status,
        mineralIds: mineralIds ?? this.mineralIds,
        mapName: mapName ?? this.mapName,
      );

  factory MineAreaModel.fromJson(Map<String, dynamic> json) => MineAreaModel(
    areaId: json["areaId"],
    areaName: json["areaName"],
    regionId: json["regionId"],
    regionName: json["regionName"],
    status: json["status"],
    mineralIds: json["mineralIds"] == null ? [] : List<String>.from(json["mineralIds"]!.map((x) => x)),
    mapName: json["mapName"],
  );

  Map<String, dynamic> toJson() => {
    "areaId": areaId,
    "areaName": areaName,
    "regionId": regionId,
    "regionName": regionName,
    "status": status,
    "mineralIds": mineralIds == null ? [] : List<dynamic>.from(mineralIds!.map((x) => x)),
    "mapName": mapName,
  };
}
