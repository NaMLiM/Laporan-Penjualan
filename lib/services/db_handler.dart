import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:laporan_penjualan/models/monthly_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:sqflite_common_porter/utils/csv_utils.dart';

import '../models/report_model.dart';

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

  Future<int> insertData(List<Report> data) async {
    int result = 0;
    final Database db = await setDatabase();
    for (var data in data) {
      result = await db.insert('report', data.toMap());
    }
    return result;
  }

  Future<List<Report>> retrieveData() async {
    final Database db = await setDatabase();
    final List<Map<String, Object?>> queryResult = await db.query('report');
    return queryResult.map((e) => Report.fromMap(e)).toList();
  }

  Future<int> updateData(Report report) async {
    final Database db = await setDatabase();
    return await db.update("report", report.toMap(),
        where: "id = ?", whereArgs: [report.id]);
  }

  Future<void> deleteData(int? id) async {
    final db = await setDatabase();
    await db.delete(
      'report',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<MasukMonthly>> masukMonthly() async {
    final Database db = await setDatabase();
    final time = DateTime.now();
    final month = DateFormat("MM").format(time);
    final year = time.year;
    final List<Map<String, Object?>> result = await db.rawQuery(
        "SELECT SUM(nominal) as nominal FROM report WHERE strftime('%Y', date) = '$year' AND  strftime('%m', date) = '$month' AND status = 'Uang Masuk' GROUP BY strftime('%m', date)");
    return result.map((e) => MasukMonthly.fromMap(e)).toList();
  }

  Future<List<KeluarMonthly>> keluarMonthly() async {
    final Database db = await setDatabase();
    final time = DateTime.now();
    final month = DateFormat("MM").format(time);
    final year = time.year;
    final List<Map<String, Object?>> result = await db.rawQuery(
        "SELECT SUM(nominal) as nominal FROM report WHERE strftime('%Y', date) = '$year' AND  strftime('%m', date) = '$month' AND status = 'Uang Keluar' GROUP BY strftime('%m', date)");
    return result.map((e) => KeluarMonthly.fromMap(e)).toList();
  }

  export() async {
    Database db = await setDatabase();
    var export = await db.query('report');
    var result = mapListToCsv(export);
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory == null) return;
    var storage = await Permission.storage.status;
    var external = await Permission.manageExternalStorage.status;
    if (storage.isDenied || storage.isLimited || storage.isRestricted) {
      await Permission.storage.request();
    }
    if (external.isDenied || external.isLimited || external.isRestricted) {
      await Permission.manageExternalStorage.request();
    }
    final File file = File("$selectedDirectory/Laporan.csv");
    await file.writeAsString(result!);
  }
}
