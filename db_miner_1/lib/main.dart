import 'package:db_miner_1/helpers/image_api_helper.dart';
import 'package:db_miner_1/helpers/image_db_helper.dart';
import 'package:db_miner_1/screens/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ImageDatabaseHelper.imageDatabaseHelper.deleteAllData();

  ImageDatabaseHelper.imageDatabaseHelper
      .insertData(allImages: await ImageAPIHelper.imageAPIHelper.fetchImages());

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
