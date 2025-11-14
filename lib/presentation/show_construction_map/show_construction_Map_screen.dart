import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ShowConstructionMapScreen extends StatelessWidget {
  const ShowConstructionMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ====== Nội dung chính ======
          const Expanded(
            child: Center(
              child: Text(
                "Bản đồ khu vực",
                style: XelaTextStyle.xelaTitle3,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Hiển thị bottom sheet với các options
          showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.view_in_ar),
                  title: const Text('Xem mô hình 3D'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routers.mine3d);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('Chi tiết dự án'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      Routers.projectDetail,
                      arguments: {
                        'projectName': 'Dự án trên bản đồ',
                      },
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.close_fullscreen),
                  title: const Text('Kế hoạch đóng cửa'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      Routers.closurePlanDetail,
                      arguments: {
                        'projectName': 'Kế hoạch đóng cửa',
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
        label: const Text('Tùy chọn'),
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}
