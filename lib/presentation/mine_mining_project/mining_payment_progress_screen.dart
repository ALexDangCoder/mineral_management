import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/mine_base_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/mine_mining_project/cubit/mining_payment_progress_cubit.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class MiningPaymentProgressScreen
    extends MineBaseListScreen<dynamic, MiningPaymentProgressCubit> {
  final String projectId;

  MiningPaymentProgressScreen({
    super.key,
    required this.projectId,
  }) : super(
          title: 'Tiến độ thanh toán',
          searchPlaceholder: 'Tìm kiếm đợt thanh toán',
          buildItem: _buildItem,
          createCubit: (context) =>
              MiningPaymentProgressCubit(injector.get(), projectId),
        );

  static Widget _buildItem(BuildContext context, dynamic item) {
    // Attempting to map generic fields from PaymentPlan dynamic response
    final String name = item['paymentName'] ?? item['name'] ?? 'N/A';
    final double amount = (item['amount'] ?? 0).toDouble();
    final String date = item['paymentDate'] ?? item['date'] ?? 'N/A';
    final String status = item['status'] ?? (item['isPaid'] == true ? 'Đã thanh toán' : 'Chưa thanh toán');

    return XkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.payment_outlined,
                  size: 20, color: XelaColor.Gray6),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
                ),
              ),
              XkStatusChip(
                text: status,
                color: status == 'Đã thanh toán'
                    ? XelaColor.Green1
                    : XelaColor.Orange6,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildRow('Giá trị:', '${amount.toStringAsFixed(0)} VNĐ'),
          const SizedBox(height: 8),
          _buildRow('Ngày thanh toán:', date),
        ],
      ),
    );
  }

  static Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: XelaTextStyle.xelaSmallBody.apply(color: XelaColor.Gray6)),
        Text(value,
            style: XelaTextStyle.xelaSmallBodyBold.apply(color: XelaColor.Gray2)),
      ],
    );
  }
}
