import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailAnimalScreen extends StatefulWidget {
  DetailAnimalScreen(
      {Key? key,
      required this.name,
      required this.photoString,
      required this.data})
      : super(key: key);
  String name;
  String photoString;
  List<Map<String, Object?>> data;

  @override
  State<DetailAnimalScreen> createState() => _DetailAnimalScreenState();
}

class _DetailAnimalScreenState extends State<DetailAnimalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffc19e82),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.photoString))),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "aplanet\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .merge(TextStyle(color: Colors.white)),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .merge(TextStyle(fontSize: 30)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffecd1b3)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                            text: "Name :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["name"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Scientific Name :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["scientificName"]
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Prey :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["prey"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Weight :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["weight"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Height :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["height"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Lifespan :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["lifespan"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Length :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["length"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Skintype :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["skinType"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Topspeed :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["topSpeed"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Location :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["location"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Name of Young :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text:
                                      widget.data[0]["nameOfYoung"].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                        Text.rich(TextSpan(
                            text: "Biggest Threat :  ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color(0xffc19e82),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            children: [
                              TextSpan(
                                  text: widget.data[0]["biggestThreat"]
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
