import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/domain/models/xela_textfield_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/presentation/screen_exports.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/utils/extensions/string_extensions.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AccountInfoListener();
  }
}

class _AccountInfoListener extends StatelessWidget {
  const _AccountInfoListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false,
          );
        }
      },
      child: const _AccountInfoBody(),
    );
  }
}

class _AccountInfoBody extends StatelessWidget {
  const _AccountInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            ColoredBox(
              color: Colors.transparent,
              child: XelaUserAvatar(
                initials: "AB",
                background: XelaColor.Orange9,
                foreground: XelaColor.Orange3,
                size: XelaUserAvatarSize.LARGE,
                style: XelaUserAvatarStyle.CIRCLE,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Cán bộ kỹ thuật',
              style: XelaTextStyle.XelaHeadline.apply(
                color: XelaColor.Gray2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Canbokythuat@gmail.com',
              style: XelaTextStyle.XelaBody.apply(
                color: XelaColor.Gray2,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XelaTextField(
                    placeholder: AppS.of(context).name,
                    background: Colors.transparent,
                    state: XelaTextFieldState.DISABLED,
                    value: 'Nguyen Van A',
                  ),
                  const SizedBox(height: 16),
                  XelaTextField(
                    placeholder: AppS.of(context).position,
                    background: Colors.transparent,
                    state: XelaTextFieldState.DISABLED,
                    value: 'Cán bộ ký thuật hiện trường',
                  ),
                  const SizedBox(height: 16),
                  XelaTextField(
                    placeholder: AppS.of(context).phone_number,
                    background: Colors.transparent,
                    state: XelaTextFieldState.DISABLED,
                    value: '0961190498'.formatPhoneNumber,
                  ),
                  const SizedBox(height: 16),
                  XelaButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen(),
                        ),
                      );
                    },
                    text: AppS.of(context).change_password,
                    background: AppTheme.getInstance().dfBtnColor(),
                  ),
                  const SizedBox(height: 16),
                  XelaButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    text: AppS.of(context).logout,
                    background: AppTheme.getInstance().errorColor(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
