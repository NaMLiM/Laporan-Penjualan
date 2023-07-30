import 'package:flutter/material.dart';

import '../models/report_model.dart';
import '../services/db_handler.dart';

class UpdateLaporanWidget extends StatefulWidget {
  const UpdateLaporanWidget(
      {Key? key, required this.id, required this.status, required this.date})
      : super(key: key);

  final int? id;
  final String status;
  final String date;

  @override
  State<StatefulWidget> createState() {
    return _UpdateLaporanWidget();
  }
}

enum AddToggle { masuk, keluar, empty }

class _UpdateLaporanWidget extends State<UpdateLaporanWidget> {
  AddToggle? isSelected = AddToggle.empty;
  var textController = TextEditingController();
  var check = true;

  @override
  Widget build(BuildContext context) {
    if (check == true) {
      if (widget.status == "Uang Masuk") {
        isSelected = AddToggle.masuk;
      } else {
        isSelected = AddToggle.keluar;
      }
      check = false;
    }
    return AlertDialog(
      title: const Text("Update Laporan"),
      content: Form(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("ID ${widget.id}"),
          TextFormField(
            controller: textController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Nominal", border: UnderlineInputBorder()),
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = AddToggle.masuk;
                      });
                    },
                    child: Card(
                        color: isSelected == AddToggle.masuk
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
                                      child: const Icon(Icons.arrow_downward,
                                          color: Colors.greenAccent)),
                                  const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text("Masuk")])
                                ]))))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = AddToggle.keluar;
                      });
                    },
                    child: Card(
                        color: isSelected == AddToggle.keluar
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
                                  const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Keluar"),
                                      ])
                                ]))))),
          ])
        ],
      )),
      actions: [
        TextButton(
            onPressed: () {
              DatabaseHandler().deleteData(widget.id);
              Navigator.pop(context);
            },
            child: const Text("Delete")),
        TextButton(
            onPressed: () {
              var status = isSelected.toString();
              isSelected == AddToggle.masuk
                  ? status = "Uang Masuk"
                  : status = "Uang Keluar";
              Report data = Report(
                  id: widget.id,
                  nominal: int.parse(textController.text),
                  date: widget.date,
                  status: status);
              DatabaseHandler().updateData(data);
              Navigator.pop(context);
            },
            child: const Text("Update"))
      ],
    );
  }
}
