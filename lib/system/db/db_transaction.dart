import 'package:laporan_penjualan/system/db/db_commit.dart';
import 'package:laporan_penjualan/system/dataHandler.dart';

class DbTransaction {
  late DataRepo _repo;

  DbTransaction() {
    _repo = DataRepo();
  }

  addLaporan(DataHandler dataHandler) async {
    return await _repo.insertData('report', dataHandler.dataMap());
  }
}
