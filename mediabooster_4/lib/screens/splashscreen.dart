import 'package:flutter/material.dart';
import 'package:mediabooster_4/main.dart';
import 'package:mediabooster_4/screens/homepage.dart';
import 'package:mediabooster_4/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  loginState() async {
    final prefs = await SharedPreferences.getInstance();

    isLogged = prefs.getInt('isLogged');
  }

  @override
  void initState() {
    super.initState();
    loginState();
    Future.delayed(const Duration(seconds: 3), () {
      isLogged == null || isLogged == 0
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ))
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.indigo,
          Colors.blue,
        ])),
        child: const Center(
            child: Text(
          "Welcome To \n      Flutter",
          style: TextStyle(
              color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
