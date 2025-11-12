import 'package:bnv_opendata/data/model/alert_medel.dart';
import 'package:bnv_opendata/data/repositories/alert_repository_impl.dart';
import 'package:bnv_opendata/presentation/alert/cubit/alert_list_cubit.dart';
import 'package:bnv_opendata/presentation/alert/cubit/alert_list_state.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertListScreen extends StatefulWidget {
  const AlertListScreen({super.key});

  @override
  State<AlertListScreen> createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlertListCubit(AlertRepositoryImpl())..load(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  RawMaterialButton(
                    elevation: 0,
                    focusElevation: 2,
                    highlightElevation: 0,
                    fillColor: Colors.transparent,
                    hoverElevation: 0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    constraints: const BoxConstraints(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.arrow_back_ios_new,
                          size: 20, color: XelaColor.Gray2),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Danh sách Cảnh báo",
                      style: XelaTextStyle.XelaHeadline.apply(
                        color: XelaColor.Gray2,
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(child: _Body()),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertListCubit, AlertListState>(
      builder: (context, state) {
        switch (state.status) {
          case AlertListStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case AlertListStatus.failure:
            return _Error(
              message: state.error,
              onRetry: () => context.read<AlertListCubit>().load(),
            );
          case AlertListStatus.success:
            if (state.items.isEmpty) {
              return const Center(
                child: Text(
                  'Không có cảnh báo',
                  style: XelaTextStyle.XelaBodyBold,
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: state.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final item = state.items[i];
                return _AlertCard(
                  title: item.title,
                  subtitle: item.subtitle,
                  type: item.type,
                  onTap: () {
                    // TODO: điều hướng tới màn chi tiết theo type:
                  },
                );
              },
            );
          case AlertListStatus.initial:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class _AlertCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final AlertModel type;
  final VoidCallback? onTap;

  const _AlertCard({
    required this.title,
    required this.subtitle,
    required this.type,
    this.onTap,
  });

  Color _stripe(AlertModel t) {
    switch (t) {
      case AlertModel.licenseExpired:
        return XelaColor.Red3;
      case AlertModel.mineClosurePlan:
        return XelaColor.Orange3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final stripe = _stripe(type);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: XelaColor.Gray12,
          borderRadius: BorderRadius.circular(16),
          boxShadow: kElevationToShadow[1],
        ),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 76,
              decoration: BoxDecoration(
                color: stripe,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: XelaTextStyle.XelaSubheadline),
                    const SizedBox(height: 4),
                    Text(subtitle, style: XelaTextStyle.XelaBody),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const _Error({this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.error_outline),
        const SizedBox(height: 8),
        Text(message ?? 'Đã có lỗi xảy ra',
            style: XelaTextStyle.XelaSubheadline),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onRetry,
          child: const Text('Thử lại', style: XelaTextStyle.XelaSubheadline),
        ),
      ]),
    );
  }
}
