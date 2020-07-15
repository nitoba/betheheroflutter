import 'package:betheheromobile/src/repositories/app_repository_interface.dart';
import 'package:betheheromobile/src/shared/models/incident_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppRepository implements IAppRepository {
  HasuraConnect hasuraConnet =
      HasuraConnect("https://betheheroflutter.herokuapp.com/v1/graphql");

  @override
  Future<List<IncidentModel>> getAllIncidents() async {
    List<IncidentModel> incidents;
    String query = """query ListAllIncidents {
        incidents {
          id
          title
          description
          value
          ong {
            name
            email
            whatsapp
            city
            uf
          }
        }
    }""";

    var response = await hasuraConnet.query(query);
    List incidentsLoaded = response["data"]["incidents"];
    if (incidentsLoaded != null) {
      incidents = incidentsLoaded
          .map((incident) => IncidentModel.fromJson(incident))
          .toList();
    }
    return incidents;
  }
}
