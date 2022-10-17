import 'package:flutter/material.dart';

class videoModal {
  String name = "";
  String content = "";
  String Resource = "";
  videoModal(
      {required this.name, required this.content, required this.Resource});
}

List<videoModal> videoList = [
  videoModal(
      name: "Jungle Book",
      content: "bare necessities song scene the jungle book 2",
      Resource: "assest/bare-necessities-song-scene-the-jungle-book-2.mp4"),
  videoModal(
      name: "The Maya Bee",
      content: "maya the bee 2012 theme song",
      Resource: "assest/maya-the-bee-2012-theme-song.mp4"),
  videoModal(
      name: "Container widget",
      content: "container flutter widget of the week",
      Resource: "assest/container-flutter-widget-of-the-week.mp4"),
  videoModal(
      name: "Theme widget",
      content: "theme flutter hallowidget of the week",
      Resource: "assest/theme-flutter-hallowidget-of-the-week.mp4"),
  videoModal(
      name: "Education",
      content: "true defination of education by an old man",
      Resource: "assest/true-defination-of-education-by-an-old-man-💯_.mp4"),
  videoModal(
      name: "Kalam Sir",
      content: "apj abdul kalam s success mantra for all the student",
      Resource: "assest/apj-abdul-kalam-s-success-mantra-for-all-the-stu.mp4"),
];
