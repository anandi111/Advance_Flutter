import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_miner_2/modals/todos_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CloudFirebaseStorage {
  CloudFirebaseStorage._();
  static final CloudFirebaseStorage cloudFirebaseStorage =
      CloudFirebaseStorage._();

  static final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<String> getNameFromSharedPrefernce() async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');

    return name!;
  }

  //TODO: insertData
  insertData(
      {required String nameParent,
      required String nameChild,
      required String title,
      required String content}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    await ref.child("/$nameParent/$nameChild").set({
      "title": "$title",
      "content": "$content",
    });
  }

  //TODO: selectData
  selectData({required String nameParent}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    DataSnapshot? snapshot = await ref.child("anandi/hello/title").get();

    print(snapshot.value);
  }
}
