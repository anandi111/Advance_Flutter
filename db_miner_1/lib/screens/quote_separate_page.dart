import 'dart:typed_data';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:clipboard/clipboard.dart';

class QuoteSepPage extends StatefulWidget {
  QuoteSepPage({Key? key, required this.quote, required this.image})
      : super(key: key);
  String quote;
  Widget image;

  @override
  State<QuoteSepPage> createState() => _QuoteSepPageState();
}

class _QuoteSepPageState extends State<QuoteSepPage> {
  late Uint8List _imageFile;
  ScreenshotController screenshotController = ScreenshotController();

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
          "Save and Share",
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Screenshot(
            controller: screenshotController,
            child: Container(
              height: 385,
              width: 400,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  widget.image,
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
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    await screenshotController
                        .capture()
                        .then((Uint8List? image) {
                      //Capture Done
                      setState(() {
                        _imageFile = image!;
                      });
                    }).catchError((onError) {
                      print(onError);
                    });

                    final result =
                        await ImageGallerySaver.saveImage(_imageFile);

                    print(result);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Image is sucessfully saved in gallery.."),
                      backgroundColor: Colors.greenAccent,
                    ));
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.download_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () async {
                    await screenshotController
                        .capture()
                        .then((Uint8List? image) {
                      //Capture Done
                      setState(() {
                        _imageFile = image!;
                      });
                    }).catchError((onError) {
                      print(onError);
                    });

                    await Share.file(
                        'esys image', 'esys.png', _imageFile, 'image/png',
                        text: 'More on Anandi_Quote_App');
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
