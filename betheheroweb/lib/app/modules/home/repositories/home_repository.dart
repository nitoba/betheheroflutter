import "./home_repository_interface.dart";
import 'package:BeTheHeroWeb/app/modules/home/models/incident_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HomeRepository implements IHomeRepository {
  final HasuraConnect hasuraConnect;

  HomeRepository(this.hasuraConnect);
  @override
  Future<List<IncidentStoreModel>> getIncidentsByOng(String ongId) async {
    List<IncidentStoreModel> incidentsOng;
    var instance = IncidentStoreModel();
    String queryGetIncidentsByOng = """query getOngIncidents(\$ongID:String!) {
  incidents(where: {ong_id: {_eq: \$ongID}}) {
    id
    title
    description
    value
    ong_id
  }
}""";
    var response = await hasuraConnect.query(
      queryGetIncidentsByOng,
      variables: {"ongID": ongId},
    );
    List incidents = response["data"]["incidents"];

    incidentsOng = incidents.map((json) => instance.fromJson(json)).toList();

    return incidentsOng;
  }

  @override
  Future<bool> deleteIncidentByOng({int idIncident, String ongId}) async {
    String verifyQuery = """query verifyIncidentOng(\$idIncident: Int) {
  incidents(where: {id: {_eq: \$idIncident}}) {
    ong_id
  }
}""";

    String deleteQuery = """mutation deleteIncident(\$id:Int!) {
  delete_incidents(where: {id: {_eq: \$id}}) {
    affected_rows
  }
}""";

    var responseVerify = await hasuraConnect
        .query(verifyQuery, variables: {"idIncident": idIncident});
    if (responseVerify['data']['incidents'][0]['ong_id'] == ongId) {
      await hasuraConnect.mutation(deleteQuery, variables: {"id": idIncident});
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> createNewIncident(
      {String title, description, ongId, double value}) async {
    String createIncidentQuery =
        """mutation createIncident(\$title: String!, \$description: String!, \$value: Float, \$ong_id: String!) {
  insert_incidents(objects: {title: \$title, description: \$description, value: \$value, ong_id: \$ong_id}) {
    affected_rows
    returning {
      id
    }
  }
}""";

    var response = await hasuraConnect.mutation(
      createIncidentQuery,
      variables: {
        "title": title,
        "description": description,
        "value": value,
        "ong_id": ongId,
      },
    );
  }
}
