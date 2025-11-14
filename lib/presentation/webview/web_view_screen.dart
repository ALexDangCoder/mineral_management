import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:bnv_opendata/data/exception/app_exception.dart';
import 'package:bnv_opendata/domain/locals/logger.dart';
import 'package:bnv_opendata/resources/generated/l10n.dart';
import 'package:bnv_opendata/utils/app_bar.dart';
import 'package:bnv_opendata/utils/constants/image_asset.dart';
import 'package:bnv_opendata/utils/get_ext.dart';
import 'package:bnv_opendata/widgets/views/state_layout.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const WebViewScreen({required this.url, required this.title, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewScreenState();
  }
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  StateLayout _stateLayout = StateLayout.showLoading;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            logger.d('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            showLoading();
          },
          onPageFinished: (String url) {
            hideLoading();
          },
          onWebResourceError: (WebResourceError error) {
            logger.e('WebView error: $error');
            showError();
          },
          onNavigationRequest: (NavigationRequest request) {
            // nếu bạn muốn chặn hoặc xử lý điều hướng gì đó:
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNormal(
        title: widget.title,
        leading: ImageAssets.svgAssets(ImageAssets.icBack),
        context: context,
      ),
      body: StateFullLayout(
        stateLayout: _stateLayout,
        retry: () {
          reload();
        },
        error: AppException('', S.current.something_went_wrong),
        textEmpty: '',
        child: WillPopScope(
          onWillPop: () async {
            await backToPreScreen();
            return true;
          },
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }

  void showLoading() {
    if (_stateLayout != StateLayout.showLoading) {
      setState(() {
        _stateLayout = StateLayout.showLoading;
      });
    }
  }

  void hideLoading() {
    if (_stateLayout == StateLayout.showLoading) {
      setState(() {
        _stateLayout = StateLayout.showContent;
      });
    }
  }

  void showError() {
    setState(() {
      _stateLayout = StateLayout.showError;
    });
  }

  Future<void> reload() async {
    await _controller.loadRequest(Uri.parse(widget.url));
  }

  Future<void> backToPreScreen() async => finish();
}
