import 'package:flutter/material.dart';
import 'package:mediabooster_5/Screens/HomePage.dart';
import 'package:mediabooster_5/Screens/Intro%201.dart';
import 'package:mediabooster_5/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  logicIntro() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 1);
  }

  @override
  void initState() {
    super.initState();
    logicIntro();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => (counter == 0 || counter == null)
                ? const IntroOne()
                : const HomePage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntroOne(),
                ));
          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("Images/leaf BG.jpg"))),
              ),
              const Center(
                child: Text(
                  "Plantology!!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45),
                ),
              )
            ],
          )),
    );
  }
}
