class DataHandler {
  int? id;
  String date = "";
  int nominal = 0;
  String status = "";

  DataHandler(
      {this.id,
      required this.nominal,
      required this.date,
      required this.status});

  DataHandler.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        date = map['date'],
        nominal = map['nominal'],
        status = map['status'];

  Map<String, Object?> toMap() {
    return {'id': id, 'date': date, 'nominal': nominal, 'status': status};
  }
}
