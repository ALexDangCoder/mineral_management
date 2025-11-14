import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/presentation/alert/alert_list_screen.dart';
import 'package:bnv_opendata/presentation/closure_plan_detail/closure_plan_detail_screen.dart';
import 'package:bnv_opendata/presentation/notification_management/notification_management_screen.dart';
import 'package:bnv_opendata/presentation/progress/progress_screen.dart';
import 'package:bnv_opendata/presentation/project_detail/project_detail_screen.dart';
import 'package:bnv_opendata/presentation/show_construction_map/show_construction_Map_screen.dart';
import 'package:flutter/material.dart' hide Router;

class TotalScreen extends StatelessWidget {
  const TotalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routers.mine3d);
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text('3D Visualization Module'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AlertListScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text('License Module'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ProgressScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text('Construction Module'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ShowConstructionMapScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text('Map Module'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProjectDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text('Project Module'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NotificationManagementScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text(
                      'Xem cảnh báo hết hiệu lực thực hiện Đề án đóng cửa mỏ'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ClosurePlanDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text('Closure Module'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
