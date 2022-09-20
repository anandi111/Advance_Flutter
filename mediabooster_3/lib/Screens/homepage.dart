import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mediabooster_3/Globals/globals.dart';
import 'package:mediabooster_3/Screens/sliderpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.opaqueSeparator,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Staggered MasonryView",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: MasonryGridView.count(
          itemCount: MainPicsList.length,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SliderPage(insideSliderIndex: index),
                    ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(MainPicsList[index]["Place Pic"]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(MainPicsList[index]["Place Name"])
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
