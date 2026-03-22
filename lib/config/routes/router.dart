import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/presentation/alert/alert_list_screen.dart';
import 'package:bnv_opendata/presentation/closure_plan_detail/closure_plan_detail_screen.dart';
import 'package:bnv_opendata/presentation/closure_plan_list_screen/closure_plan_list_screen.dart';
import 'package:bnv_opendata/presentation/construction_detail/construction_detail_screen.dart';
import 'package:bnv_opendata/presentation/drill_hole_detail/drill_hole_detail_screen.dart';
import 'package:bnv_opendata/presentation/geological_report_list/geological_report_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_3d/mine_3d_screen.dart';
import 'package:bnv_opendata/presentation/mine_area_detail/mine_detail_screen'
    '.dart';
import 'package:bnv_opendata/presentation/mine_region_list_screen/mine_region_list_screen.dart';
import 'package:bnv_opendata/presentation/notification_management/notification_management_screen.dart';
import 'package:bnv_opendata/presentation/progress/progress_screen.dart';
import 'package:bnv_opendata/presentation/project_detail/project_detail_screen.dart';
import 'package:bnv_opendata/presentation/proposal_plan_list_screen/proposal_plan_list_screen.dart';
import 'package:bnv_opendata/presentation/resource_reserves/resource_reserves_screen.dart';
import 'package:bnv_opendata/presentation/screen_exports.dart';
import 'package:bnv_opendata/presentation/show_construction_map/show_construction_Map_screen.dart';
import 'package:bnv_opendata/presentation/splash/splash_screen.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/main_screen.dart';
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

class Routers {
  static const dfNamed = Navigator.defaultRouteName;

  static const splash = '/splash';
  static const mainXela = '/mainXela';

  static const typography = '/typography';
  static const colors = '/colors';
  static const accordion = '/accordion';
  static const alert = '/alert';
  static const avatar = '/avatar';
  static const badge = '/badge';
  static const button = '/button';
  static const chart = '/chart';
  static const chcheckboxart = '/checkbox';
  static const chips = '/chips';
  static const datepicker = '/datepicker';
  static const dialog = '/dialog';
  static const divider = '/divider';
  static const numberInput = '/numberInput';
  static const rangeSliderInput = '/rangeSliderInput';
  static const radioButton = '/radioButton';
  static const segmentedControl = '/segmentedControl';
  static const sliderInput = '/sliderInput';
  static const steps = '/steps';
  static const tab = '/tab';
  static const textarea = '/textarea';
  static const textInput = '/textInput';
  static const toast = '/toast';
  static const toggle = '/toggle';
  static const tooltip = '/tooltip';

  static const main = '/main';
  static const mine3d = '/mine_3d';
  static const alertList = '/alert_list';
  static const progress = '/progress';
  static const showConstructionMap = '/show_construction_map';
  static const projectDetail = '/project_detail';
  static const notificationManagement = '/notification_management';
  static const closurePlanDetail = '/closure_plan_detail';
  static const closurePlanList = '/closure_plan_list';

  static const login = '/login';
  static const logout = '/logout';
  static const changePassword = '/change_password';
  static const confirmOtpChangePass = '/confirm_otp_change_pass';
  static const captchaScreen = '/captcha_screen';

  static const accountInfo = '/account_info';

