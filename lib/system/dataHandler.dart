class DataHandler {
  int id = 0;
  String date = "";
  int nominal = 0;
  String status = "";

  dataMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['date'] = date;
    map['nominal'] = nominal;
    map['status'] = status;

    return map;
  }
}
