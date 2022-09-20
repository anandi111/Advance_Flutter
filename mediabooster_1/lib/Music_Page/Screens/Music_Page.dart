import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  MusicPage(
      {Key? key,
      required this.songName,
      required this.songArtist,
      required this.musicPath,
      required this.musicPosture})
      : super(key: key);
  String songName = "";
  String songArtist = "";
  String musicPath = "";
  String musicPosture = "";

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPause = true;
  Duration? currentDuration;
  Duration? totalDuration;

  loadSong() async {
    await assetsAudioPlayer.open(
      Audio(widget.musicPath),
    );

    setState(() {
      totalDuration = assetsAudioPlayer.current.value!.audio.duration;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSong();
    currentDuration = const Duration(seconds: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        title: const Text("Now Playing"),
        backgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.musicPosture),
                fit: BoxFit.cover,
                opacity: 0.2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.musicPosture.toString()),
                ),
              ),
            ),
            Text(
              widget.songName,
              style: const TextStyle(
                  wordSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              widget.songArtist,
              style: const TextStyle(
                  wordSpacing: 2,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    assetsAudioPlayer.stop();
                    setState(() {
                      isPause = false;
                    });
                  },
                  child: const Icon(
                    Icons.stop,
                    color: Colors.white,
                  ),
                ),
                (isPause == false)
                    ? InkWell(
                        onTap: () {
                          assetsAudioPlayer.open(
                            Audio(widget.musicPath),
                          );
                          setState(() {
                            isPause = true;
                            currentDuration =
                                assetsAudioPlayer.currentPosition.value;
                            totalDuration =
                                assetsAudioPlayer.current.value!.audio.duration;
                          });
                        },
                        child: const Icon(
                          Icons.play_arrow,
                          size: 100,
                          color: Colors.white,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            isPause = false;
                          });
                          assetsAudioPlayer.pause();
                        },
                        child: const Icon(
                          Icons.pause,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.headphones,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            StreamBuilder(
              stream: assetsAudioPlayer.currentPosition,
              builder: (context, AsyncSnapshot snapshot) {
                currentDuration = snapshot.data;

                return Column(
                  children: [
                    Slider(
                        activeColor: Colors.lightGreen,
                        thumbColor: Colors.lightGreen,
                        inactiveColor: Colors.grey,
                        min: 0,
                        max: totalDuration!.inSeconds.toDouble(),
                        value: currentDuration!.inSeconds.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            currentDuration = Duration(seconds: val.toInt());
                            assetsAudioPlayer
                                .seek(Duration(seconds: val.toInt()));
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${currentDuration.toString().split(".")[0]}/${totalDuration.toString().split(".")[0]}",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }
}
