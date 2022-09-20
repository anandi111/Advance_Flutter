///1. Create an app which represents all Educational websites such as Wikipedia, W3Schools,
///JavatPoint and TutorialsPoint in such a manner that a User Experience a better approach
///to access all site's functionality flawlessly.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'screens/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(MaterialApp(
    home: HomePage(),
  ));
}
