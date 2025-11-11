import 'package:equatable/equatable.dart';

enum AlertModel { licenseExpired, mineClosurePlan }

class AlertGroup extends Equatable {
  final AlertModel type;
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
    AlertModel? type,
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
