import 'dart:math';

import 'package:db_miner_1/screens/quote_separate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';

class QuoteEditingPage extends StatefulWidget {
  QuoteEditingPage({Key? key, required this.quote, required this.image})
      : super(key: key);
  String quote;
  Widget image;

  @override
  State<QuoteEditingPage> createState() => _QuoteEditingPageState();
}

class _QuoteEditingPageState extends State<QuoteEditingPage> {
  late Image image0;
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;
  late Image image5;
  late Image image6;
  late Image image7;
  late Image image8;
  late Image image9;
  Widget? BG;

  @override
  void initState() {
    super.initState();

    BG = widget.image;

    image0 = Image.asset(
      "asset/image0.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image1 = Image.asset(
      "asset/image1.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image2 = Image.asset(
      "asset/image2.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image3 = Image.asset(
      "asset/image3.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image4 = Image.asset(
      "asset/image4.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image5 = Image.asset(
      "asset/image5.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image6 = Image.asset(
      "asset/image6.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image7 = Image.asset(
      "asset/image7.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image8 = Image.asset(
      "asset/image8.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    image9 = Image.asset(
      "asset/image9.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image0.image, context);
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    precacheImage(image5.image, context);
    precacheImage(image6.image, context);
    precacheImage(image7.image, context);
    precacheImage(image8.image, context);
    precacheImage(image9.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 55,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        title: const Text(
          "Edit",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Material(
              color: Colors.black,
              child: Opacity(opacity: 0.5, child: BG),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.quote,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white)),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.35),
                      offset: const Offset(0, 5),
                      spreadRadius: 3,
                      blurRadius: 8)
                ]),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            List.generate(
                                10,
                                (index) => BG =
                                    BGProvider(number: Random().nextInt(10)));
                          });
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.photo,
                            color: Colors.orange,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.text_fields_sharp,
                            color: Colors.lightGreen,
                            size: 34,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          await FlutterClipboard.copy(widget.quote)
                              .then((value) => print('copied'));

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Quote copied.."),
                            backgroundColor: Colors.greenAccent,
                          ));
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.file_copy,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuoteSepPage(
                                    quote: widget.quote, image: widget.image),
                              ));
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.share,
                            color: Colors.red,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          /* final result =
                                                    await ImageGallerySaver
                                                        .saveImage(_imageFile);
                                                print("File Saved to Gallery");*/

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuoteSepPage(
                                    quote: widget.quote, image: widget.image),
                              ));
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.download_rounded,
                            color: Colors.green,
                            size: 38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget BGProvider({required int number}) {
    if (number == 0) {
      return image0;
    } else if (number == 1) {
      return image1;
    } else if (number == 2) {
      return image2;
    } else if (number == 3) {
      return image3;
    } else if (number == 4) {
      return image4;
    } else if (number == 5) {
      return image5;
    } else if (number == 6) {
      return image6;
    } else if (number == 7) {
      return image7;
    } else if (number == 8) {
      return image8;
    }
    return image9;
  }
}
