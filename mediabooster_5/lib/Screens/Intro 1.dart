import 'package:flutter/material.dart';
import 'package:mediabooster_5/Screens/HomePage.dart';
import 'package:mediabooster_5/Screens/Intro%202.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntroTwo(),
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
                        image: AssetImage("Images/sent_bg.jpg"))),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  const Text(
                    "Tips & Tricks",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "To help you keep your plant\n healty and happy.",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("Images/monstera.png"))),
                  )
                ],
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        },
        child: const Text("Skip"),
      ),
    );
  }
}
