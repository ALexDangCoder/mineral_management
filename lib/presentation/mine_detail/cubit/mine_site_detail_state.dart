part of 'mine_site_detail_cubit.dart';

class MineSiteDetailState extends Equatable {
  const MineSiteDetailState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.site,
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final MineSite? site;
  final String? errorMessage;

  MineSiteDetailState copyWith({
    MineScreenStatus? status,
    String? query,
    MineSite? site,
    String? errorMessage,
  }) {
    return MineSiteDetailState(
      status: status ?? this.status,
      query: query ?? this.query,
      site: site ?? this.site,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, query, site, errorMessage];
}