  static const mineList = '/mine_list';
  static const mineDetail = '/mine_detail';
  static const drillHoleList = '/drill_hole_list';
  static const drillHoleDetail = '/drill_hole_detail';
  static const constructionDetail = '/construction_detail';
  static const geologicalReportList = '/geological_report_list';
  static const proposalPlanList = '/proposal_plan_list';
  static const resourceReserves = '/resource_reserves';
  static const mineAreaList = '/mining_area';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case mainXela:
        return MaterialPageRoute(builder: (_) => const MainScreenXela());
      case typography:
        return MaterialPageRoute(builder: (_) => const TypographyComponent());
      case colors:
        return MaterialPageRoute(builder: (_) => const ColorsComponent());
      case accordion:
        return MaterialPageRoute(builder: (_) => const AccordionComponent());
      case alert:
        return MaterialPageRoute(builder: (_) => const AlertComponent());
      case avatar:
        return MaterialPageRoute(builder: (_) => const UserAvatarComponent());
      case badge:
        return MaterialPageRoute(builder: (_) => const BadgeComponent());
      case button:
        return MaterialPageRoute(builder: (_) => const ButtonsComponent());
      case chart:
        return MaterialPageRoute(builder: (_) => const ChartsComponent());
      case chcheckboxart:
        return MaterialPageRoute(builder: (_) => const CheckboxComponent());
      case chips:
        return MaterialPageRoute(builder: (_) => const ChipsComponent());
      case datepicker:
        return MaterialPageRoute(builder: (_) => const DatePickerComponent());
      case dialog:
        return MaterialPageRoute(builder: (_) => const DialogsComponent());
      case divider:
        return MaterialPageRoute(builder: (_) => const DividerComponent());
      case numberInput:
        return MaterialPageRoute(builder: (_) => const NumberInputComponent());
      case rangeSliderInput:
        return MaterialPageRoute(
            builder: (_) => const RangeSliderInputComponent());
      case radioButton:
        return MaterialPageRoute(builder: (_) => const RadioButtonComponent());
      case segmentedControl:
        return MaterialPageRoute(
            builder: (_) => const SegmentedControlComponent());
      case sliderInput:
        return MaterialPageRoute(builder: (_) => const SliderInputComponent());
      case steps:
        return MaterialPageRoute(builder: (_) => const StepsComponent());
      case tab:
        return MaterialPageRoute(builder: (_) => const TabsComponent());
      case textarea:
        return MaterialPageRoute(builder: (_) => const TextareaComponent());
      case textInput:
        return MaterialPageRoute(builder: (_) => const TextInputComponent());
      case toast:
        return MaterialPageRoute(builder: (_) => const ToastComponent());
      case toggle:
        return MaterialPageRoute(builder: (_) => const ToggleComponent());
      case tooltip:
        return MaterialPageRoute(builder: (_) => const TooltipsComponent());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case logout:
        return MaterialPageRoute(builder: (_) => const ColorsComponent());
      case changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case confirmOtpChangePass:
        final email = _stringArg(args, 'email');
        return MaterialPageRoute(
          builder: (ctx) => ConfirmOtpChangePassScreen(email: email),
        );
      case captchaScreen:
        return MaterialPageRoute(
          builder: (ctx) => const CaptchaScreen(),
        );
      case accountInfo:
        return MaterialPageRoute(builder: (_) => const AccountInfoScreen());
      case mineList:
        return MaterialPageRoute(builder: (_) =>  MineRegionListScreen());
      case mineDetail:
        final siteId = _stringArg(args, 'areaId');
        return MaterialPageRoute(
            builder: (_) => MineSiteDetailScreen(areaId: siteId));
      case drillHoleList:
        final siteId = _stringArg(args, 'siteId');
        return MaterialPageRoute(
            builder: (_) => DrillHoleListScreen(siteId: siteId));
      case drillHoleDetail:
        final drillHoleId = _stringArg(args, 'drillHoleId');
        return MaterialPageRoute(
            builder: (_) => DrillHoleDetailScreen(drillHoleId: drillHoleId));
      case closurePlanList:
        final siteId = _stringArg(args, 'siteId');
        return MaterialPageRoute(
            builder: (_) => ClosurePlanListScreen(siteId: siteId));
      case closurePlanDetail:
        final planId = _stringArg(args, 'planId');
        return MaterialPageRoute(
            builder: (_) => ClosurePlanDetailScreen(planId: planId));
      case constructionDetail:
        return MaterialPageRoute(
            builder: (_) => const ConstructionDetailScreen());
      case geologicalReportList:
        return MaterialPageRoute(
            builder: (_) => const GeologicalReportListScreen());
      case proposalPlanList:
        return MaterialPageRoute(
            builder: (_) => ProposalPlanListScreen());
      case resourceReserves:
        return MaterialPageRoute(
            builder: (_) => const ResourceReservesScreen());
      case mine3d:
        return MaterialPageRoute(builder: (_) => const Mine3DScreen());
      case alertList:
        return MaterialPageRoute(builder: (_) => const AlertListScreen());
      case progress:
        return MaterialPageRoute(builder: (_) => const ProgressScreen());
      case showConstructionMap:
        return MaterialPageRoute(
            builder: (_) => const ShowConstructionMapScreen());
      case projectDetail:
        return MaterialPageRoute(builder: (_) => ProjectDetailScreen());
      case notificationManagement:
        return MaterialPageRoute(
            builder: (_) => NotificationManagementScreen());
      case mineAreaList:
        late MineRegionModel? region;
        if (args != null && args is MineRegionModel) {
          region = args;
        }
        return MaterialPageRoute(
          builder: (ctx) => MineAreaListScreen(
            region: region,
          ),
        );
    }
    return null;
  }

  static String _stringArg(Object? args, String key) {
    if (args is Map<String, dynamic>) {
      final value = args[key];
      if (value is String) {
        return value;
      }
    }
    if (args is Map) {
      final value = args[key];
      if (value is String) {
        return value;
      }
    }
    return '';
  }
}

class PageTransition<T> extends PageRouteBuilder<T> {
  final Widget child;
  final PageTransitionType type;
  final Duration duration;
  final Duration reverseDuration;
  final BuildContext? ctx;
  final bool inheritTheme;

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
          pageBuilder: (context, animation, secondaryAnimation) {
            return inheritTheme
                ? InheritedTheme.captureAll(ctx!, child)
                : child;
          },
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          settings: settings,
          maintainState: true,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (type) {
              case PageTransitionType.FADE:
                return FadeTransition(opacity: animation, child: child);
              case PageTransitionType.RIGHT_TO_LEFT:
                return SlideTransition(
                  position:
                      Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                          .animate(animation),
                  child: child,
                );
              case PageTransitionType.BOTTOM_TO_TOP:
                return SlideTransition(
                  position:
                      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                          .animate(animation),
                  child: child,
                );
              case PageTransitionType.RIGHT_TO_LEFT_WITH_FADE:
                return SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(1, 0), end: Offset.zero)
                          .animate(animation),
                      child: child,
                    ),
                  ),
                );
            }
          },
        );
}
