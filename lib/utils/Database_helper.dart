import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_exam/Screen/model/model.dart';
import 'package:sqflite/sqflite.dart';

class DB_helper {
  static final DB_helper db_helper = DB_helper._();

  DB_helper._();

  Database? database;
  final String dbPath = "dbase.db";
  final String dbName = "datatable";

  Future<Database?> CheckDB() async {
    if (database != null) {
      return await database;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, dbPath);
    String Query =
        "CREATE TABLE $dbName ( id INTEGER PRIMARY KEY AUTOINCREMENT, flag TEXT ,name TEXT)";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(Query);
      },
    );
  }

  Future<void> insertDB({required Bookmark d1}) async {
    database = await CheckDB();
    database!.insert(dbName, {
      "name": d1.name,
      "flag": d1.image,
    });
  }

  Future<List<Map>> readDB()
  async {
    database = await CheckDB();
    String query = "SELECT * FROM $dbName ";
    List<Map> list = await database!.rawQuery(query);
    return list;
  }

  Future<void> deleteDB(int id)
  async {
    database = await CheckDB();
    database!.delete(dbName,where: "id=?",whereArgs: [id]);
  }

}
