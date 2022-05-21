import 'package:flutter/material.dart';

class AddLaporanWidget extends StatefulWidget {
  const AddLaporanWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddLaporanWidgetState();
  }
}

enum addToggle { masuk, keluar, empty }

class _AddLaporanWidgetState extends State<AddLaporanWidget> {
  addToggle isSelected = addToggle.empty;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Menambahkan Laporan"),
        content: Form(
            key: _form,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Masukkan Nominal")),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = addToggle.masuk;
                            print(isSelected);
                          });
                        },
                        child: Card(
                            color: isSelected == addToggle.masuk
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            child: SizedBox(
                                height: 70,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: const Icon(
                                              Icons.arrow_downward,
                                              color: Colors.greenAccent)),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [Text("Keluar")])
                                    ]))))),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = addToggle.keluar;
                            print(isSelected);
                          });
                        },
                        child: Card(
                            color: isSelected == addToggle.keluar
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            child: SizedBox(
                                height: 70,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: const Icon(Icons.arrow_upward,
                                              color: Colors.redAccent)),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text("Keluar"),
                                          ])
                                    ]))))),
              ])
            ])),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text("Submit"))
        ]);
  }
}
