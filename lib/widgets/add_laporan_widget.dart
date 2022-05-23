import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/report_model.dart';
import '../services/db_handler.dart';

class AddLaporanWidget extends StatefulWidget {
  const AddLaporanWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddLaporanWidgetState();
  }
}

enum addToggle { masuk, keluar, empty }

class _AddLaporanWidgetState extends State<AddLaporanWidget> {
  addToggle? isSelected = addToggle.empty;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Menambahkan Laporan"),
        content: Form(
            key: _form,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextFormField(
                  controller: textController,
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
                                          children: const [Text("Masuk")])
                                    ]))))),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = addToggle.keluar;
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
          TextButton(
              onPressed: () async {
                if (isSelected == null ||
                    isSelected == addToggle.empty ||
                    textController.text.isEmpty) {
                  var snackBar = const SnackBar(
                      content: Text("Tidak boleh ada data kosong!"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  var status = isSelected.toString();
                  isSelected == addToggle.masuk
                      ? status = "Uang Masuk"
                      : status = "Uang Keluar";
                  Report _data = Report(
                      nominal: int.parse(textController.text),
                      date:
                          DateFormat("y-MM-dd HH:mm:ss").format(DateTime.now()),
                      status: status);
                  List<Report> _dataHandler = [_data];
                  DatabaseHandler().insertData(_dataHandler);
                }
              },
              child: const Text("Submit"))
        ]);
  }
}
