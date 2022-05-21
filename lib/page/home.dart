import 'package:flutter/material.dart';
import 'package:laporan_penjualan/widget/addLaporanWidget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

enum addToggle { masuk, keluar, empty }

class _HomeState extends State<Home> {
  String _appName = "";
  String _versionName = "";
  String _versionCode = "";
  String _packageName = "";
  addToggle isSelected = addToggle.empty;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    final _packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _appName = _packageInfo.appName; // Ambil Data Nama Aplikasi

      _versionName = _packageInfo.version; // Ambil Data Nama Versi

      _versionCode = _packageInfo.buildNumber; // Ambil Data Kode Versi

      _packageName = _packageInfo.packageName; // Ambil Data Package Name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Laporan Penjualan'),
            ),
            ListTile(
                leading: const Icon(Icons.upload_rounded),
                title: const Text('Export to CSV'),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.warning_amber_rounded),
                title: const Text('Tentang'),
                onTap: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              title: Text(_appName),
                              content: Text("Versi " + _versionName),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context),
                                    child: const Text("Ok"))
                              ]));
                })
          ]),
        ),
        body: Center(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(children: [
                  Row(children: [
                    Expanded(
                        child: Card(
                            child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {},
                                child: SizedBox(
                                    height: 100,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(Icons.arrow_downward,
                                              color: Colors.green, size: 50),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("This Month"),
                                                Text("RP. 30.000")
                                              ])
                                        ]))))),
                    Expanded(
                        child: Card(
                            child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {},
                                child: SizedBox(
                                    height: 100,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(Icons.arrow_upward,
                                              color: Colors.red, size: 50),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("This Month"),
                                                Text("RP. 30.000")
                                              ])
                                        ])))))
                  ]),
                  Expanded(
                      child: ListView(shrinkWrap: true, children: [
                    Card(
                        child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {},
                            child: ListTile(
                                title: Text("Uang Masuk"),
                                subtitle: Text("26-05-2001"),
                                leading: CircleAvatar(
                                    backgroundColor: Colors.lightBlue,
                                    child: Icon(Icons.arrow_downward,
                                        color: Colors.greenAccent)),
                                trailing: Text("RP. 30.000"))))
                  ]))
                ]))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddLaporanWidget();
                });
          },
          child: const Icon(Icons.add),
        ));
  }
}
