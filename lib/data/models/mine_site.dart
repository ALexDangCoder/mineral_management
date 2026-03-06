import 'package:bnv_opendata/data/models/mine_document.dart';

class MineSite {
  const MineSite({
    required this.id,
    required this.regionId,
    required this.code,
    required this.name,
    required this.location,
    required this.organization,
    required this.mineral,
    required this.area,
    required this.status,
    required this.stage,
    required this.coordinates,
    required this.elevation,
    required this.imageCategoryCounts,
    required this.digitalDocuments,
  });

  final String id;
  final String regionId;
  final String code;
  final String name;
  final String location;
  final String organization;
  final String mineral;
  final String area;
  final String status;
  final String stage;
  final String coordinates;
  final String elevation;
  final Map<String, int> imageCategoryCounts;
  final List<MineDocument> digitalDocuments;
}
