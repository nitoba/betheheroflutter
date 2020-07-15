import 'package:BeTheHeroWeb/app/shared/components/action_button.dart';
import 'package:BeTheHeroWeb/app/shared/components/form_field_widget.dart';
import 'package:BeTheHeroWeb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../login_controller.dart';

class RegisterPageMobile extends StatefulWidget {
  const RegisterPageMobile({
    Key key,
  }) : super(key: key);

  @override
  _RegisterPageMobileState createState() => _RegisterPageMobileState();
}

class _RegisterPageMobileState
    extends ModularState<RegisterPageMobile, LoginController> {
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
              width: MediaQuery.of(context).size.width - 32,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 80,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Cadrastro",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Faça seu cadrastro, entre na plataforma e ajude pessoas a encontrarem os casos de sua ONG",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 40),
                    FormFieldWidget(
                      controller: controller.ongNameController,
                      hintText: "Nome da ONG",
                    ),
                    SizedBox(height: 10),
                    FormFieldWidget(
                      controller: controller.ongEmailController,
                      hintText: "E-mail",
                    ),
                    SizedBox(height: 10),
                    FormFieldWidget(
                      controller: controller.ongWhatAppController,
                      hintText: "WhatsApp",
                    ),
                    SizedBox(height: 10),
                    FormFieldWidget(
                      controller: controller.ongCityController,
                      hintText: "Cidade",
                    ),
                    SizedBox(height: 10),
                    FormFieldWidget(
                      controller: controller.ongUfController,
                      hintText: "UF",
                    ),
                    SizedBox(height: 10),
                    ActionButton(
                      text: "Cadrastrar",
                      onPress: () {
                        controller.validateRegister(context);
                      },
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      hoverElevation: 10,
                      height: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hoverColor: Colors.red.withOpacity(0.3),
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
                              "Voltar para o home",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Modular.to.pop();
                      },
                    )
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
