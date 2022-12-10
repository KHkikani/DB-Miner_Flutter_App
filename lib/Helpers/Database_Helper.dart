import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/animalModel.dart';


class DBHelper{
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  String dbName = "animalBio.db";
  String tableName = "animal_data";
  String colId = "id";
  String colName = "name";
  String colDescription = "description";
  String colPhotoURL = "image";
  String colType = "type";

  Database? db;

  Future<void> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    db = await openDatabase(
        path,
        version: 1,
        onCreate:(Database db, int version) async {
          String sqlQuery = "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDescription TEXT, $colPhotoURL TEXT, $colType TEXT);";
          await db.execute(sqlQuery);
        }
    );
  }

  Future<int> insertData({required Animal data}) async {
       await initDB();
      String query = "INSERT INTO $tableName($colName,$colDescription,$colPhotoURL,$colType)VALUES(?,?,?,?);";
      List args = [data.name,data.description,data.image,data.type];
      print(query);
       int res =  await db!.rawInsert(query,args);
       print(res);
       return res;

  }

  Future<List<Animal>> fetchData({required String type}) async {
    await initDB();
    String sqlQuery = "SELECT * FROM $tableName WHERE $colType='$type';";
    List<Map<String,dynamic>> dbData = await db!.rawQuery(sqlQuery);
    print(dbData);
    return dbData.map((e) => Animal.fromMap(e)).toList();
  }
}