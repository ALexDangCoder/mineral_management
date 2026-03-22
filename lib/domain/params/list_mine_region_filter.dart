class ListMineRegionFilter {
  String? regionName;
  int? status;

  ListMineRegionFilter({
    this.regionName,
    this.status,
  });

  ListMineRegionFilter copyWith({
    String? regionName,
    int? status,
  }) =>
      ListMineRegionFilter(
        regionName: regionName ?? this.regionName,
        status: status ?? this.status,
      );

  factory ListMineRegionFilter.fromJson(Map<String, dynamic> json) =>
      ListMineRegionFilter(
        regionName: json["regionName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "status": status,
      };
}
