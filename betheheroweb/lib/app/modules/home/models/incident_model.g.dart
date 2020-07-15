// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IncidentStoreModel on _IncidentStoreModelBase, Store {
  final _$idAtom = Atom(name: '_IncidentStoreModelBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: '_IncidentStoreModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_IncidentStoreModelBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$valueAtom = Atom(name: '_IncidentStoreModelBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$ongIdAtom = Atom(name: '_IncidentStoreModelBase.ongId');

  @override
  String get ongId {
    _$ongIdAtom.reportRead();
    return super.ongId;
  }

  @override
  set ongId(String value) {
    _$ongIdAtom.reportWrite(value, super.ongId, () {
      super.ongId = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
description: ${description},
value: ${value},
ongId: ${ongId}
    ''';
  }
}
