import 'package:BeTheHeroWeb/app/modules/home/models/incident_model.dart';

abstract class IHomeRepository {
  Future<List<IncidentStoreModel>> getIncidentsByOng(String ongId);
  Future<bool> deleteIncidentByOng({int idIncident, String ongId});
  Future<void> createNewIncident(
      {String title, description, ongId, double value});
}
