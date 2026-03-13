part of 'drill_hole_detail_cubit.dart';

class DrillHoleDetailState extends Equatable {
  const DrillHoleDetailState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.drillHole,
    this.site,
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final DrillHole? drillHole;
  final MineSite? site;
  final String? errorMessage;

  DrillHoleDetailState copyWith({
    MineScreenStatus? status,
    String? query,
    DrillHole? drillHole,
    MineSite? site,
    String? errorMessage,
  }) {
    return DrillHoleDetailState(
      status: status ?? this.status,
      query: query ?? this.query,
      drillHole: drillHole ?? this.drillHole,
      site: site ?? this.site,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, query, drillHole, site, errorMessage];
}
