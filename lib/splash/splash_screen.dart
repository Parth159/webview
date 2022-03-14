import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/webview/webview.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  void movetonext() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const WebViewLoad());
    });
  }

  @override
  Widget build(BuildContext context) {
    movetonext();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gif/intro_splash.gif"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
