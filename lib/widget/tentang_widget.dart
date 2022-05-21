import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class TentangWidget extends StatefulWidget {
  const TentangWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TentangWidget();
  }
}

class _TentangWidget extends State<TentangWidget> {
  String _appName = "null";
  String _appVer = "null";

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    final _packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appName = _packageInfo.appName; // Ambil Data Nama Aplikasi
      _appVer = _packageInfo.version; // Ambil Data Kode Versi
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(_appName),
        content: Text("Versi " + _appVer),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("Ok"))
        ]);
  }
}
