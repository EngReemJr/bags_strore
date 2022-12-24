import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


import '../admin/models/cart_product.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();

  final String tableName = "cart";
  final String idColumnName = "id";
  final String nameColumnName = "name";
  
  final String priceColumnName = "price";
 
  final String imageUrlColumnName = "imageUrl";
  final String sizeColumnName = "size";
final String countColumnName = "count";

  initDatabase() async {
    database = await createDatabaseConnection();
  }

  Future<Database> createDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;
    return openDatabase('$folderPath/cart.db', version: 1,
        onCreate: (db, version) {
      db.execute('''CREATE TABLE $tableName (
            $idColumnName TEXT, 
            $nameColumnName TEXT, 
            $priceColumnName TEXT,
            $imageUrlColumnName TEXT,
            $sizeColumnName TEXT,
            $countColumnName INTEGER
            )''');
    });
  }

  Future<int> insertNewCartProduct(CartProduct product) async {
    int i = await database.insert(tableName, product.toMap());
    return i;
  }

  Future<List<CartProduct>> getAllCart() async {
    List<Map<String, dynamic>> data = await database.query(tableName);
    return data.map((e) => CartProduct.fromMap(e)).toList();
  }

  Future<int> deleteCartProduct(CartProduct product) async {
    int count = await database
        .delete(tableName, where: 'id=?', whereArgs: [product.id]);
    return count;
  }

  
}