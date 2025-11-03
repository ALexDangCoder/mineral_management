import 'dart:developer';

import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class PopupLoadingUtils {
  static bool isShowing = false;
  BuildContext context;

  PopupLoadingUtils.of(this.context);

  Future<void> show({bool canDismiss = false, Widget? subWidget}) async {
    if (isShowing) return;
    isShowing = true;
    try {
      await showDialog(
        barrierDismissible: canDismiss,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => canDismiss,
            child: _LoadingHub(subWidget: subWidget),
          );
        },
      );
    } catch (e) {
      log('ERROR: ${e.toString()}');
    }
    isShowing = false;
  }

  void close() {
    if (isShowing) {
      isShowing = false;
      Navigator.of(context).pop();
    }
  }
}

class _LoadingHub extends StatelessWidget {
  final Widget? subWidget;

  const _LoadingHub({this.subWidget, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 35, height: 35, child: CircularProgressIndicator(
            color: AppTheme.getInstance().primaryColor(),
          )),
          if (subWidget != null) subWidget!,
        ],
      ),
    );
  }
}
