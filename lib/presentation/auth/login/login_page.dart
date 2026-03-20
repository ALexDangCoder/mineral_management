import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/core/enums/auth_status_enum.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/presentation/auth/login/cubit/login_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';
import 'package:bnv_opendata/presentation/screen_exports.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/assets.gen.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/utils/popup_loading/popup_loading_utils.dart';
import 'package:bnv_opendata/utils/snackbar_helper.dart';
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
      create: (context) => LoginCubit(
        injector.get(),
        injector.get(),
      )..preLogin(),
      child: const AppScaffold(
        bgColor: Colors.white,
        body: _LoginPageListener(),
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
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            state.eventState is LoadingState
                ? PopupLoadingUtils.of(context).show()
                : PopupLoadingUtils.of(context).close();
            if (state.eventState is ErrorState) {
              final errorMsg =
                  (state.eventState! as ErrorState).data as String?;
              SnackBarHelper.showError(
                context,
                message: errorMsg?.isNotEmpty == true
                    ? errorMsg!
                    : 'Đăng nhập thất bại, vui lòng thử lại',
              );
            }
            if (state.eventState is LoadedState) {
              final user = (state.eventState! as LoadedState).data;
              context.read<AuthCubit>().setAuthStatus(
                    authStatus: AuthStatusEnum.authenticated,
                    // user: user,
                  );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            }
          },
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
  void initState() {
    context.read<LoginCubit>().changePassword(
        '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225');
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if(context.mounted) {
        final state = context.read<LoginCubit>().state;
          _usernameController.text = state.username ?? '';
          _passController.text = state.password ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Assets.images.logoVinacomin.image(width: 60, height: 60),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    'Vinacomin\nCông ty cổ phần địa chất và khoáng sản',
                    style: XelaTextStyle.xelaSmallBodyBold
                        .apply(color: Colors.blue),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              AppS.of(context).login,
              style: XelaTextStyle.xelaHeadlineNormal.apply(
                color: XelaColor.Gray2,
              ),
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
            background: AppTheme.getInstance().lightBgColor(),
            textEditingController: _usernameController,
            onChange: (string) {
              context.read<LoginCubit>().changeUsername(string);
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return XelaTextField(
                placeholder: AppS.of(context).password,
                secureField: !state.isShowPass,
                // rightIcon: Icon(
                //   Icons.remove_red_eye_outlined,
                //   size: 20,
                //   color: AppTheme.getInstance().primaryColor(),
                // ),
                rightIcon: InkWell(
                  onTap: () {
                    context.read<LoginCubit>().toggleShowPass();
                  },
                  child: Icon(
                    state.isShowPass
                        ? Icons.visibility_off
                        : Icons.remove_red_eye_outlined,
                    color: AppTheme.getInstance().primaryColor(),
                    size: 20,
                  ),
                ),
                background: AppTheme.getInstance().lightBgColor(),
                textEditingController: _passController,
                onChange: (string) {
                  context.read<LoginCubit>().changePassword(string);
                },
              );
            },
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              _showEmailInputDialog();
            },
            child: Text(
              AppS.of(context).forgot_password,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return XelaButton(
                onPressed: () async {
                  await context.read<LoginCubit>().login(
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
        ],
      ),
    );
  }

  void _showEmailInputDialog() {
    String email = '';
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Nhập Email'),
          content: TextField(
            onChanged: (val) => email = val,
            decoration: const InputDecoration(
              hintText: 'Nhập địa chỉ email của bạn',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                final currentEmail = email.trim();
                if (currentEmail.isNotEmpty) {
                  PopupLoadingUtils.of(context).show();
                  final errorMsg =
                      await context.read<LoginCubit>().sendCode(currentEmail);

                  if (context.mounted) {
                    PopupLoadingUtils.of(context).close();
                    if (errorMsg == null) {
                      Navigator.pop(ctx);
                      Navigator.pushNamed(
                        context,
                        Routers.confirmOtpChangePass,
                        arguments: {'email': currentEmail},
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(errorMsg)),
                      );
                    }
                  }
                }
              },
              child: const Text('Tiếp tục'),
            ),
          ],
        );
      },
    );
  }
}
