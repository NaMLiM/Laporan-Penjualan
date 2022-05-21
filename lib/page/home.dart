import 'package:flutter/material.dart';
import 'package:laporan_penjualan/widget/addLaporanWidget.dart';
import 'package:laporan_penjualan/widget/tentangWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

enum addToggle { masuk, keluar, empty }

class _HomeState extends State<Home> {
  addToggle isSelected = addToggle.empty;

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
                      builder: (BuildContext context) {
                        return TentangWidget();
                      });
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
