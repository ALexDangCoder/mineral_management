import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ResourceReservesScreen extends StatefulWidget {
  const ResourceReservesScreen({super.key});

  @override
  State<ResourceReservesScreen> createState() =>
      _ResourceReservesScreenState();
}

class _ResourceReservesScreenState extends State<ResourceReservesScreen> {
  String? _selectedMine;
  String? _selectedMineralType;
  Map<String, dynamic>? _reservesData;

  // Dữ liệu mẫu
  final List<String> _mines = ['Mỏ A', 'Mỏ B', 'Mỏ C', 'Tất cả'];
  final List<String> _mineralTypes = [
    'Than đá',
    'Quặng sắt',
    'Đá vôi',
    'Tất cả'
  ];

  @override
  void initState() {
    super.initState();
    _loadReservesData();
  }

  void _loadReservesData() {
    // Dữ liệu mẫu (trong thực tế sẽ lấy từ API)
    setState(() {
      _reservesData = {
        'initialReserves': '2,000,000 tấn',
        'exploitedReserves': '750,000 tấn',
        'remainingReserves': '1,250,000 tấn',
        'exploitedPercent': 37.5,
        'remainingPercent': 62.5,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Tra cứu trữ lượng',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filter section
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
                    'Lọc theo',
                    style: XelaTextStyle.xelaSubheadline.apply(
                      color: XelaColor.Gray2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Mine filter
                  DropdownButtonFormField<String>(
                    value: _selectedMine,
                    decoration: InputDecoration(
                      labelText: 'Vùng mỏ',
                      labelStyle: XelaTextStyle.xelaBody.apply(
                        color: XelaColor.Gray6,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: XelaColor.Gray10),
                      ),
                      filled: true,
                      fillColor: XelaColor.Gray11,
                    ),
                    items: _mines.map((mine) {
                      return DropdownMenuItem(
                        value: mine == 'Tất cả' ? null : mine,
                        child: Text(mine),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedMine = value;
                        _loadReservesData();
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Mineral type filter
                  DropdownButtonFormField<String>(
                    value: _selectedMineralType,
                    decoration: InputDecoration(
                      labelText: 'Loại khoáng sản',
                      labelStyle: XelaTextStyle.xelaBody.apply(
                        color: XelaColor.Gray6,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: XelaColor.Gray10),
                      ),
                      filled: true,
                      fillColor: XelaColor.Gray11,
                    ),
                    items: _mineralTypes.map((type) {
                      return DropdownMenuItem(
                        value: type == 'Tất cả' ? null : type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedMineralType = value;
                        _loadReservesData();
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Reserves information
            if (_reservesData != null) ...[
              _InfoSection(
                title: 'Thông tin trữ lượng',
                children: [
                  _ReserveCard(
                    label: 'Trữ lượng ban đầu',
                    value: _reservesData!['initialReserves'],
                    icon: Icons.inventory_2,
                    iconColor: XelaColor.Blue6,
                  ),
                  const SizedBox(height: 14),
                  _ReserveCard(
                    label: 'Đã khai thác',
                    value: _reservesData!['exploitedReserves'],
                    icon: Icons.explore,
                    iconColor: XelaColor.Orange6,
                    percent: _reservesData!['exploitedPercent'],
                  ),
                  const SizedBox(height: 14),
                  _ReserveCard(
                    label: 'Còn lại',
                    value: _reservesData!['remainingReserves'],
                    icon: Icons.warehouse,
                    iconColor: XelaColor.Green6,
                    percent: _reservesData!['remainingPercent'],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
      bgColor: XelaColor.Gray12,
      appBarColor: XelaColor.Gray12,
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: XelaTextStyle.xelaSubheadline.apply(
              color: XelaColor.Gray2,
              fontWeightDelta: 1,
            ),
          ),
          const SizedBox(height: 16),
          XelaDivider(),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _ReserveCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final double? percent;

  const _ReserveCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: XelaColor.Gray11,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: XelaTextStyle.xelaSubheadline.apply(
                    color: XelaColor.Gray6,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: XelaTextStyle.xelaHeadline.apply(
              color: iconColor,
            ),
          ),
          if (percent != null) ...[
            const SizedBox(height: 12),
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: XelaColor.Gray10,
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percent! / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${percent!.toStringAsFixed(1)}%',
              style: XelaTextStyle.xelaCaption.apply(
                color: XelaColor.Gray6,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

