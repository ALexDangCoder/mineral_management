import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GeologicalReportListScreen extends StatefulWidget {
  const GeologicalReportListScreen({super.key});

  @override
  State<GeologicalReportListScreen> createState() =>
      _GeologicalReportListScreenState();
}

class _GeologicalReportListScreenState
    extends State<GeologicalReportListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _reports = [];
  List<Map<String, dynamic>> _filteredReports = [];

  @override
  void initState() {
    super.initState();
    // Dữ liệu mẫu (trong thực tế sẽ lấy từ API)
    _reports = [
      {
        'id': 1,
        'name': 'Báo cáo địa chất mỏ A - Quý 1/2024',
        'mineName': 'Mỏ A',
        'createdDate': DateTime(2024, 1, 15),
        'type': 'Báo cáo định kỳ',
      },
      {
        'id': 2,
        'name': 'Báo cáo địa chất mỏ B - Quý 2/2024',
        'mineName': 'Mỏ B',
        'createdDate': DateTime(2024, 4, 20),
        'type': 'Báo cáo định kỳ',
      },
      {
        'id': 3,
        'name': 'Báo cáo đánh giá trữ lượng mỏ C',
        'mineName': 'Mỏ C',
        'createdDate': DateTime(2024, 3, 10),
        'type': 'Báo cáo đặc biệt',
      },
      {
        'id': 4,
        'name': 'Báo cáo địa chất mỏ A - Quý 3/2024',
        'mineName': 'Mỏ A',
        'createdDate': DateTime(2024, 7, 25),
        'type': 'Báo cáo định kỳ',
      },
      {
        'id': 5,
        'name': 'Báo cáo khảo sát địa chất khu vực mới',
        'mineName': 'Khu vực D',
        'createdDate': DateTime(2024, 6, 5),
        'type': 'Báo cáo khảo sát',
      },
    ];
    _filteredReports = _reports;
    _searchController.addListener(_filterReports);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterReports() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredReports = _reports;
      } else {
        _filteredReports = _reports.where((report) {
          return report['name'].toString().toLowerCase().contains(query) ||
              report['mineName'].toString().toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Báo cáo địa chất',
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: XelaTextField(
              placeholder: 'Tìm kiếm theo tên, vùng mỏ...',
              leftIcon: const Icon(
                Icons.search,
                size: 20,
                color: XelaColor.Gray2,
              ),
              background: Colors.transparent,
              textEditingController: _searchController,
            ),
          ),
          // List
          Expanded(
            child: _filteredReports.isEmpty
                ? Center(
                    child: Text(
                      'Không tìm thấy báo cáo nào',
                      style: XelaTextStyle.xelaBody.apply(
                        color: XelaColor.Gray6,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredReports.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) {
                      final report = _filteredReports[index];
                      return _ReportItem(
                        report: report,
                        onTap: () {
                          // TODO: Navigate to report detail or open PDF
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Mở báo cáo: ${report['name']}'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      bgColor: XelaColor.Gray12,
      appBarColor: XelaColor.Gray12,
    );
  }
}

class _ReportItem extends StatelessWidget {
  final Map<String, dynamic> report;
  final VoidCallback onTap;

  const _ReportItem({
    required this.report,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final createdDate = report['createdDate'] as DateTime?;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: XelaColor.Blue11,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.description,
                    color: XelaColor.Blue6,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        report['name'] ?? 'N/A',
                        style: XelaTextStyle.xelaBodyBold.apply(
                          color: XelaColor.Gray2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Vùng mỏ: ${report['mineName'] ?? 'N/A'}',
                        style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Gray6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: XelaColor.Gray6,
                ),
                const SizedBox(width: 4),
                Text(
                  'Ngày tạo: ${createdDate != null ? dateFormat.format(createdDate) : 'N/A'}',
                  style: XelaTextStyle.xelaCaption.apply(
                    color: XelaColor.Gray6,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: XelaColor.Gray11,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    report['type'] ?? 'N/A',
                    style: XelaTextStyle.xelaCaption.apply(
                      color: XelaColor.Gray2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

