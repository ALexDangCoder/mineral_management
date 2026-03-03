class ClosurePlanDetailModel {
  // ===== Thông tin chung =====
  final String code;        // DCM0000001
  final String name;        // Tên đề án
  final String mine;        // Khu mỏ
  final String mineral;     // Khoáng sản
  final String owner;       // Đơn vị lập

  // ===== Thời gian =====
  final String createdDate; // 15/02/2023
  final String approvedDate;// 01/04/2023
  final String duration;    // 2023-2025

  // ===== Tiến độ =====
  final double progress;    // 0.45

  // ===== Kinh phí =====
  final int estimateCost;   // 115000
  final int? approvedCost;  // null nếu chưa duyệt

  // ===== Trạng thái =====
  final String status;      // Chờ duyệt
  final String approvedBy;  // Bộ TN&MT

  // ===== Ghi chú =====
  final String? note;

  const ClosurePlanDetailModel({
    required this.code,
    required this.name,
    required this.mine,
    required this.mineral,
    required this.owner,
    required this.createdDate,
    required this.approvedDate,
    required this.duration,
    required this.progress,
    required this.estimateCost,
    this.approvedCost,
    required this.status,
    required this.approvedBy,
    this.note,
  });

  /// Optional: from API
  factory ClosurePlanDetailModel.fromJson(Map<String, dynamic> json) {
    return ClosurePlanDetailModel(
      code: json['code'] as String,
      name: json['name'] as String,
      mine: json['mine'] as String,
      mineral: json['mineral'] as String,
      owner: json['owner'] as String,
      createdDate: json['createdDate'] as String,
      approvedDate: json['approvedDate'] as String,
      duration: json['duration'] as String,
      progress: (json['progress'] as num).toDouble(),
      estimateCost: json['estimateCost'] as int,
      approvedCost: json['approvedCost'] as int?,
      status: json['status'] as String,
      approvedBy: json['approvedBy'] as String,
      note: json['note'] as String?,
    );
  }
}
