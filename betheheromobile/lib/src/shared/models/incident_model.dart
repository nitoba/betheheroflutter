class IncidentModel extends _Ong {
  int id;
  String title;
  String description;
  double value;

  _Ong ong;

  IncidentModel({
    this.id,
    this.title,
    this.description,
    this.value,
    this.ong,
  });

  factory IncidentModel.fromJson(Map<String, dynamic> json) {
    return IncidentModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      value: (json['value'] as int).toDouble(),
      ong: json['ong'] != null ? new _Ong.fromJson(json['ong']) : null,
    );
  }
}

class _Ong {
  String name;
  String email;
  String whatsapp;
  String city;
  String uf;

  _Ong({
    this.name,
    this.email,
    this.whatsapp,
    this.city,
    this.uf,
  });

  factory _Ong.fromJson(Map<String, dynamic> json) {
    return _Ong(
      name: json['name'],
      email: json['email'],
      whatsapp: json['whatsapp'],
      city: json['city'],
      uf: json['uf'],
    );
  }
}
