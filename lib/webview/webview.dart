import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoad extends StatelessWidget {
  const WebViewLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: "http://13.59.197.11/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
