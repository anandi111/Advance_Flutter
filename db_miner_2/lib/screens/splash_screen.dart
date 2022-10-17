import 'dart:math';
import 'dart:typed_data';

import 'package:db_miner_2/screens/aplanet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ByteData image;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>const AplanetScreen(),
            ),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/dashboard_${Random().nextInt(13)}.jpg"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "aplanet\n",
                          style: Theme.of(context).textTheme.headline3,
                          children: [
                            TextSpan(
                                text: "we love our planet.",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(color: Colors.grey)))
                          ]),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  "Ready to\nwatch?",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  width: 350,
                  child: Text(
                    "Aplanet isa global leader in reat life entertainment, serving a passionate audience of superfans around the world with content that inspires, informs and entertains.",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Start Enjoying",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .merge(TextStyle(color: Colors.grey)),
                    ),
                    Container(
                      height: 68,
                      width: 80,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                          ),
                          color: Colors.grey),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
/*image = await rootBundle.load(
      "assets/images/dashboard_1.jpg");

        Uint8List uint8List = image.buffer.asUint8List();

    print(uint8List);*/
