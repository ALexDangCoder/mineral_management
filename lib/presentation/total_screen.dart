import 'package:bnv_opendata/presentation/alert/alert_list_screen.dart';
import 'package:bnv_opendata/presentation/closure_plan_detail/closure_plan_detail_screen.dart';
import 'package:bnv_opendata/presentation/mine_3d/mine_3d_screen.dart';
import 'package:bnv_opendata/presentation/notification_management/notification_management_screen.dart';
import 'package:bnv_opendata/presentation/progress/progress_screen.dart';
import 'package:bnv_opendata/presentation/project_detail/project_detail_screen.dart';
import 'package:bnv_opendata/presentation/show_construction_map/show_construction_Map_screen.dart';
import 'package:flutter/material.dart';

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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const Mine3DScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('3D Visualization Module'),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>  AlertListScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('License Module'),
                ),
              ),
              SizedBox(height: 10,),
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
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('Construction Module'),
                ),
              ),
              SizedBox(height: 10,),
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
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('Map Module'),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>  ProjectDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('Project Module'),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>  NotificationManagementScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('Xem cảnh báo hết hiệu lực thực hiện Đề án đóng cửa mỏ'),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>  ClosurePlanDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('Closure Module'),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
