/// 2. Create a Simple Web-Browser which have all fundamental functionalities like back
/// button, forward button, reload button, search bar, cancel button(while reloading),
/// progress bar and bookmark manager.

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirrorwall_2/Screens/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
