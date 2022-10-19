import 'package:db_miner_2/helpers/DbHelper.dart';
import 'package:db_miner_2/helpers/animal_api_helper.dart';
import 'package:db_miner_2/models/animal_data.dart';
import 'package:db_miner_2/resources/reso.dart';
import 'package:db_miner_2/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  int i = 0;
  final prefs = await SharedPreferences.getInstance();
  bool? isStart = prefs.getBool('isStart');

  if (isStart == null) {
    for (i = 0; i < ResoAnimal.resoAnimal.animalList.length; i++) {
      AnimalData? animalData = await AnimalAPIHelper.animalAPIHelper
          .fetchingUserData(name: ResoAnimal.resoAnimal.animalList[i]["name"]);

      // print(animalData?.name);

      DBHelper.dbHelper.insertData(
          id: i,
          animalData: animalData as AnimalData,
          photoString: ResoAnimal.resoAnimal.animalList[i]["string"]);

      ResoAnimal.resoAnimal.data = await DBHelper.dbHelper.fetchAllData();

      print(ResoAnimal.resoAnimal.data.length);
      print(ResoAnimal.resoAnimal.data[0]["name"]);
    }
    await prefs.setBool('isStart', true);
  }

  runApp(MaterialApp(
    theme: ThemeData(
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            )),
            headline3: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
            headline4: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
            caption: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 15, color: Colors.white)))),
    debugShowCheckedModeBanner: false,
    home: const SplashScreen(),
  ));
}
