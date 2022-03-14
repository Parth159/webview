import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoad extends StatelessWidget {
  final showWidget = CrossFadeState.showFirst.obs;
  WebViewLoad({Key? key}) : super(key: key);

  void onPageLoaded() {
    showWidget.value = CrossFadeState.showSecond;
  }

  Widget webView() {
    return WebView(
      onPageFinished: (value) {
        onPageLoaded();
      },
      initialUrl: "http://13.59.197.11/",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  Widget animatedSplash() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/gif/intro_splash.gif"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            crossFadeState: showWidget.value,
            firstChild: animatedSplash(),
            secondChild: webView(),
          ),
        ),
      ),
    );
  }
}
