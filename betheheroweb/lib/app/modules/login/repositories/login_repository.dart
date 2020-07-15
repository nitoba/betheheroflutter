import 'package:betheheroweb/app/modules/login/repositories/login_repository_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';

class LoginRepository implements ILoginRepository {
  final HasuraConnect hasuraConnect;

  LoginRepository(this.hasuraConnect);

  @override
  Future<String> handleRegister(
      {String id,
      String name,
      String email,
      String whatsapp,
      String city,
      String uf}) async {
    String registerOng = """
      mutation createOng(\$id:String!, \$name: String!, \$email: String!, \$whatsapp: String!, \$city: String!, \$uf: String!) {
  insert_ongs(objects: {id: \$id, name: \$name, email: \$email, whatsapp: \$whatsapp, city: \$city, uf: \$uf}) {
    affected_rows
    returning {
      id
    }
  }
}
""";
    var response = await hasuraConnect.mutation(registerOng, variables: {
      "id": id,
      "name": name,
      "email": email,
      "whatsapp": whatsapp,
      "city": city,
      "uf": uf,
    });
    var idReponse = response["data"]["insert_ongs"]["returning"][0]["id"];
    print(idReponse);
    return idReponse;
  }

  @override
  Future<List> handleLogin(String ongId) async {
    List ongFound;
    String queryLogin = """query OngLogin(\$ongID: String!) {
  ongs(where: {id: {_eq: \$ongID}}) {
    name
  }
}""";

    var response =
        await hasuraConnect.query(queryLogin, variables: {"ongID": ongId});

    ongFound = response["data"]["ongs"];
    if (ongFound.isNotEmpty) {
      print("Ong ${ongFound[0]["name"]} encontrada");
      return ongFound;
    } else {
      print("Ong não encontrada");
      return ongFound;
    }
  }
}
