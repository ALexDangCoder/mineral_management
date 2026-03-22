class ListAreaFilter {
  String? areaName;
  List<String>? regionId;
  int? status;

  ListAreaFilter({
    this.areaName,
    this.regionId,
    this.status,
  });

  ListAreaFilter copyWith({
    String? areaName,
    List<String>? regionId,
    int? status,
  }) =>
      ListAreaFilter(
        areaName: areaName ?? this.areaName,
        regionId: regionId ?? this.regionId,
        status: status ?? this.status,
      );

  factory ListAreaFilter.fromJson(Map<String, dynamic> json) => ListAreaFilter(
    areaName: json["areaName"],
    regionId: json["regionId"] == null ? [] : List<String>.from(json["regionId"]!.map((x) => x)),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "areaName": areaName,
    "regionId": regionId == null ? [] : List<dynamic>.from(regionId!.map((x) => x)),
    "status": status,
  };
}
