import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/presentation/screen_exports.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/about_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/blocks_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/components_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates_screen.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ComponentsScreen(),
    BlocksScreen(),
    TemplatesScreen(),
    AccountInfoScreen(),
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
        selectedItemColor: AppTheme.getInstance().primaryColor(),
        unselectedItemColor: XelaColor.Gray7,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.home,
              size: 20,
              color: _selectedIndex == 0 ? AppTheme.getInstance().primaryColor() : XelaColor.Gray7,
            ),
            label: AppS.of(context).home_page,
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.map_outlined,
              size: 20,
              color: _selectedIndex == 1 ? AppTheme.getInstance().primaryColor() : XelaColor.Gray7,
            ),
            label: AppS.of(context).map,
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.widgets,
              size: 20,
              color: _selectedIndex == 2 ? AppTheme.getInstance().primaryColor() : XelaColor.Gray7,
            ),
            label: AppS.of(context).report,
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.report,
              size: 20,
              color: _selectedIndex == 3 ? AppTheme.getInstance().primaryColor() : XelaColor.Gray7,
            ),
            label: AppS.of(context).caution,
          ),
          BottomNavigationBarItem(
            backgroundColor: XelaColor.Gray12,
            icon: Icon(
              Icons.account_circle_rounded,
              size: 20,
              color: _selectedIndex == 4 ? AppTheme.getInstance().primaryColor() : XelaColor.Gray7,
            ),
            label: AppS.of(context).account,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
