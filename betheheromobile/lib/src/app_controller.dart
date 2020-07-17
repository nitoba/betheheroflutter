import 'package:betheheromobile/src/repositories/app_repository_interface.dart';
import 'package:betheheromobile/src/shared/models/incident_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class AppController extends ChangeNotifier {
  final IAppRepository repository;
  List<IncidentModel> incidents;

  AppController({this.repository});

  Future getAllIncidents() async {
    incidents = await repository.getAllIncidents();
    notifyListeners();
  }

  Future sendEmailToOng(
      {String ongEmail, String title, String ongName, double value}) async {
    String message =
        'Olá $ongName, estou entrando em contato pois gostaria de ajudar no caso "${title.trim()}" com o valor de R\$ ${value.toStringAsFixed(2)} reais';

    MailOptions email = MailOptions(
      subject: "Herói do caso: ${title.trim()}",
      recipients: [ongEmail],
      body: message,
      isHTML: false,
    );
    await FlutterMailer.send(email);
  }

  Future sendWhatsAppToOng(
      {String title, String ongName, String ongWhatsapp, double value}) async {
    String message =
        'Olá $ongName, estou entrando em contato pois gostaria de ajudar no caso "${title.trim()}" com o valor de R\$ ${value.toStringAsFixed(2)} reais';

    await FlutterOpenWhatsapp.sendSingleMessage("+55$ongWhatsapp", message);
  }
}
