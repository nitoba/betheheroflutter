import 'package:BeTheHeroWeb/app/modules/home/models/incident_model.dart';
import 'package:BeTheHeroWeb/app/modules/home/repositories/home_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository repository;
  @observable
  ObservableList<IncidentStoreModel> incidentsOfOng;

  _HomeControllerBase(this.repository);

  @action
  getIncidentsByOng(String ongId) async {
    var incidents = await repository.getIncidentsByOng(ongId);
    incidentsOfOng = incidents.asObservable();
  }

  @action
  deleteIncidentByOng(String ongId, int incidentId) async {
    bool isDeleted = await repository.deleteIncidentByOng(
        ongId: ongId, idIncident: incidentId);

    if (isDeleted) {
      incidentsOfOng.removeWhere((element) => element.id == incidentId);
    }
  }

  createNewIncident() {}
}
