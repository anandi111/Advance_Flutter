import 'dart:math';

import 'package:animator_2/resorces/reso.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class GalaxyPage extends StatefulWidget {
  const GalaxyPage({Key? key}) : super(key: key);

  @override
  State<GalaxyPage> createState() => _GalaxyPageState();
}

class _GalaxyPageState extends State<GalaxyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final animation =
      Tween(begin: 0, end: 2 * pi).animate(animationController);

  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          title: const Text("Galaxy")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: Reso.planetInfoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              child: Container(
                height: 200,
                width: 350,
                // color: Colors.red,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 200,
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    planetName: Reso.planetInfoList[index]
                                        ["name"],
                                    imagePath: Reso.planetInfoList[index]
                                        ["imagePath"],
                                  ),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 70, right: 15),
                            child: Container(
                              height: 180,
                              width: 270,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Reso.planetInfoList[index]["name"],
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "Milkyway Galaxy",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey),
                                  ),
                                  Container(
                                    height: 4,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Icon(
                                        Icons.pin_drop_rounded,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "54.6m km",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_circle_sharp,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "11.5m/s2",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: animation.value.toDouble(),
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          Reso.planetInfoList[index]
                                              ["imagePath"]))),
                              // child: Image.asset(
                              //     Reso.planetInfoList[index]["imagePath"]),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
