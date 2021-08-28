import 'dart:async';
import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final _controllerDash = HomeModule.to.get<DashboardController>();

  final key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return IndexedStack(
          index: _controllerDash.position,
          children: [
            WebView(
              initialUrl:
                  'https://app.powerbi.com/view?r=eyJrIjoiNDMwZGQ1NGMtMzVmZC00NzJkLTk3YWQtNmFkNjRhNDZjMzI2IiwidCI6IjhmNzM4NGI2LTA3NzQtNGU2Ny1hYzBjLTdiMTI1NDA4MTNjNiJ9',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              key: key,
              onPageFinished: _controllerDash.loaded,
              onPageStarted: _controllerDash.loading,
              gestureNavigationEnabled: true,
            ),
            Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }),
    );
  }
}
