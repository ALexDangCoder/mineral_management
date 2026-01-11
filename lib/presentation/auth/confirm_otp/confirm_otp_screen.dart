import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/presentation/auth/confirm_otp/cubit/confirm_otp_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOtpChangePassScreen extends StatelessWidget {
  const ConfirmOtpChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmOtpCubit()..requestOtp(),
      child: AppScaffold(
        title: AppS.of(context).confirm_code,
        body: const _ConfirmOTPListener(),
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
      ),
    );
  }
}

class _ConfirmOTPListener extends StatelessWidget {
  const _ConfirmOTPListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmOtpCubit, ConfirmOtpState>(
      listener: (context, state) {
        // if (state is ChangingPassLoading) {
        //   PopupLoadingUtils.of(context).show();
        // }
        // if (state is ChangedPasswordSuccess) {
        //   PopupLoadingUtils.of(context).close();
        //   Navigator.of(context).pop();
        // }
      },
      child: const _ConfirmOTPBody(),
    );
  }
}

class _ConfirmOTPBody extends StatefulWidget {
  const _ConfirmOTPBody({super.key});

  @override
  State<_ConfirmOTPBody> createState() => _ConfirmOTPBodyState();
}

class _ConfirmOTPBodyState extends State<_ConfirmOTPBody> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppS.of(context).confirm_code_sent_to,
            style: XelaTextStyle.xelaBody.apply(
              color: XelaColor.Gray2,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            AppS.of(context).confirm_code_sent_to,
            style: XelaTextStyle.xelaBodyBold.apply(
              color: XelaColor.Gray2,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          XelaTextField(
            placeholder: AppS.of(context).input_confirm_code,
            rightIcon: Icon(
              Icons.confirmation_num_outlined,
              size: 20,
              color: AppTheme.getInstance().primaryColor(),
            ),
            background: Colors.transparent,
            textEditingController: _otpController,
            onChange: (string) {
              context.read<ConfirmOtpCubit>().onChangeOtp(otpCode: string);
            },
          ),
          const SizedBox(height: 28),
          BlocBuilder<ConfirmOtpCubit, ConfirmOtpState>(
            builder: (ctx, state) {
              return XelaButton(
                onPressed: () async {
                  await context.read<ConfirmOtpCubit>().confirmOtp();

                  if (context.mounted) {
                    await Navigator.pushReplacementNamed(
                      context,
                      Routers.changePassword,
                    );
                  }
                },
                autoResize: false,
                text: AppS.of(context).confirm,
                background: state.confirmBtnIsEnable
                    ? AppTheme.getInstance().dfBtnColor()
                    : AppTheme.getInstance().disableColor(),
                state: state.confirmBtnIsEnable
                    ? XelaButtonState.DEFAULT
                    : XelaButtonState.DISABLED,
              );
            },
          ),
          const SizedBox(height: 28),
          BlocBuilder<ConfirmOtpCubit, ConfirmOtpState>(
            builder: (context, state) {
              return RichText(
                maxLines: 3,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: XelaTextStyle.xelaSmallBody.apply(
                    color: XelaColor.Gray2,
                  ),
                  children: [
                    TextSpan(
                      text: AppS.of(context).not_received_code,
                    ),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          context.read<ConfirmOtpCubit>().requestOtp();
                        },
                        child: Text(
                          ' ${AppS.of(context).resend}',
                          style: state.canResend
                              ? XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: AppTheme.getInstance().primaryColor(),
                                )
                              : XelaTextStyle.xelaSmallBody.apply(
                                  color: XelaColor.Gray2,
                                ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: state.canResend ? '' : ' (sau ${state.second}s)',
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
