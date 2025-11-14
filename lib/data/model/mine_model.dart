class MineModel {
  final String id;
  final String name;
  final String modelUrl;

  MineModel({
    required this.id,
    required this.name,
    required this.modelUrl,
  });

  factory MineModel.fromJson(Map<String, dynamic> json) {
    return MineModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      modelUrl: json['modelUrl'] ?? '',
    );
  }
}
