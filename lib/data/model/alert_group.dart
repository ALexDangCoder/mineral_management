import 'package:equatable/equatable.dart';

enum AlertType { licenseExpired, mineClosurePlan }

class AlertGroup extends Equatable {
  final AlertType type;
  final String title;
  final String subtitle;
  final int count;

  const AlertGroup({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.count,
  });

  @override
  List<Object?> get props => [type, title, subtitle, count];

  AlertGroup copyWith({
    AlertType? type,
    String? title,
    String? subtitle,
    int? count,
  }) {
    return AlertGroup(
      type: type ?? this.type,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      count: count ?? this.count,
    );
  }
}
