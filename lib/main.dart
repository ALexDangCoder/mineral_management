import 'package:bnv_opendata/config/resources/strings.dart';
import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/core/enums/auth_status_enum.dart';
import 'package:bnv_opendata/data/di/module.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/domain/locals/prefs_service.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/resources/generated/l10n.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> mainApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await PrefsService.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
  );
  configureDependencies();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final token = PrefsService.getToken();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        injector.get(),
        injector.get(),
        injector.get(),
      )..checkAuthStatus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: Strings.app_name,
        theme: ThemeData(
          primaryColor: AppTheme.getInstance().primaryColor(),
          cardColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          dividerColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppTheme.getInstance().primaryColor(),
            selectionColor: AppTheme.getInstance().primaryColor(),
            selectionHandleColor: AppTheme.getInstance().primaryColor(),
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppTheme.getInstance().accentColor()),
        ),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          AppS.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale.fromSubtags(languageCode: PrefsService.getLanguage()),
        onGenerateRoute: Routers.generateRoute,
        initialRoute: Routers.splash,
        builder: (context, widget) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.authStatus == AuthStatusEnum.unauthenticated && state
                  .isDidCheckAuth == true) {
                // Get.offAll(() => const SplashScreen());
                Get.offAllNamed(Routers.splash);
              }

              if (state.authStatus == AuthStatusEnum.sessionExpired) {
                showDialog(
                  context: navigatorKey.currentContext!,
                  builder: (_) => AlertDialog(
                    title: Text(
                      AppS.of(context).session_expired,
                    ),
                    content: Text(
                      AppS.of(context).please_to_login,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().resetSessionExpired();
                          context.read<AuthCubit>().logout();
                        },
                        child: const Text('OK'),
                      )
                    ],
                  ),
                );
              }
            },
            child: widget!,
          );
        },
      ),
    );
  }
}
