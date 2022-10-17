import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_miner_3/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            )),
            headline3: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 22,
              color: Colors.black,
            )),
            headline4: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
            caption: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 15, color: Colors.white)))),
    home: const SplashScreen(),
  ));
}
