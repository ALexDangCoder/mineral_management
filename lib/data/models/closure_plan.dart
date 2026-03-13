import 'package:bnv_opendata/data/models/mine_document.dart';

class ClosurePlan {
  const ClosurePlan({
    required this.id,
    required this.siteId,
    required this.code,
    required this.name,
    required this.projectName,
    required this.status,
    required this.stage,
    required this.note,
    required this.documents,
  });

  final String id;
  final String siteId;
  final String code;
  final String name;
  final String projectName;
  final String status;
  final String stage;
  final String note;
  final List<MineDocument> documents;
}
