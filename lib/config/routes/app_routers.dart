import 'package:bnv_opendata/presentation/screen_exports.dart';
import 'package:bnv_opendata/presentation/splash/splash_screen.dart';
import 'package:bnv_opendata/utils/constants/app_constants.dart';
import 'package:bnv_opendata/widgets/xela_components/accordion_component.dart';
import 'package:bnv_opendata/widgets/xela_components/alert_component.dart';
import 'package:bnv_opendata/widgets/xela_components/badge_component.dart';
import 'package:bnv_opendata/widgets/xela_components/buttons_component.dart';
import 'package:bnv_opendata/widgets/xela_components/charts_component.dart';
import 'package:bnv_opendata/widgets/xela_components/checkbox_component.dart';
import 'package:bnv_opendata/widgets/xela_components/chips_component.dart';
import 'package:bnv_opendata/widgets/xela_components/colors_component.dart';
import 'package:bnv_opendata/widgets/xela_components/date_picker_component.dart';
import 'package:bnv_opendata/widgets/xela_components/dialogs_component.dart';
import 'package:bnv_opendata/widgets/xela_components/divider_component.dart';
import 'package:bnv_opendata/widgets/xela_components/number_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/radio_button_component.dart';
import 'package:bnv_opendata/widgets/xela_components/range_slider_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/segmented_control_component.dart';
import 'package:bnv_opendata/widgets/xela_components/slide_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/steps_component.dart';
import 'package:bnv_opendata/widgets/xela_components/tabs_component.dart';
import 'package:bnv_opendata/widgets/xela_components/text_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/textarea_component.dart';
import 'package:bnv_opendata/widgets/xela_components/toast_component.dart';
import 'package:bnv_opendata/widgets/xela_components/toggle_component.dart';
import 'package:bnv_opendata/widgets/xela_components/tooltips_component.dart';
import 'package:bnv_opendata/widgets/xela_components/typography_component.dart';
import 'package:bnv_opendata/widgets/xela_components/user_avatar_component.dart';
import 'package:flutter/material.dart';

typedef AppWidgetBuilder = Widget Function(BuildContext, RouteSettings);

class AppRouter {
  static const dfNamed = Navigator.defaultRouteName;

  ///Auth
  static const login = '/login';
  static const logout = '/logout';
  static const changePassword = '/change_password';

  ///Account
  static const accountInfo = '/account_info';

  ///Main App
  static const splash = '/splash';
  static const main = '/main';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case main:
        return MaterialPageRoute(builder: (ctx) => const MainScreen());
      case login:
        return MaterialPageRoute(builder: (ctx) => const LoginPage());
      case logout:
        return MaterialPageRoute(builder: (ctx) => const ColorsComponent());
      case changePassword:
        return MaterialPageRoute(
            builder: (ctx) => const ChangePasswordScreen(),);
      case accountInfo:
        return MaterialPageRoute(builder: (ctx) => const AccountInfoScreen());
    }
    return null;
  }
}

class PageTransition<T> extends PageRouteBuilder<T> {
  /// Child for your next page
  final Widget child;

  /// Transition types
  ///  fade,rightToLeft,bottomToTop,rightToLeftWithFade
  final PageTransitionType type;

  /// Duration for your transition default is 300 ms
  final Duration duration;

  /// Duration for your pop transition default is 300 ms
  final Duration reverseDuration;

  /// Context for inherit theme
  final BuildContext? ctx;

  /// Optional inherit theme
  final bool inheritTheme;

  /// Page transition constructor. We can pass the next page as a child,
  PageTransition({
    required this.child,
    this.type = PageTransitionType.RIGHT_TO_LEFT_WITH_FADE,
    this.ctx,
    this.inheritTheme = false,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    RouteSettings? settings,
  })  : assert(
          inheritTheme,
          "'ctx' cannot be null when 'inheritTheme' is true",
        ),
        super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return inheritTheme
                ? InheritedTheme.captureAll(
                    ctx!,
                    child,
                  )
                : child;
          },
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          settings: settings,
          maintainState: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            switch (type) {
              case PageTransitionType.FADE:
                return FadeTransition(opacity: animation, child: child);
                // ignore: dead_code
                break;
              case PageTransitionType.RIGHT_TO_LEFT:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                // ignore: dead_code
                break;
              case PageTransitionType.BOTTOM_TO_TOP:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                // ignore: dead_code
                break;
              case PageTransitionType.RIGHT_TO_LEFT_WITH_FADE:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
                // ignore: dead_code
                break;
            }
          },
        );
}
