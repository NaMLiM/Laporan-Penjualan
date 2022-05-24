import 'package:flutter/material.dart';
import 'tentang_widget.dart';
import '../services/db_handler.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final DatabaseHandler db = DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Laporan Penjualan'),
        ),
        ListTile(
            leading: const Icon(Icons.upload_rounded),
            title: const Text('Export to CSV'),
            onTap: () {
              db.export();
            }),
        ListTile(
            leading: const Icon(Icons.warning_amber_rounded),
            title: const Text('Tentang'),
            onTap: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return const TentangWidget();
                  });
            })
      ]),
    );
  }
}
