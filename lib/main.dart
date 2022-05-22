import 'package:flutter/material.dart';
import 'package:laporan_penjualan/widgets/home_widget.dart';

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
