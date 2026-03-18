import 'package:bnv_opendata/presentation/total_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/blocks_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/components_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/home_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates_screen.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:flutter/material.dart';

class MainScreenXela extends StatefulWidget {
  const MainScreenXela({super.key});

  @override
  _MainScreenXelaState createState() => _MainScreenXelaState();
}

class _MainScreenXelaState extends State<MainScreenXela> {
  int _selectedIndex = 0;

  static  List<Widget> _pages = <Widget>[
    HomeScreen(),
    ComponentsScreen(),
    BlocksScreen(),
    TemplatesScreen(),
    TotalScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: XelaColor.Gray12,
        selectedItemColor: XelaColor.Blue3,
        unselectedItemColor: XelaColor.Gray7,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.home,
              size: 20,
              color: _selectedIndex == 0 ? XelaColor.Blue3 : XelaColor.Gray7,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.toggle_off,
              size: 20,
              color: _selectedIndex == 1 ? XelaColor.Blue3 : XelaColor.Gray7,
            ),
            label: 'Components',
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.widgets,
              size: 20,
              color: _selectedIndex == 2 ? XelaColor.Blue3 : XelaColor.Gray7,
            ),
            label: 'Blocks',
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.auto_fix_high,
              size: 20,
              color: _selectedIndex == 3 ? XelaColor.Blue3 : XelaColor.Gray7,
            ),
            label: 'Templates',
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.info,
              size: 20,
              color: _selectedIndex == 4 ? XelaColor.Blue3 : XelaColor.Gray7,
            ),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
