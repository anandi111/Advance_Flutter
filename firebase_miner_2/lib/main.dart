import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_miner_2/screens/home_page.dart';
import 'package:firebase_miner_2/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final String? name = prefs.getString('name');
  final int? counter = prefs.getInt('counter');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: (counter == null) ? SplashScreen() : NoteHomePage(name: name!),
  ));
}
