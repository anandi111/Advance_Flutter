import 'package:firebase_miner_3/screens/home_page.dart';
import 'package:firebase_miner_3/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isSigned;
  getData() async {
    final prefs = await SharedPreferences.getInstance();
    isSigned = await prefs.getBool('isSigned');
  }

  void initState() {
    super.initState();
    getData();

    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  (isSigned == true) ? const HomePage() : const SignInScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.purple.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 10)
              ]),
          child: Image.asset(
            "assets/18925f011b3b075a897049a3ee62f2c4-removebg-preview.png",
            color: Colors.purple,
            height: 200,
            width: 200,
          ),
        )),
      ),
    );
  }
}
