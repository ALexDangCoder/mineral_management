import 'dart:developer';

import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/presentation/auth/login/cubit/login_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/presentation/screen_exports.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/utils/popup_loading/popup_loading_utils.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: AppScaffold(
        bgColor: AppTheme.getInstance().primaryColor(),
        body: const _LoginPageListener(),
      ),
    );
  }
}

class _LoginPageListener extends StatelessWidget {
  const _LoginPageListener();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              PopupLoadingUtils.of(context).show();
            } else if (state is Authenticated) {
              PopupLoadingUtils.of(context).close();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            }
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {},
        ),
      ],
      child: const _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  const _LoginPageBody();

  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Text(
                AppS.of(context).mineral_management.toUpperCase(),
                style: XelaTextStyle.xelaHeadline.apply(color: XelaColor.Gray2),
              ),
              const SizedBox(height: 8),
              Text(
                AppS.of(context).login_to_use,
                style: XelaTextStyle.xelaBody.apply(
                  color: XelaColor.Gray2,
                ),
              ),
              const SizedBox(height: 24),
              XelaTextField(
                placeholder: AppS.of(context).username,
                rightIcon: Icon(
                  Icons.account_circle,
                  size: 20,
                  color: AppTheme.getInstance().primaryColor(),
                ),
                background: Colors.transparent,
                textEditingController: _usernameController,
                onChange: (string) {
                  context.read<LoginCubit>().changeUsername(string);
                },
              ),
              const SizedBox(height: 24),
              XelaTextField(
                placeholder: AppS.of(context).password,
                secureField: true,
                rightIcon: const Icon(
                  Icons.password,
                  size: 20,
                  color: XelaColor.Gray2,
                ),
                background: Colors.transparent,
                textEditingController: _passController,
                onChange: (string) {
                  context.read<LoginCubit>().changePassword(string);
                },
              ),
              const SizedBox(height: 28),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return XelaButton(
                    onPressed: () async {
                      await context.read<AuthCubit>().login(
                            username: state.username!,
                            password: state.password!,
                          );
                    },
                    autoResize: false,
                    text: AppS.of(context).login,
                    rightIcon: const Icon(
                      Icons.arrow_forward,
                      size: 15,
                      color: Colors.white,
                    ),
                    background: state.loginBtnIsEnable
                        ? AppTheme.getInstance().dfBtnColor()
                        : AppTheme.getInstance().disableColor(),
                    state: state.loginBtnIsEnable
                        ? XelaButtonState.DEFAULT
                        : XelaButtonState.DISABLED,
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routers.changePassword,
                  );
                },
                child: Text(AppS.of(context).forgot_password),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
