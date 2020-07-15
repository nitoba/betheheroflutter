import 'package:mobx/mobx.dart';
part 'incident_model.g.dart';

class IncidentStoreModel = _IncidentStoreModelBase with _$IncidentStoreModel;

abstract class _IncidentStoreModelBase with Store {
  @observable
  int id;
  @observable
  String title;
  @observable
  String description;
  @observable
  double value;
  @observable
  String ongId;

  _IncidentStoreModelBase({
    this.id,
    this.title,
    this.description,
    this.value,
    this.ongId,
  });

  IncidentStoreModel fromJson(Map<String, dynamic> json) {
    return IncidentStoreModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      value: json["value"],
      ongId: json["ong_id"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['value'] = this.value;
    data['ong_id'] = this.ongId;
    return data;
  }
}
