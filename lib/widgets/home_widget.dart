import 'package:flutter/material.dart';

import '../models/report_model.dart';
import '../services/db_handler.dart';
import 'add_laporan_widget.dart';
import 'drawer_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

enum addToggle { masuk, keluar, empty }

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.setDatabase().whenComplete(() async {
      setState(() {});
    });
  }

  addToggle isSelected = addToggle.empty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: const DrawerWidget(),
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
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Laporan Bulan Ini"),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.refresh))
                          ])),
                  Expanded(
                      child: FutureBuilder(
                          future: handler.retrieveData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Report>> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                        child: InkWell(
                                            splashColor:
                                                Colors.blue.withAlpha(30),
                                            onTap: () {},
                                            child: ListTile(
                                                title: Text(snapshot
                                                    .data![index].status),
                                                subtitle: Text(
                                                    snapshot.data![index].date),
                                                leading: snapshot.data![index].status ==
                                                        "Uang Masuk"
                                                    ? const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.lightBlue,
                                                        child:
                                                            Icon(Icons.arrow_downward,
                                                                color: Colors
                                                                    .greenAccent))
                                                    : const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.lightBlue,
                                                        child: Icon(
                                                            Icons.arrow_upward,
                                                            color: Colors.redAccent)),
                                                trailing: Text("Rp." + snapshot.data![index].nominal.toString()))));
                                  });
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }))
                ]))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AddLaporanWidget();
                }).then((value) => setState(() {}));
          },
          child: const Icon(Icons.add),
        ));
  }
}
