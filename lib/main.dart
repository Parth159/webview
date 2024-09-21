import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'webview/webview.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Color(0xff004084), // status bar color
    ),
  );
  await Permission.camera.request();
  await Permission.microphone.request();
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
      title: 'FleetSoft',
      home: WebViewLoad(),
    );
  }
}
