import 'dart:convert';
import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/models/globals.dart';
import 'package:db_miner/models/utils.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class LJHelper {
  LJHelper._();

  static final LJHelper ljHelper = LJHelper._();



  Future<List<QuotesModel>> fetchDataFromJsonBank() async {
    String? data;
    data = await rootBundle.loadString("assets/json_placeholder/quotes.json");

    List decoded = jsonDecode(data);

    List<QuotesModel> qutoe =
    decoded.map((e) => QuotesModel.fromMap(data: e)).toList();

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

      String query1 =
          "CREATE TABLE IF NOT EXISTS quotesTable(id INTEGER,name TEXT)";

      await db.execute(query1);
      String query =
          "CREATE TABLE IF NOT EXISTS quotes(id INTEGER,author TEXT NOT NULL, quote TEXT NOT NULL)";

      await db.execute(query);
    });
  }




  insertQuotes() async {
    await initDB();

    List<QuotesModel> data = await LJHelper.ljHelper.fetchDataFromJsonBank();

    for (int i = 0; i < data.length; i++) {

      String query = "INSERT INTO quotesTable(id,name) VALUES(?, ?);";
      List args1 = [
        data[i].id,
        data[i].name,
      ];

      await db?.rawInsert(query, args1);
    }
  }
  insertQuotesData() async {
    await initDB();

    List<QuotesModel> data = await LJHelper.ljHelper.fetchDataFromJsonBank();

    for(int i = 0; i<data.length;i++){
      for(int j = 0; j < data[i].quotes.length; j++){
        String queryList =
              "INSERT INTO quotes(id, quote, author) VALUES(?, ?, ?);";

        List args = [
          data[i].quotes[j].id,
          data[i].quotes[j].quote,
          data[i].quotes[j].author,
          ];

        await db?.rawInsert(queryList, args);
      }
    }
  }

  Future<List<DataBase_Model>> fetchAllRecords() async {
    await initDB();

    if(box.read('storageData') != true){
      await insertQuotes();
    }
    Storage storage = Storage();

    storage.trueMethodData();

    String query = "SELECT * FROM quotesTable";

    List<Map<String, dynamic>> allQuotes = (await db!.rawQuery(query));

    List<DataBase_Model> quotes = allQuotes
        .map((e) => DataBase_Model.fromMap(
              data: e,
            ))
        .toList();

    return quotes;
  }

  Future<List<DataBase>> fetchAllRecordsData({required int id}) async {
    await initDB();


    if(box.read('storage') != true){
      await insertQuotesData();
    }
    Storage storage = Storage();

    storage.trueMethod();

    String query = "SELECT * FROM quotes WHERE id = ?";
    List args = [id];
    // print(id);

    List<Map<String, dynamic>> allQuotes = (await db!.rawQuery(query,args));

    // print("start");
    List<DataBase> quotes = allQuotes.map((e) => DataBase.fromMap(data: e)).toList();
    // print("end");
    // print(quotes);
    // print('=========================');

    return quotes;
  }

  Future addNewFolderNameSave() async {
    String dbLocation = await getDatabasesPath();

    String path = join(dbLocation,"newFolderNameSave.db");

    db = await openDatabase(path,version: 2, onCreate: (db,_) async {
      String sql ="CREATE TABLE IF NOT EXISTS newFolderNameList(id INTEGER PRIMARY KEY,name TEXT NOT NULL)";

      await db.execute(sql);

    });
  }

  insertIntoNewFolderNameSave({required String name}) async {

    await addNewFolderNameSave();

    String sql = "INSERT INTO newFolderNameList(name)VALUES(?);";

    List args = [
      name,
    ];

    await db?.rawInsert(sql,args);
  }

  Future<List<NewFolderList_DataBase>?> fetchIntoNewFolderNameSave() async {
    await addNewFolderNameSave();

    String sql = "SELECT * FROM newFolderNameList";


    List<Map>? selected = await db?.rawQuery(sql);

    print("Start");
    print(selected);
    print("End");

    List<NewFolderList_DataBase>? newData= selected?.map((e) => NewFolderList_DataBase.fromMap(name: e)).toList();
    print("Start");
    print(newData);
    print("End");
    return newData;
  }

  Future<String?> addNewFolder({String? name}) async {
    String dbLocation = await getDatabasesPath();

    String path = join(dbLocation,"newFolder.db");

    db = await openDatabase(path,version: 1, onCreate: (db,_) async {
      String sql ="CREATE TABLE IF NOT EXISTS $name(id, INTEGER, name TEXT NOT NULL, author TEXT NOT NULL, quote TEXT NOT NULL)";

      await db.execute(sql);

    });
      return name;
  }

  insertIntoNewFolder({required String? tableName,required int id,required String name,required String author,required String quote,}) async {
   await addNewFolder();


    String sql = "INSERT INTO $tableName(id, name, author, quote)VALUES(?,?,?,?);";

    List args = [
      id,
      name,
      author,
      quote,
    ];

    await db?.rawInsert(sql,args);
  }

  Future<List<NewFolderData>?> fetchIntoNewFolder({required String? tableName}) async {
    await addNewFolder();
    String sql = "SELECT * FROM $tableName";
    List args = [tableName];


    List<Map>? selected = await db?.rawQuery(sql,args);

    List<NewFolderData>? newData= selected?.map((e) => NewFolderData.fromMap(data: e)).toList();

    return newData;
  }
}


class WIHelper{
  WIHelper._();

  static final WIHelper wiHelper = WIHelper._();

  Future<List<Image_Model>?> fetchAllImages({required String search}) async {
    print("Start");
    String apiKey = "38022194-f8abec777322f4050db0733cd";
    String url = "https://pixabay.com/api/?key=$apiKey&q=$search&image_type=photo&pretty=true";

    http.Response res = await http.get(Uri.parse(url));

    if(res.statusCode == 200){
      Map decodedData = jsonDecode(res.body);

      List allData = decodedData['hits'];

      List<Image_Model> allImages = allData.map((e) => Image_Model.fromMap(data: e)).toList();
      print("End");
      return allImages;
    }
  }
}

