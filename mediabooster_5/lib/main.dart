// 5. Create an app which illustrates one time splash screen (Intro Screen) with skip functionality

import 'package:flutter/material.dart';
import 'package:mediabooster_5/Screens/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? counter = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();

  counter = prefs.getInt('counter');

  await prefs.setInt('counter', 1);

  runApp(const MaterialApp(
    home: SplashScreen(),
  ));
}
