import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({Key? key, required this.snapshot}) : super(key: key);

  final snapshot;
  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Detail"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("ID"),
              Text(widget.snapshot.id.toString())
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Nominal"),
              Text(widget.snapshot.nominal.toString())
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Tanggal"), Text(widget.snapshot.date)]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Status"), Text(widget.snapshot.status)])
          ],
        ));
  }
}
