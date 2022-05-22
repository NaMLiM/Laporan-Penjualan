import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'data_handler.dart';

class DatabaseHandler {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'LaporanPenjualan_sqlite');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
    return database;
  }

  _onCreateDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE report(id INTEGER PRIMARY KEY, date TEXT, nominal INTEGER, status TEXT)");
  }

  Future<int> insertData(List<DataHandler> data) async {
    int result = 0;
    final Database db = await setDatabase();
    for (var data in data) {
      result = await db.insert('report', data.toMap());
    }
    return result;
  }

  Future<List<DataHandler>> retrieveData() async {
    final Database db = await setDatabase();
    final List<Map<String, Object?>> queryResult = await db.query('report');
    return queryResult.map((e) => DataHandler.fromMap(e)).toList();
  }

  Future<void> deleteData(int id) async {
    final db = await setDatabase();
    await db.delete(
      'report',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
