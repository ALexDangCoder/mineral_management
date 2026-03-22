part of 'geological_report_list_cubit.dart';

class GeologicalReportListState extends Equatable {
  const GeologicalReportListState({
    this.status = MineScreenStatus.initial,
    this.reports = const <GeologicalReportModel>[],
    this.filteredReports = const <GeologicalReportModel>[],
    this.errorMessage,
    this.isLoadingMore,
    this.page = 1,
    this.hasMore,
    this.searchKey = '',
  });

  final MineScreenStatus status;
  final List<GeologicalReportModel> reports;
  final List<GeologicalReportModel> filteredReports;
  final String? errorMessage;
  final bool? isLoadingMore;
  final int page;
  final bool? hasMore;
  final String? searchKey;

  GeologicalReportListState copyWith({
    MineScreenStatus? status,
    List<GeologicalReportModel>? reports,
    List<GeologicalReportModel>? filteredReports,
    String? errorMessage,
    bool? isLoadingMore,
    int? page,
    bool? hasMore,
    String? searchKey,
  }) {
    return GeologicalReportListState(
      status: status ?? this.status,
      reports: reports ?? this.reports,
      filteredReports: filteredReports ?? this.filteredReports,
      errorMessage: errorMessage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      searchKey: searchKey ?? this.searchKey,
    );
  }

  @override
  List<Object?> get props => [
        status,
        reports,
        filteredReports,
        errorMessage,
        isLoadingMore,
        page,
        hasMore,
        searchKey,
      ];
}
