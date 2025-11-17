import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/presentation/auth/change_password/cubit/change_password_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/utils/popup_loading/popup_loading_utils.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ChangePasswordCubit(),
  child: AppScaffold(
      title: AppS.of(context).change_password,
      body: const _ChangePasswordListener(),
      bgColor: XelaColor.Gray12,
      appBarColor: XelaColor.Gray12,
    ),
);
  }
}

class _ChangePasswordListener extends StatelessWidget {
  const _ChangePasswordListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ChangingPassLoading) {
          PopupLoadingUtils.of(context).show();
        }
        if (state is ChangedPasswordSuccess) {
          PopupLoadingUtils.of(context).close();
          Navigator.of(context).pop();
        }
      },
      child: const _ChangePasswordBody(),
    );
  }
}

class _ChangePasswordBody extends StatelessWidget {
  const _ChangePasswordBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            XelaTextField(
              placeholder: AppS.of(context).old_pass,
              background: Colors.transparent,
              secureField: true,
            ),
            const SizedBox(height: 16),
            XelaTextField(
              placeholder: AppS.of(context).new_pass,
              background: Colors.transparent,
              secureField: true,
            ),
            const SizedBox(height: 16),
            XelaTextField(
              placeholder: AppS.of(context).confirm_pass,
              background: Colors.transparent,
              secureField: true,
            ),
            const SizedBox(height: 16),
            XelaButton(
              onPressed: () async {
                final validation = await context
                    .read<ChangePasswordCubit>()
                    .validateInput(
                        current: 'current',
                        newPass: 'newPass',
                        confirmPass: 'confirmPass');
                if (validation) {
                  if (context.mounted) {
                    await context
                        .read<AuthCubit>()
                        .changePassword(current: 'current', newPass: 'newPass');
                  }
                }
              },
              text: AppS.of(context).save_change,
              background: AppTheme.getInstance().dfBtnColor(),
            ),
          ],
        ),
      ),
    );
  }
}
