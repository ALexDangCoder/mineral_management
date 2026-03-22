class MineRegionModel {
  String? regionId;
  String? regionName;
  int? status;

  MineRegionModel({
    this.regionId,
    this.regionName,
    this.status,
  });

  MineRegionModel copyWith({
    String? regionId,
    String? regionName,
    int? status,
  }) =>
      MineRegionModel(
        regionId: regionId ?? this.regionId,
        regionName: regionName ?? this.regionName,
        status: status ?? this.status,
      );

  factory MineRegionModel.fromJson(Map<String, dynamic> json) => MineRegionModel(
    regionId: json["regionId"],
    regionName: json["regionName"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "regionId": regionId,
    "regionName": regionName,
    "status": status,
  };
}