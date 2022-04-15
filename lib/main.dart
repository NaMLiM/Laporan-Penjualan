import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
                leading: Icon(Icons.warning_amber_rounded),
                title: const Text('Tentang'),
                onTap: () {})
          ]),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Card(
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {},
                              child: SizedBox(
                                  width: 170,
                                  height: 100,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Colors.green,
                                          size: 50,
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("This Month"),
                                              Text("RP. 30.000")
                                            ])
                                      ])))),
                      Card(
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {},
                              child: SizedBox(
                                  width: 170,
                                  height: 100,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.arrow_upward,
                                          color: Colors.red,
                                          size: 50,
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("This Month"),
                                              Text("RP. 30.000")
                                            ])
                                      ]))))
                    ],
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
