import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'webview/webview.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void removeSplash() {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    removeSplash();
    return GetMaterialApp(
      title: 'PAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewLoad(),
    );
  }
}
