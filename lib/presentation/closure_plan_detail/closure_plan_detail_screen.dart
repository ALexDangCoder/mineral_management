import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/presentation/closure_plan_detail/cubit/closure_plan_detail_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

class ClosurePlanDetailScreen extends StatelessWidget {
  const ClosurePlanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClosurePlanDetailCubit()..fetchDetail(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            const _AppBar(),
            Expanded(
              child: BlocBuilder<
                  ClosurePlanDetailCubit,
                  ClosurePlanDetailState>(
                builder: (context, state) {
                  if (state.eventState is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.eventState is ErrorState) {
                    return const Center(
                      child: Text('Có lỗi xảy ra'),
                    );
                  }

                  final data = state.data;
                  if (data == null) return const SizedBox();

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        _GeneralInfoCard(data),
                        _TimelineCard(data),
                        _StatusCard(data),
                        _NoteCard(data),
                        const _ActionButtons(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RawMaterialButton(
          elevation: 0,
          focusElevation: 2,
          highlightElevation: 0,
          fillColor: Colors.transparent,
          hoverElevation: 0,
          constraints: const BoxConstraints(),
          onPressed: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Chi tiết đề án đóng cửa mỏ',
            style: XelaTextStyle.xelaHeadline
          ),
        ),
      ],
    );
  }
}


class _Card extends StatelessWidget {
  final Widget child;

  const _Card(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

class _GeneralInfoCard extends StatelessWidget {
  final ClosurePlanDetailModel d;

  const _GeneralInfoCard(this.d);

  @override
  Widget build(BuildContext context) {
    return _Card(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Thông tin chung'),
          const SizedBox(height: 8),

          const Text(
            'Mã đề án',
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            d.code,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 12),
          _InfoRow('Tên đề án', d.name),
          _InfoRow('Khu mỏ', d.mine),
          _InfoRow('Khoáng sản', d.mineral),
          _InfoRow('Đơn vị lập', d.owner),
        ],
      ),
    );
  }
}


class _TimelineCard extends StatelessWidget {
  final ClosurePlanDetailModel d;

  const _TimelineCard(this.d);

  @override
  Widget build(BuildContext context) {
    return _Card(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Thời gian & Tiến độ'),
          const SizedBox(height: 12),

          _DateRow('Ngày lập đề án', d.createdDate),
          _DateRow('Ngày phê duyệt', d.approvedDate),
          _DateRow('Thời gian thực hiện', d.duration),

          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: d.progress,
                  minHeight: 8,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${(d.progress * 100).round()}%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          _MoneyRow(
            'Kinh phí dự tính (triệu đồng)',
            d.estimateCost.toString(),
          ),
        ],
      ),
    );
  }
}


class _StatusCard extends StatelessWidget {
  final ClosurePlanDetailModel d;

  const _StatusCard(this.d);

  @override
  Widget build(BuildContext context) {
    return _Card(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Trạng thái & Đơn vị'),
          const SizedBox(height: 12),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  d.status,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  d.approvedBy,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          _MoneyRow(
            'Kinh phí được duyệt (triệu đồng)',
            d.approvedCost?.toString() ?? 'Đợi phê duyệt',
          ),
        ],
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  final ClosurePlanDetailModel d;

  const _NoteCard(this.d);

  @override
  Widget build(BuildContext context) {
    return _Card(
      Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle('Ghi chú'),
            const SizedBox(height: 8),
            Text(d.note ?? ''),
          ],
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: navigate edit
              },
              child: const Text('Chỉnh sửa'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: XelaTextStyle.xelaSubheadline
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray7),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style:  XelaTextStyle.xelaBody.apply(color: XelaColor.Gray1),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateRow extends StatelessWidget {
  final String label;
  final String value;

  const _DateRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value),
          const SizedBox(width: 6),
          const Icon(Icons.calendar_today, size: 16),
        ],
      ),
    );
  }
}

class _MoneyRow extends StatelessWidget {
  final String label;
  final String value;

  const _MoneyRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.stacked_bar_chart, size: 18),
            const SizedBox(width: 4),
            Text(
              value,
              style: XelaTextStyle.xelaBody,
            ),
          ],
        ),
      ],
    );
  }
}











