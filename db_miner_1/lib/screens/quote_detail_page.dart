import 'dart:async';
import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:db_miner_1/helpers/like_db_helper.dart';
import 'package:db_miner_1/helpers/quote_api_helper.dart';
import 'package:db_miner_1/screens/quote_editing_page.dart';
import 'package:db_miner_1/screens/quote_like_page.dart';
import 'package:db_miner_1/screens/quote_separate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quote_data.dart';

class CateQuoteScreen extends StatefulWidget {
  CateQuoteScreen({Key? key, required this.category}) : super(key: key);
  String category;
  @override
  State<CateQuoteScreen> createState() => _CateQuoteScreenState();
}

class _CateQuoteScreenState extends State<CateQuoteScreen> {
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

  int randomNum = Random().nextInt(8);

  @override
  void initState() {
    super.initState();

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
        title: Text(
          widget.category,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LikeQuoteScreen()));
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
          slivers: List.generate(
        20,
        (i) => SliverList(
          delegate: SliverChildListDelegate([
            FutureBuilder(
                future: QuoteAPIHelper.quoteAPIHelper
                    .fetchingUserData(name: "happiness"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    List<QuoteData>? data = snapshot.data as List<QuoteData>?;
                    return ListView.builder(
                      physics: const ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 400,
                            height: 445,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.35),
                                      offset: const Offset(0, 5),
                                      spreadRadius: 3,
                                      blurRadius: 8)
                                ]),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuoteEditingPage(
                                                          quote:
                                                              data[index].quote,
                                                          image: BGProvider(
                                                              number: index)),
                                                ));
                                          },
                                          child: Material(
                                            color: Colors.black,
                                            child: Opacity(
                                                opacity: 0.5,
                                                child:
                                                    BGProvider(number: index)),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        data[index].quote,
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
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        QuoteEditingPage(
                                                            quote: data[index]
                                                                .quote,
                                                            image: BGProvider(
                                                                number: index)),
                                                  ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
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
                                            onTap: () async {
                                              await FlutterClipboard.copy(
                                                      data[index].quote)
                                                  .then((value) =>
                                                      print('copied'));

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text("Quote copied.."),
                                                backgroundColor:
                                                    Colors.greenAccent,
                                              ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
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
                                                    builder: (context) =>
                                                        QuoteSepPage(
                                                            quote: data[index]
                                                                .quote,
                                                            image: BGProvider(
                                                                number: index)),
                                                  ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
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
                                                    builder: (context) =>
                                                        QuoteSepPage(
                                                            quote: data[index]
                                                                .quote,
                                                            image: BGProvider(
                                                                number: index)),
                                                  ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
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
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              LikeDBHelper.likeDBHelper
                                                  .insertData(
                                                      quote: data[index].quote,
                                                      BGImage: index);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Added into Like.."),
                                                backgroundColor:
                                                    Colors.greenAccent,
                                              ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
                                            child: Container(
                                              height: 60,
                                              child: const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 33,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (i == 19) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container();
                })
          ]),
        ),
      )),
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
