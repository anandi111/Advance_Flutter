import 'package:flutter/material.dart';
import 'package:mediabooster_5/Screens/HomePage.dart';
import 'package:mediabooster_5/Screens/intro%203.dart';

class IntroTwo extends StatefulWidget {
  const IntroTwo({Key? key}) : super(key: key);

  @override
  State<IntroTwo> createState() => _IntroTwoState();
}

class _IntroTwoState extends State<IntroTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntroThree(),
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
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("Images/plant_hanging.png"))),
                  ),
                  const Spacer(),
                  const Text(
                    "Explore & Find Your Seeds",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Explore & find the seeds that you want to faster\n from our 10,000+ selection.",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 200,
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
