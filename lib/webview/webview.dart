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
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: WebView(
        onPageFinished: (value) {
          onPageLoaded();
        },
        zoomEnabled: false,
        initialUrl: "http://www.bbcsinfo.com/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  Widget animatedSplash() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          height: Get.height,
          width: Get.width,
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            crossFadeState: showWidget.value,
            firstChild: animatedSplash(),
            secondChild: SafeArea(child: webView()),
          ),
        ),
      ),
    );
  }
}
