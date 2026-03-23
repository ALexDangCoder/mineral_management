import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ResourceManagementScreen extends StatelessWidget {
  const ResourceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Quản trị tài nguyên',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _buildExplorationStatsTable(),
            const SizedBox(height: 20),
            _buildDossierList(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplorationStatsTable() {
    return XkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const XkSectionHeader(title: 'Bảng tổng hợp công trình thăm dò'),
          const SizedBox(height: 16),
          _buildTableHeader(),
          const Divider(height: 1),
          _buildTableRow('1', 'Lỗ khoan', '47', '28/47'),
          _buildTableRow('2', 'Công trình khai đào', '77', '11/77'),
          _buildTableRow('3', 'Công tác đo vẽ bản đồ', '26', '10/26'),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildCell('STT', flex: 1, isHeader: true),
          _buildCell('Loại hình công việc', flex: 4, isHeader: true),
          _buildCell('Số lượng', flex: 2, isHeader: true),
          _buildCell('TL nguyên thủy', flex: 3, isHeader: true),
        ],
      ),
    );
  }

  Widget _buildTableRow(String stt, String type, String total, String original) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _buildCell(stt, flex: 1),
          _buildCell(type, flex: 4),
          _buildCell(total, flex: 2),
          _buildCell(original, flex: 3, color: XelaColor.Blue6),
        ],
      ),
    );
  }

  Widget _buildCell(String text, {int flex = 1, bool isHeader = false, Color? color}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: isHeader
            ? XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6)
            : XelaTextStyle.xelaSmallBody.apply(color: color ?? XelaColor.Gray2),
      ),
    );
  }

  Widget _buildDossierList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const XkSectionHeader(title: 'Hồ sơ tài liệu'),
        const SizedBox(height: 12),
        _buildDossierItem('DeAnPhuongAn_1773367551463.xlsx', '23/03/2024'),
        _buildDossierItem('Hồ sơ 0000000012032', '20/03/2024'),
        _buildDossierItem('Bản đồ địa chất khu vực.pdf', '15/03/2024'),
        _buildDossierItem('Báo cáo kết quả thăm dò.docx', '10/03/2024'),
      ],
    );
  }

  Widget _buildDossierItem(String fileName, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: XkCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.description_outlined, color: XelaColor.Gray6, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fileName,
                    style: XelaTextStyle.xelaSmallBodyBold.apply(color: XelaColor.Gray2),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ngày cập nhật: $date',
                    style: XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6),
                  ),
                ],
              ),
            ),
            const Icon(Icons.download_outlined, color: XelaColor.Blue6, size: 20),
          ],
        ),
      ),
    );
  }
}
