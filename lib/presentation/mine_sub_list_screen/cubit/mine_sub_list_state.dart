part of 'mine_sub_list_cubit.dart';

class MineSubListState extends Equatable {
  const MineSubListState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.sites = const <MineSite>[],
    this.filteredSites = const <MineSite>[],
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final List<MineSite> sites;
  final List<MineSite> filteredSites;
  final String? errorMessage;

  MineSubListState copyWith({
    MineScreenStatus? status,
    String? query,
    List<MineSite>? sites,
    List<MineSite>? filteredSites,
    String? errorMessage,
  }) {
    return MineSubListState(
      status: status ?? this.status,
      query: query ?? this.query,
      sites: sites ?? this.sites,
      filteredSites: filteredSites ?? this.filteredSites,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, query, sites, filteredSites, errorMessage];
}
