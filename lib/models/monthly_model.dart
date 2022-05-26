class MasukMonthly {
  int? nominal;

  MasukMonthly({this.nominal});

  MasukMonthly.fromMap(Map<String, dynamic> map) : nominal = map['nominal'];

  Map<String, Object?> toMap() {
    return {'nominal': nominal};
  }
}

class KeluarMonthly {
  int? nominal;

  KeluarMonthly({this.nominal});

  KeluarMonthly.fromMap(Map<String, dynamic> map) : nominal = map['nominal'];

  Map<String, Object?> toMap() {
    return {'nominal': nominal};
  }
}
