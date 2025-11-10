import 'package:bnv_opendata/presentation/home/report_widget/report_widget.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: _HomeScreenBody(),
      bgColor: XelaColor.Gray12,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ReportWidget(),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppS.of(context).warning_list,
                style: XelaTextStyle.XelaSubheadline.apply(color: XelaColor.Gray2),
              ),
              const Text('Content')
            ],
          ),
        ),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tiến độ',
                style: XelaTextStyle.XelaSubheadline.apply(color: XelaColor.Gray2),
              ),
              const Text('Content ...')
            ],
          ),
        ),
      ],
    );
  }
}
