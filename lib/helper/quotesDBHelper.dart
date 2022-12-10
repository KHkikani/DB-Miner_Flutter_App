
import 'package:life_quotes/model/quotesModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class QuotesDBHelper {
  QuotesDBHelper._();

  static final QuotesDBHelper quotesDBHelper = QuotesDBHelper._();

  static Database? db;

  Future<void> initDB() async {
    var directoryPath = await getDatabasesPath();

    String path = join(directoryPath, 'quotes.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int version) async {
        String query =
            "CREATE TABLE IF NOT EXISTS allQuotes(id INTEGER PRIMARY KEY AUTOINCREMENT , quote TEXT , author TEXT , tags TEXT , length INTEGER)";
        String query1 =
            "CREATE TABLE IF NOT EXISTS author(id INTEGER PRIMARY KEY AUTOINCREMENT , author TEXT)";
        String query2 =
            "CREATE TABLE IF NOT EXISTS tags(id INTEGER PRIMARY KEY AUTOINCREMENT , tags TEXT)";

        await database.execute(query);
        await database.execute(query1);
        await database.execute(query2);
      },
    );
  }

  Future<int?> insertRecord({required Quotes data}) async {
    // await intDB();

    // String tag = data.tags.join(" ");

    String query =
        "INSERT INTO allQuotes(quote , author , tags , length) VALUES (? , ? , ? , ?)";
    List args = [data.quote, data.author, data.tags.join(" "), data.length];

    return db!.rawInsert(query, args);
  }

  Future<int?> insert(
      {required String tableName,
      required String colName,
      required String data}) async {
    await initDB();

    String query = "INSERT INTO $tableName($colName) VALUES (?)";
    List args = [data];

    return db!.rawInsert(query, args);
  }

  Future<List<Map<String, dynamic>>?> fetch(
      {required String tableName, required String colName}) async {
    await initDB();

    String query = "SELECT $colName FROM $tableName";

    return db!.rawQuery(query);
  }

  Future<List<Quotes>> fetchDisplaySliderQuotes(
      {required String length}) async {
    await initDB();

    // String query = "SELECT * FROM allQuotes";
    String query = "SELECT * FROM allQuotes WHERE length <= $length";

    // print(query);
    // print(db==null);
    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    // print(allQuotes);
    // print("not call");
    return allQuotes.map((e) => Quotes.fromDB(data: e)).toList();
  }

  Future<List<Quotes>> searchQuotes({required String search}) async {
    await initDB();

    // String query = "SELECT * FROM allQuotes";
    String query =
        "SELECT * FROM allQuotes WHERE tags LIKE '%$search%' OR author LIKE '%$search%' ";

    // print(query);
    // print(db==null);
    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    // print(allQuotes);
    // print("not call");
    return allQuotes.map((e) => Quotes.fromDB(data: e)).toList();
  }
}
