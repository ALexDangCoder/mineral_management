import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/main.dart';
import 'package:bnv_opendata/presentation/auth/confirm_otp/cubit/confirm_otp_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/utils/popup_loading/popup_loading_utils.dart';
import 'package:bnv_opendata/utils/snackbar_helper.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class ConfirmOtpChangePassScreen extends StatelessWidget {
  final String email;

  const ConfirmOtpChangePassScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmOtpCubit(
        email: email,
        authRepository: injector.get(),
      )..requestOtp(),
      child: AppScaffold(
        title: AppS.of(context).confirm_code,
        body: _ConfirmOTPListener(email: email),
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
      ),
    );
  }
}

class _ConfirmOTPListener extends StatelessWidget {
  final String email;

  const _ConfirmOTPListener({required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmOtpCubit, ConfirmOtpState>(
      listenWhen: (previous, current) =>
          previous.eventState != current.eventState,
      listener: (context, state) {
        if (state.eventState is LoadingState) {
          PopupLoadingUtils.of(context).show();
        } else {
          PopupLoadingUtils.of(context).close();

          if (state.eventState is ErrorState) {
            final msg = (state.eventState! as ErrorState).data as String?;
            if (msg != null && msg.isNotEmpty) {
              SnackBarHelper.showError(context, message: msg);
            }
          } else if (state.eventState is ConfirmCodeSuccess) {
            showDialog(
              context: navigatorKey.currentContext!,
              barrierDismissible: false,
              builder: (_) => AlertDialog(
                title: const Text(
                  'Thông báo',
                ),
                content: const Text(
                  'Vui lòng đăng nhập với mật khẩu mới được gửi tới email của'
                  ' bạn',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            ).then((value) {
              if (value == true && context.mounted) {
                Navigator.pop(context);
              }
            });
          }
        }
      },
      child: _ConfirmOTPBody(email: email),
    );
  }
}

class _ConfirmOTPBody extends StatefulWidget {
  final String email;

  const _ConfirmOTPBody({required this.email});

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
            widget.email,
            style: XelaTextStyle.xelaBodyBold.apply(
              color: XelaColor.Gray2,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Pinput(
            length: 6,
            controller: _otpController,
            defaultPinTheme: PinTheme(
              width: 55,
              height: 55,
              textStyle: XelaTextStyle.xelaButtonMedium,
              decoration: BoxDecoration(
                color: XelaColor.Gray12,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (string) {
              context.read<ConfirmOtpCubit>().onChangeOtp(otpCode: string);
            },
            onCompleted: (pin) {
              context.read<ConfirmOtpCubit>().confirmOtp();
              // if (success && context.mounted) {
              //   await Navigator.pushReplacementNamed(
              //     context,
              //     Routers.changePassword,
              //   );
              // }
            },
          ),
          const SizedBox(height: 28),
          BlocBuilder<ConfirmOtpCubit, ConfirmOtpState>(
            builder: (ctx, state) {
              return XelaButton(
                onPressed: () {
                  context.read<ConfirmOtpCubit>().confirmOtp();
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
          ),
        ],
      ),
    );
  }
}
