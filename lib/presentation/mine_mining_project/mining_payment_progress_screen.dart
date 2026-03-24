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
    final Map<String, dynamic> data = item as Map<String, dynamic>;
    final String name = data['paymentName'] ?? data['name'] ?? 'N/A';
    final double amount = (data['amount'] ?? 0).toDouble();
    final String date = data['paymentDate'] ?? data['date'] ?? 'N/A';
    final bool isPaid = data['isPaid'] == true;
    final String status = data['status'] ?? (isPaid ? 'Đã thanh toán' : 'Chưa thanh toán');

    String currencyFormat(double val) {
      return '${val.toStringAsFixed(0).replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]}.',
          )} VNĐ';
    }

    return XkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isPaid ? XelaColor.Green11 : XelaColor.Orange11,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isPaid
                      ? Icons.check_circle_outline_rounded
                      : Icons.account_balance_wallet_outlined,
                  size: 20,
                  color: isPaid ? XelaColor.Green3 : XelaColor.Orange3,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: XelaTextStyle.xelaBodyBold
                          .apply(color: XelaColor.Gray2),
                    ),
                    Text(
                      date,
                      style: XelaTextStyle.xelaCaption
                          .apply(color: XelaColor.Gray6),
                    ),
                  ],
                ),
              ),
              XkStatusChip(
                text: status,
                color: isPaid ? XelaColor.Green1 : XelaColor.Orange6,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),
          XkLabelValueRow(
            label: 'Giá trị thanh toán',
            value: currencyFormat(amount),
          ),
        ],
      ),
    );
  }
}
