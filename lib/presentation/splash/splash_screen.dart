import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/core/enums/auth_status_enum.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _autoDirection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AppScaffold(
          body: Center(
            child: Image.asset(
              'assets/icons/team.png',
              width: 52,
              height: 52,
            ),
          ),
        );
      },
    );
  }

  void _autoDirection() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        final authenticated =
            context.read<AuthCubit>().state.authStatus;
        if (authenticated == AuthStatusEnum.authenticated) {
          Navigator.pushReplacementNamed(
            context,
            Routers.main,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            Routers.login,
          );
        }
      }
    });
  }
}
