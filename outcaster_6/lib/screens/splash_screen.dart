import 'package:flutter/material.dart';
import 'package:outcaster_6/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 100),
              Column(
                children: const [
                  Text.rich(
                    TextSpan(
                        text: "Flutter\n",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: "Devs",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          const LinearProgressIndicator(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
