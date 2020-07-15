import 'package:BeTheHeroWeb/app/modules/home/pages/home_profile/home_controller.dart';
import 'package:BeTheHeroWeb/app/modules/home/repositories/home_repository_interface.dart';
import 'package:BeTheHeroWeb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'create_incident_controller.g.dart';

class CreateIncidentController = _CreateIncidentControllerBase
    with _$CreateIncidentController;

abstract class _CreateIncidentControllerBase with Store {
  final TextEditingController incidentTitleController = TextEditingController();
  final TextEditingController incidentDescriptionController =
      TextEditingController();
  final TextEditingController incidentValueController = TextEditingController();

  final IHomeRepository repository;

  _CreateIncidentControllerBase(this.repository);

  validateNewIncident(BuildContext context, String ongId) async {
    if (incidentTitleController.text.isEmpty) {
      showToast(context, msgToast: "Informe o título do caso");
      return;
    } else if (incidentDescriptionController.text.isEmpty) {
      showToast(context, msgToast: "Informe a descrição do caso");
      return;
    } else if (incidentValueController.text.isEmpty) {
      showToast(context, msgToast: "Informe o valor em reais");
      return;
    } else {
      print("todos campos válidos");
      showLoader(msg: "Cadastrando novo caso...");

      await repository.createNewIncident(
        title: incidentTitleController.text,
        description: incidentDescriptionController.text,
        value: double.parse(incidentValueController.text),
        ongId: ongId,
      );

      hideLoader(context);
      await Modular.get<HomeController>().getIncidentsByOng(ongId);
      Modular.to.pop();
    }
  }
}
