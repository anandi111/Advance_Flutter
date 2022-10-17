import 'package:db_miner_2/models/animal_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? db;

class DBHelper {
  ///intialize private named constructor
  DBHelper._();

  ///Create an Object with reference of private constructer
  static final DBHelper dbHelper = DBHelper._();

  ///TODO:initDB()
  Future<Database?> initDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'animal_database.db');

    // open the database
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE animal (id INTEGER , name TEXT, photoString TEXT, scientificName TEXT, prey TEXT, location TEXT, weight TEXT, height TEXT,lifespan TEXT,length TEXT,skinType TEXT,topSpeed TEXT,nameOfYoung TEXT,biggestThreat TEXT);');
    });

    return db!;
  }

  ///TODO:insertData()
  Future<int> insertData(
      {required int id,
      required AnimalData animalData,
      required String photoString}) async {
    db = await initDB();

    String query =
        "INSERT INTO animal (id, name, photoString, scientificName, prey, location, weight, height, lifespan, length, skinType, topSpeed, nameOfYoung, biggestThreat) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    List args = [
      id,
      animalData.name,
      photoString,
      animalData.scientificName,
      animalData.prey,
      animalData.location,
      animalData.weight,
      animalData.height,
      animalData.lifespan,
      animalData.length,
      animalData.skinType,
      animalData.topSpeed,
      animalData.nameOfYoung,
      animalData.biggestThreat
    ];

    return await db!.rawInsert(query, args);
  }

  ///TODO:updateData()

  ///TODO:fetchAllData()
  Future<List<Map<String, Object?>>> fetchAllData() async {
    db = await initDB();

    String query = "SELECT * FROM animal;";

    List<Map<String, Object?>> animalList = await db!.rawQuery(query);
/*
    List<AnimalData> allAnimalList =
        animalList.map((e) => AnimalData.fromMap(e: e)).toList();*/

    return animalList;
  }

  ///TODO:fetchSingleData()
  Future<List<Map<String, Object?>>> fetchSingleData({required int id}) async {
    db = await initDB();

    String query = "SELECT * From animal where id = $id";

    return await db!.rawQuery(query);
  }

  ///TODO:fetchSearchData()
  Future<List<Map<String, Object?>>> fetchSearchData(
      {required String name}) async {
    db = await initDB();

    String query = "SELECT * From animal where name LIKE '%$name%';";

    return await db!.rawQuery(query);
  }

  ///TODO:deleteData()

  ///TODO:deleteAllData()
  Future<int> deleteAllData() async {
    db = await initDB();

    String query = "DELETE FROM animal;";

    return await db!.rawDelete(query);
  }
}
