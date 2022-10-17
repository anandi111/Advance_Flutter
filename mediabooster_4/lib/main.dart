// 4. Create a User Authentication app which have functionalities like User
// Registration and User Login based on Shared Preference. Allow user login
// only if he/she once registered before login using your app. And add
// "Remember Me" checkbox at bottom of the LoginPage. If user checked it
// and logged in, and then if user completely remove your app from background
// and opens up app again in any future then you have to display WelcomePage
// for that user with his/her registered username. (As shown in attached
// image "registration_login_ui.jpg")

import 'package:flutter/material.dart';
import 'package:mediabooster_4/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isLogged = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();

  isLogged = prefs.getInt('isLogged');

  runApp(MaterialApp(home: SplashScreen()));
}
