import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:viva_cupon_shopping/modals/product.dart';

Database? db;

class CuponController extends GetxController {
  Future<Database?> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cupon_database.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE cupon (id INTEGER , name TEXT, value INTEGER);');
    });

    return db!;
  }

  Future<int> insertData({
    required int id,
    required String name,
    required int value,
  }) async {
    db = await initDB();

    String query = "INSERT INTO cupon (id, name, value) VALUES(?, ?, ?);";

    List args = [id, name, value];

    return await db!.rawInsert(query, args);
  }

  Future<List<Map<String, Object?>>> fetchAllData() async {
    db = await initDB();

    String query = "SELECT * FROM cupon;";

    List<Map<String, Object?>> cuponList = await db!.rawQuery(query);
/*
    List<AnimalData> allAnimalList =
        animalList.map((e) => AnimalData.fromMap(e: e)).toList();*/

    return cuponList;
  }

  Future<int> deletingData({required int id}) async {
    db = await initDB();

    String query = "DELETE FROM cupon WHERE id= ?;";

    List args = [id];

    return await db!.rawDelete(query, args);
  }
}
