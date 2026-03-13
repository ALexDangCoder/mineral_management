class MineDocument {
  const MineDocument({
    required this.id,
    required this.name,
    required this.fileType,
    required this.size,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String fileType;
  final String size;
  final String updatedAt;
}
