import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediabooster_1/Globals/Globals.dart';
import 'package:mediabooster_1/Music_Page/Screens/Music_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        appBar: AppBar(
          title: const Text("RAINBOW MUSIC"),
          backgroundColor: CupertinoColors.darkBackgroundGray,
        ),
        body: ListView.builder(
          itemCount: musicList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPage(
                      songName: musicList[index].songName,
                      songArtist: musicList[index].songArtist,
                      musicPath: musicList[index].musicPath,
                      musicPosture: musicList[index].musicPosture,
                    ),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: musicList[index].conColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(musicList[index]
                                      .musicPosture
                                      .toString()))),
                        ),
                        Text.rich(TextSpan(
                            text: "${musicList[index].songName}\n\n",
                            style: const TextStyle(
                                wordSpacing: 2,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                  text: musicList[index].songArtist,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))
                            ])),
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
