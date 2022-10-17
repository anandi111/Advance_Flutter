import 'package:flutter/material.dart';
import 'package:mediabooster_5/Screens/HomePage.dart';


class IntroThree extends StatefulWidget {
  const IntroThree({Key? key}) : super(key: key);

  @override
  State<IntroThree> createState() => _IntroThreeState();
}

class _IntroThreeState extends State<IntroThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
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
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("Images/tall_monstera.png"))),
              ),
              SizedBox(
                width: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const[
                    Spacer(),
                    Text(
                      "Connect With\nOther\nPlant Lover",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Join a community\nand learn & fun together.",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
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
