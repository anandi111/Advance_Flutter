import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicDetail {
  String songName = "";
  String songArtist = "";
  String musicPath = "";
  String musicPosture = "";
  Color conColor = Colors.lightGreen;
  MusicDetail(
      {required this.songName,
      required this.songArtist,
      required this.musicPath,
      required this.musicPosture,
      required this.conColor});
}

List<MusicDetail> musicList = [
  MusicDetail(
      songName: "Paisa Yeh Paisa",
      songArtist: "Dev Negi, Subhro J",
      musicPath: "Assests/Paisa Yeh Paisa - Songs.pk - 320Kbps.mp3",
      musicPosture: "Assests/Image/paish_paisha.jpg",
      conColor: Colors.lightGreenAccent),
  MusicDetail(
      songName: "Dil Meri Na Sune",
      songArtist: "Atif Ashalam",
      musicPath: "Assests/02 Dil Meri Na Sune - Genius.mp3",
      musicPosture: "Assests/Image/Dil-Meri-Na-Sune.jpg",
      conColor: Colors.blue),
  MusicDetail(
      songName: "Tera Fitoor",
      songArtist: "Arijit Singh",
      musicPath: "Assests/01 Tera Fitoor - Genius.mp3",
      musicPosture: "Assests/Image/tera_fitoor.jpg",
      conColor: Colors.orange),
  MusicDetail(
      songName: "Ghoomar",
      songArtist: "Shreya Ghosal",
      musicPath: "Assests/Ghoomar - DJMaza.Fun - 320Kbps.mp3",
      musicPosture: "Assests/Image/ghoomar.jpg",
      conColor: Colors.purple),
  MusicDetail(
      songName: "Khairiyat",
      songArtist: "Arijit Singh",
      musicPath: "Assests/Khairiyat (Happy) - Songs.pk - 320Kbps.mp3",
      musicPosture: "Assests/Image/Chhichhore.jpg",
      conColor: Colors.lightGreenAccent),
  MusicDetail(
      songName: "Photo",
      songArtist: "Karan Sehmbi",
      musicPath: "Assests/Photo - Songs.pk - 320Kbps.mp3",
      musicPosture: "Assests/Image/posture_lagvado.jpg",
      conColor: Colors.indigo),
  MusicDetail(
      songName: "Poster Lagwa Do",
      songArtist: "Mika Singh",
      musicPath: "Assests/Poster Lagwa Do - Songs.pk - 320Kbps.mp3",
      musicPosture: "Assests/Image/posture_lagvado.jpg",
      conColor: Colors.lime),
  MusicDetail(
      songName: "Woh Din",
      songArtist: "Arijit Singh",
      musicPath:
          "Assests/Woh Din (Arijit Singh Version) - Songs.pk - 320Kbps.mp3",
      musicPosture: "Assests/Image/Chhichhore.jpg",
      conColor: Colors.blue),
];
