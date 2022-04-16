import 'package:laporan_penjualan/system/db/db_connect.dart';
import 'package:sqflite/sqflite.dart';

class DataRepo{
  late DatabaseConnection _dbConnect;

  dbRepo(){
    _dbConnect = DatabaseConnection();
  }

  static late Database _database;

  Future<Database> get database async{
    if(_database!=null) return _database;
    _database = await _dbConnect.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }
}