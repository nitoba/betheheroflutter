import 'package:betheheromobile/src/shared/models/incident_model.dart';

abstract class IAppRepository {
  Future<List<IncidentModel>> getAllIncidents();
}
