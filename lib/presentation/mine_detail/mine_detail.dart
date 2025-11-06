import 'package:flutter/material.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';

class Mine {
  final String name;
  final String mineralType;
  final bool isActive;

  Mine({
    required this.name,
    required this.mineralType,
    required this.isActive,
  });
}

class MineDetail extends StatelessWidget {
   MineDetail({super.key});

  final List<Mine> mines =  [
    Mine(name: "Khu mỏ Thạch Khê", mineralType: "Sắt", isActive: true),
    Mine(name: "Khu mỏ Bauxite Tây Nguyên", mineralType: "Bauxite", isActive: false),
    Mine(name: "Khu mỏ Cẩm Phả", mineralType: "Than đá", isActive: true),
  ];

  String getStatusText(bool status) => status ? "Đang hoạt động" : "Tạm dừng";

  Color getStatusColor(bool status) =>
      status ? Colors.green : Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách vùng mỏ"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mines.length,
        itemBuilder: (context, index) {
          final mine = mines[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mine.name,
                    style: XelaTextStyle.XelaHeadline,
                  ),
                  const SizedBox(height: 8),
                  Text("Loại khoáng sản: ${mine.mineralType}"),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Trạng thái: ",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        getStatusText(mine.isActive),
                        style: TextStyle(color: getStatusColor(mine.isActive)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
