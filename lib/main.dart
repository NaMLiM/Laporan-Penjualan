import 'package:flutter/material.dart';
import 'package:laporan_penjualan/page/home.dart';

void main() {
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