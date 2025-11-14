import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/presentation/alert/alert_list_screen.dart';
import 'package:bnv_opendata/presentation/home/report_widget/report_widget.dart';
import 'package:bnv_opendata/presentation/progress/progress_screen.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
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
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xin chào,',
                  style: XelaTextStyle.xelaBody.apply(
                    color: XelaColor.Gray7,
                  ),
                ),
                Text(
                  'Nguyen Van A',
                  style: XelaTextStyle.xelaSubheadline.apply(
                    color: XelaColor.Gray1,
                    fontWeightDelta: 2,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routers.notificationManagement,
                );
              },
              child: const Icon(
                Icons.notifications,
                size: 20,
                color: XelaColor.Gray7,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              const ReportWidget(),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const AlertListScreen(),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ProgressScreen(),
              ),
              const SizedBox(
                height: 16,
              ),
              // Quick access buttons
              Row(
                children: [
                  Expanded(
                    child: _QuickAccessCard(
                      icon: Icons.description,
                      title: 'Báo cáo địa chất',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routers.geologicalReportList,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _QuickAccessCard(
                      icon: Icons.inventory_2,
                      title: 'Tra cứu trữ lượng',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routers.resourceReserves,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickAccessCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.getInstance().primaryColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppTheme.getInstance().primaryColor(),
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: XelaTextStyle.xelaCaption.apply(
                color: XelaColor.Gray2,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
