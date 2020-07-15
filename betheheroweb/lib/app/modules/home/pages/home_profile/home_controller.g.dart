// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$incidentsOfOngAtom = Atom(name: '_HomeControllerBase.incidentsOfOng');

  @override
  ObservableList<IncidentStoreModel> get incidentsOfOng {
    _$incidentsOfOngAtom.reportRead();
    return super.incidentsOfOng;
  }

  @override
  set incidentsOfOng(ObservableList<IncidentStoreModel> value) {
    _$incidentsOfOngAtom.reportWrite(value, super.incidentsOfOng, () {
      super.incidentsOfOng = value;
    });
  }

  final _$getIncidentsByOngAsyncAction =
      AsyncAction('_HomeControllerBase.getIncidentsByOng');

  @override
  Future getIncidentsByOng(String ongId) {
    return _$getIncidentsByOngAsyncAction
        .run(() => super.getIncidentsByOng(ongId));
  }

  @override
  String toString() {
    return '''
incidentsOfOng: ${incidentsOfOng}
    ''';
  }
}
