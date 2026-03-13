part of 'geological_report_list_cubit.dart';

class GeologicalReportListState extends Equatable {
  const GeologicalReportListState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.reports = const <GeologicalReportItem>[],
    this.filteredReports = const <GeologicalReportItem>[],
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final List<GeologicalReportItem> reports;
  final List<GeologicalReportItem> filteredReports;
  final String? errorMessage;

  GeologicalReportListState copyWith({
    MineScreenStatus? status,
    String? query,
    List<GeologicalReportItem>? reports,
    List<GeologicalReportItem>? filteredReports,
    String? errorMessage,
  }) {
    return GeologicalReportListState(
      status: status ?? this.status,
      query: query ?? this.query,
      reports: reports ?? this.reports,
      filteredReports: filteredReports ?? this.filteredReports,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, query, reports, filteredReports, errorMessage];
}
