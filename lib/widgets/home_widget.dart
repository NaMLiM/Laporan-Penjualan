import 'package:flutter/material.dart';
import 'package:laporan_penjualan/widgets/update_laporan_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: const DrawerWidget(),
        body: Center(
            child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Row(children: [
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Laporan Bulan Ini"),
                      IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.refresh))
                    ])),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: FutureBuilder(
                future: handler.retrieveData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Report>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onLongPress: () {
                                    Navigator.push(
                                            context,
                                            DialogRoute(
                                                builder: (context) =>
                                                    UpdateLaporanWidget(
                                                      id: snapshot
                                                          .data![index].id,
                                                      status: snapshot
                                                          .data![index].status,
                                                      date: snapshot
                                                          .data![index].date,
                                                    ),
                                                context: context))
                                        .then((value) => setState(() {}));
                                  },
                                  child: ListTile(
                                      title: Text(snapshot.data![index].status),
                                      subtitle:
                                          Text(snapshot.data![index].date),
                                      leading: snapshot.data![index].status ==
                                              "Uang Masuk"
                                          ? const CircleAvatar(
                                              backgroundColor: Colors.lightBlue,
                                              child: Icon(Icons.arrow_downward,
                                                  color: Colors.greenAccent))
                                          : const CircleAvatar(
                                              backgroundColor: Colors.lightBlue,
                                              child: Icon(Icons.arrow_upward,
                                                  color: Colors.redAccent)),
                                      trailing: Text(
                                          "Rp.${snapshot.data![index].nominal}"))));
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ))
        ])),
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
