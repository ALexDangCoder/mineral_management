import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final Color? bgColor;
  final Color? appBarColor;

  const AppScaffold({
    super.key,
    this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = true,
    this.bgColor,
    this.appBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: bgColor ?? XelaColor.Gray12,
        appBar: title != null
            ? AppBar(
                title: Text(
                  title!,
                  style: XelaTextStyle.xelaSubheadline.apply(
                    color: XelaColor.Gray2,
                    fontWeightDelta: 2,
                  ),
                ),
                centerTitle: true,
                automaticallyImplyLeading: showBackButton,
                actions: actions,
                backgroundColor: appBarColor ?? Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              )
            : null,
        floatingActionButton: floatingActionButton,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: body,
          ),
        ),
      ),
    );
  }
}
