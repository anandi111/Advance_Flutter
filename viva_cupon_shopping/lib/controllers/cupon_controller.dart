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
          'CREATE TABLE cupon (id String , name TEXT, value INTEGER, quantity INTEGER);');
    });

    return db!;
  }

  Future<int> insertData(
      {required String id,
      required String name,
      required int value,
      required int quantity}) async {
    db = await initDB();

    String query =
        "INSERT INTO cupon (id, name, value, quantity) VALUES(?, ?, ?, ?);";

    List args = [id, name, value, quantity];

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

  Future<int> updateData({required int quantity, required String name}) async {
    db = await initDB();

    String query = "UPDATE cupon SET quantity = $quantity WHERE name= ?;";

    List args = [name];

    return await db!.rawUpdate(query, args);
  }

  Future<int> deletingData({required String id}) async {
    db = await initDB();

    String query = "DELETE FROM cupon WHERE id= ?;";

    List args = [id];

    return await db!.rawDelete(query, args);
  }
}
