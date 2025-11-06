import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:bnv_opendata/presentation/screen_exports.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/about_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/blocks_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/components_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates_screen.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: const _MainScreenBody(),
    );
  }
}

class _MainScreenBody extends StatefulWidget {
  const _MainScreenBody({super.key});

  @override
  State<_MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<_MainScreenBody> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ComponentsScreen(),
    MineListScreen(), //BlocksScreen()
    DrillHoleListScreen(),
    // TemplatesScreen(),
    AccountInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.indexPage,
            children: _pages,
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
                  color: state.indexPage == 0
                      ? AppTheme.getInstance().primaryColor()
                      : XelaColor.Gray7,
                ),
                label: AppS.of(context).home_page,
              ),
              BottomNavigationBarItem(
                backgroundColor: XelaColor.Gray12,
                icon: Icon(
                  Icons.map_outlined,
                  size: 20,
                  color: state.indexPage == 1
                      ? AppTheme.getInstance().primaryColor()
                      : XelaColor.Gray7,
                ),
                label: AppS.of(context).map,
              ),
              BottomNavigationBarItem(
                backgroundColor: XelaColor.Gray12,
                icon: Icon(
                  Icons.query_stats,
                  size: 20,
                  color: state.indexPage == 2
                      ? AppTheme.getInstance().primaryColor()
                      : XelaColor.Gray7,
                ),
                label: AppS.of(context).mine_page,
              ),
              BottomNavigationBarItem(
                backgroundColor: XelaColor.Gray12,
                icon: Icon(
                  Icons.share_location_outlined,
                  size: 20,
                  color: state.indexPage == 3
                      ? AppTheme.getInstance().primaryColor()
                      : XelaColor.Gray7,
                ),
                label: AppS.of(context).drill_hole_page,
              ),
              BottomNavigationBarItem(
                backgroundColor: XelaColor.Gray12,
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 20,
                  color: state.indexPage == 4
                      ? AppTheme.getInstance().primaryColor()
                      : XelaColor.Gray7,
                ),
                label: AppS.of(context).account,
              ),
            ],
            currentIndex: state.indexPage,
            onTap: context.read<MainScreenCubit>().selectPage,
          ),
        );
      },
    );
  }
}

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//
//   static const List<Widget> _pages = <Widget>[
//     HomeScreen(),
//     ComponentsScreen(),
//     BlocksScreen(),
//     TemplatesScreen(),
//     AccountInfoScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
