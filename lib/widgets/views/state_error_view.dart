import 'package:bnv_opendata/resources/generated/l10n.dart';
import 'package:bnv_opendata/utils/style_utils.dart';
import 'package:bnv_opendata/widgets/app_button.dart';
import 'package:flutter/material.dart';

class StateErrorView extends StatelessWidget {
  final String? _message;
  final Function() _retry;

  const StateErrorView(this._message, this._retry, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _message ?? S.of(context).something_went_wrong,
            style: textStyle(),
          ),
          spaceH15,
          AppButton(
            S.of(context).retry,
            _retry,
            borderRadius: 8,
            width: 90,
          ),
        ],
      ),
    );
  }
}
