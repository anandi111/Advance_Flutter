import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? db;

class LikeDBHelper {
  ///intialize private named constructor
  LikeDBHelper._();

  ///Create an Object with reference of private constructer
  static final LikeDBHelper likeDBHelper = LikeDBHelper._();

  ///TODO:initDB()
  Future<Database?> initDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'qoute_database.db');

    // open the database
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE quote (quote TEXT, BGNum int);');
    });

    return db!;
  }

  ///TODO:insertData()
  Future<int> insertData({required String quote, required int BGImage}) async {
    db = await initDB();

    String query = "INSERT INTO quote (quote, BGNum) VALUES(?, ?);";

    List args = [quote, BGImage];

    return await db!.rawInsert(query, args);
  }

  ///TODO:updateData()

  ///TODO:fetchAllData()
  Future<List<Map<String, Object?>>> fetchAllData() async {
    db = await initDB();

    String query = "SELECT * FROM quote;";

    List<Map<String, Object?>> quoteList = await db!.rawQuery(query);

    return quoteList;
  }

  /* ///TODO:fetchSingleData()
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
  }*/

  ///TODO:deleteData()

  ///TODO:deleteAllData()
  Future<int> deleteAllData() async {
    db = await initDB();

    String query = "DELETE FROM animal;";

    return await db!.rawDelete(query);
  }
}
