import 'package:betheheroweb/app/shared/components/action_button.dart';
import 'package:betheheroweb/app/shared/components/form_field_widget.dart';
import 'package:betheheroweb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../login_controller.dart';

class RegisterPageDesktop extends StatefulWidget {
  const RegisterPageDesktop({
    Key key,
  }) : super(key: key);

  @override
  _RegisterPageDesktopState createState() => _RegisterPageDesktopState();
}

class _RegisterPageDesktopState
    extends ModularState<RegisterPageDesktop, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width - 220,
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    spreadRadius: 16,
                  )
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Container(
                          //color: Colors.blue,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  height: 80,
                                ),
                              ),
                              SizedBox(height: 90),
                              Text(
                                "Cadrastro",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 25),
                              Text(
                                "Faça seu cadrastro, entre na plataforma e ajude\npessoas a encontrarem os casos de sua ONG",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 50),
                              MaterialButton(
                                hoverElevation: 10,
                                height: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hoverColor: Colors.red.withOpacity(0.3),
                                onPressed: () {
                                  Modular.to.pop();
                                },
                                child: Container(
                                  //color: Colors.red.withOpacity(0.3),
                                  width: 150,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Feather.arrow_left,
                                        color: redColor,
                                        size: 16,
                                      ),
                                      SizedBox(width: 14),
                                      Text(
                                        "Voltar para o logon",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FormFieldWidget(
                            controller: controller.ongNameController,
                            hintText: "Nome da ONG",
                          ),
                          SizedBox(height: 10),
                          FormFieldWidget(
                            controller: controller.ongEmailController,
                            //formKey: controller.ongEmailFormKey,

                            hintText: "E-mail",
                          ),
                          SizedBox(height: 10),
                          FormFieldWidget(
                            controller: controller.ongWhatAppController,
                            hintText: "WhatsApp",
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              FormFieldWidget(
                                width: 238,
                                controller: controller.ongCityController,
                                hintText: "Cidade",
                              ),
                              SizedBox(width: 5),
                              FormFieldWidget(
                                width: 58,
                                controller: controller.ongUfController,
                                hintText: "UF",
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ActionButton(
                              text: "Cadrastrar",
                              onPress: () {
                                controller.validateRegister(context);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
