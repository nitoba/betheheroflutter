import 'package:BeTheHeroWeb/app/modules/login/repositories/login_repository_interface.dart';
import 'package:BeTheHeroWeb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:random_string/random_string.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final TextEditingController ongIDController = TextEditingController();
  final TextEditingController ongNameController = TextEditingController();
  final TextEditingController ongEmailController = TextEditingController();
  final TextEditingController ongWhatAppController = TextEditingController();
  final TextEditingController ongCityController = TextEditingController();
  final TextEditingController ongUfController = TextEditingController();

  final ILoginRepository loginRepository;

  _LoginControllerBase(this.loginRepository);

  String ongID;
  List ongFound;

  validateRegister(BuildContext context) async {
    if (ongNameController.text.isEmpty) {
      showToast(context, msgToast: "Informe nome da ONG");
      return;
    } else if (ongEmailController.text.isEmpty) {
      showToast(context, msgToast: "Informe email da ONG");
      return;
    } else if (ongWhatAppController.text.isEmpty) {
      showToast(context, msgToast: "Informe whatsapp da ONG");
      return;
    } else if (ongCityController.text.isEmpty) {
      showToast(context, msgToast: "Informe a cidade da ONG");
      return;
    } else if (ongUfController.text.isEmpty) {
      showToast(context, msgToast: "Informe uf da ONG");
      return;
    } else {
      //print("todos campos válidos");
      var id = randomAlphaNumeric(6);
      showLoader(msg: "Cadastrando sua Ong");
      ongID = await loginRepository.handleRegister(
        id: id,
        name: ongNameController.text,
        email: ongEmailController.text,
        whatsapp: ongWhatAppController.text,
        city: ongCityController.text,
        uf: ongUfController.text,
      );
      hideLoader(context);
      _showId(ongID, context);
      //Modular.to.pop();

    }
  }

  _showId(String id, BuildContext context) {
    Modular.to.showDialog(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: backgroundColor,
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Esse é o seu código para logar $id, Garde-o bem ;)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                color: redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Modular.to.pop();
                },
                child: Text(
                  "Fechar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateLogin(BuildContext context) async {
    if (ongIDController.text.isEmpty) {
      showToast(context, msgToast: "Informe ID da ONG");
      return;
    } else {
      print("todos campos válidos");
      showLoader(msg: "Logando na plataforma");
      ongFound = await loginRepository.handleLogin(ongIDController.text);
      if (ongFound.isNotEmpty) {
        Map<String, dynamic> ongCredentials = {
          "ongId": ongIDController.text,
          "ongName": ongFound[0]['name'],
        };
        hideLoader(context);
        Modular.to.pushNamedAndRemoveUntil(
          "/home",
          (Route<dynamic> route) => false,
          arguments: ongCredentials,
        );
      } else {
        hideLoader(context);
        showToast(
          context,
          duration: 3,
          msgToast: "Sua ONG ainda não foi cadastrada",
        );
      }
    }
  }
}
