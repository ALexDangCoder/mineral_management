import 'package:bnv_opendata/config/resources/strings.dart';
import 'package:bnv_opendata/config/routes/app_routers.dart';
import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/data/di/module.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/domain/locals/prefs_service.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/presentation/splash/splash_screen.dart';
import 'package:bnv_opendata/resources/generated/l10n.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

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
      create: (context) =>
      AuthCubit(injector.get())..checkAuthenticationStatus(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            Get.offAll(() => const SplashScreen());
          }
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.app_name,
          theme: ThemeData(
            primaryColor: AppTheme.getInstance().primaryColor(),
            cardColor: Colors.white,
            textTheme: GoogleFonts.latoTextTheme(Theme
                .of(context)
                .textTheme),
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
          locale:
          Locale.fromSubtags(languageCode: PrefsService.getLanguage()),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.splash,
        ),
      ),
    );
  }
}
