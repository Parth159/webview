import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoad extends StatelessWidget {
  final showWidget = CrossFadeState.showFirst.obs;
  WebViewLoad({Key? key}) : super(key: key);
  late final WebViewController webViewController;

  Widget webView() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: WebViewWidget(controller: webViewController),
    );
  }

  Widget animatedSplash() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  void initController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            showWidget.value = CrossFadeState.showSecond;
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://mobile.fleetsoft.com/')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://mobile.fleetsoft.com/'));
  }

  Future<void> permissionRequest() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    initController();

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
