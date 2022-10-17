import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LocatorHome(),
  ));
}

class LocatorHome extends StatefulWidget {
  const LocatorHome({Key? key}) : super(key: key);

  @override
  State<LocatorHome> createState() => _LocatorHomeState();
}

class _LocatorHomeState extends State<LocatorHome> {
  TextEditingController latLogController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  double latitude = 0;
  double longitude = 0;
  String area = "surat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///header box..
            Container(
              height: 150,
              width: 250,
              decoration: const BoxDecoration(
                  color: Color(0xff3155ed),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(250),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "  Location Finder",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),

            ///main ui..
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffeaecec),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                        topRight: Radius.circular(150),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )),
                ),
                Container(
                  height: 540,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffdcdce2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                        topRight: Radius.circular(150),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )),
                ),
                Container(
                  height: 480,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xff091a38),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                        topRight: Radius.circular(150),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Enter Latitude, Longitude",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextField(
                              controller: latLogController,
                              onSubmitted: (val) async {
                                setState(() {
                                  latitude = double.parse(latLogController.text
                                      .toString()
                                      .split(",")[0]);
                                  longitude = double.parse(latLogController.text
                                      .toString()
                                      .split(",")[1]);
                                });
                                List<Placemark> placemarks =
                                    await placemarkFromCoordinates(
                                        latitude, longitude);

                                print(placemarks[0]);

                                areaController.text =
                                    "${placemarks[0].name}, ${placemarks[0].street}, ${placemarks[0].country} || Postcode: ${placemarks[0].postalCode}";

                                setState(() {});
                              },
                              style: TextStyle(
                                  color: CupertinoColors.systemGrey2
                                      .withOpacity(0.7)),
                              decoration: InputDecoration(
                                fillColor: Color(0xff202e4e),
                                filled: true,
                                border: InputBorder.none,
                                hintText: "Enter lat and log",
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Enter Area",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextField(
                              controller: areaController,
                              onSubmitted: (val) async {
                                setState(() {
                                  area = areaController.text;
                                });

                                List<Location> locations =
                                    await locationFromAddress(area);

                                print(locations[0]);

                                latLogController.text =
                                    "${locations[0].latitude}, ${locations[0].longitude}";
                              },
                              style: TextStyle(
                                  color: CupertinoColors.systemGrey2
                                      .withOpacity(0.7)),
                              decoration: InputDecoration(
                                fillColor: Color(0xff202e4e),
                                filled: true,
                                border: InputBorder.none,
                                hintText: "Enter area",
                              )),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff3155ed),
                              ),
                              child: const Center(
                                  child: Text(
                                "Go",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
