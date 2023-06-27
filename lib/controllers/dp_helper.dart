import 'dart:convert';
import 'package:db_miner/models/globals.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LJHelper {
  LJHelper._();

  static final LJHelper ljHelper = LJHelper._();
  //
  // Future<List<Quote>> fetchDataFromJsonBankList() async {
  //   String? data;
  //   List<Quote> qutoe = [];
  //   data = await rootBundle.loadString("assets/json_placeholder/quotes.json");
  //
  //   List decoded = jsonDecode(data!);
  //
  //   for (int i = 0; i < decoded.length; i++) {
  //     List quotes = decoded[i]['quotes'];
  //
  //     qutoe = quotes.map((e) => Quote.fromMap(data: e)).toList();
  //   }
  //   return qutoe;
  // }

  Future<List<QuotesModel>> fetchDataFromJsonBank() async {
    String? data;
    List<QuotesModel> qutoe = [];

    data = await rootBundle.loadString("assets/json_placeholder/quotes.json");

    List decoded = jsonDecode(data);

    List quotes = decoded;

    for (int i = 0; i < quotes.length; i++) {
      List quotes = decoded[i]['quotes'];

      qutoe = quotes.map((e) => QuotesModel.fromMap(data: e)).toList();
    }

    return qutoe;
  }
}

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  static Database? db;

  Future initDB() async {
    String dbLocation = await getDatabasesPath();

    String path = join(dbLocation, "quotes.db");

    db = await openDatabase(path, version: 1, onCreate: (db, _) async {
      // String query =
      //     "CREATE TABLE IF NOT EXISTS quotes(id INTEGER NOT NULL,quote TEXT NOT NULL,author TEXT NOT NULL)";

      String query1 =
          "CREATE TABLE IF NOT EXISTS quotesTable(id INTEGER,name TEXT)";

      // await db.execute(query);
      await db.execute(query1);
    });
  }

  insertQuotes() async {
    await initDB();

    // List<Quote> data = await LJHelper.ljHelper.fetchDataFromJsonBankList();
    List<QuotesModel> data1 = await LJHelper.ljHelper.fetchDataFromJsonBank();

    for (int i = 0; i < data1.length; i++) {
      // String queryList =
      //     "INSERT INTO quotes(id, quote, author) VALUES(?, ?, ?);";
      // List args = [
      //   data[i].id,
      //   data[i].quote,
      //   data[i].author,
      // ];

      String query = "INSERT INTO quotesTable(id,name) VALUES(?, ?);";
      List args1 = [
        data1[i].id,
        data1[i].name,
      ];

      // await db?.rawInsert(queryList, args);
      await db?.rawInsert(query, args1);
    }
  }

  Future<List<DataBase_Model>> fetchAllRecords() async {
    await initDB();

    await insertQuotes();

    String query = "SELECT * FROM quotesTable";

    List<Map<String, dynamic>> allQuotes = (await db!.rawQuery(query));

    List<DataBase_Model> quotes = allQuotes
        .map((e) => DataBase_Model.fromMap(
              data: e,
            ))
        .toList();

    print(quotes);

    return quotes;
  }
}
