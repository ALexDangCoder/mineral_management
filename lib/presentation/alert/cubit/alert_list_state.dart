import 'package:bnv_opendata/data/model/alert_medel.dart';
import 'package:equatable/equatable.dart';

enum AlertListStatus { initial, loading, success, failure }

class AlertListState extends Equatable {
  final AlertListStatus status;
  final List<AlertGroup> items;
  final String? error;

  const AlertListState({
    this.status = AlertListStatus.initial,
    this.items = const [],
    this.error,
  });

  AlertListState copyWith({
    AlertListStatus? status,
    List<AlertGroup>? items,
    String? error,
  }) {
    return AlertListState(
      status: status ?? this.status,
      items: items ?? this.items,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, items, error];
}
