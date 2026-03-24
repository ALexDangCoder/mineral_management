import 'dart:convert';
import 'dart:typed_data';

import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/auth/widgets/captcha_widget/captcha_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaptchaWidget extends StatelessWidget {
  const CaptchaWidget({super.key, this.width = 120, this.height = 60});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaptchaCubit(
        injector.get(),
      )..loadCaptcha(),
      child: Container(
        alignment: Alignment.center,
        child: _CaptchaContent(
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class _CaptchaContent extends StatelessWidget {
  const _CaptchaContent({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: BlocBuilder<CaptchaCubit, CaptchaState>(
            builder: (context, state) {
              if (state is CaptchaLoaded) {
                return buildImageFromBase64(state.imageBase64 ?? '');
              }
              if (state is CaptchaError) {
                return const Text('Lỗi tải Captcha' ?? '');
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        BlocBuilder<CaptchaCubit, CaptchaState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: IconButton(
                  onPressed: () {
                    if (state is CaptchaLoading) {
                      return;
                    }
                    context.read<CaptchaCubit>().loadCaptcha();
                  },
                  icon: Icon(
                    Icons.refresh_outlined,
                    color: state is CaptchaLoading
                        ? AppTheme.getInstance().disableColor()
                        : AppTheme.getInstance().primaryColor(),
                  ),),
            );
          },
        )
      ],
    );
  }

  Uint8List base64ToBytes(String base64String) {
    return base64Decode(base64String);
  }

  Widget buildImageFromBase64(String base64String) {
    final bytes = base64Decode(base64String);
    return Image.memory(
      bytes,
      fit: BoxFit.cover,
    );
  }
}
