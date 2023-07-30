import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '/widgets/home_widget.dart';

void main() {
  if(Platform.isWindows || Platform.isLinux){
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;
  runApp(const LaporanPenjualan());
}



class LaporanPenjualan extends StatelessWidget {
  const LaporanPenjualan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laporan Penjualan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Laporan Penjualan'),
    );
  }
}
