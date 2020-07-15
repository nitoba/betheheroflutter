import 'package:BeTheHeroWeb/app/shared/components/action_button.dart';
import 'package:BeTheHeroWeb/app/shared/components/form_field_widget.dart';
import 'package:BeTheHeroWeb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../login_controller.dart';

class LoginPageMobile extends StatefulWidget {
  final String title;
  const LoginPageMobile({Key key, this.title = "Login Mobile"})
      : super(key: key);

  @override
  _LoginPageMobileState createState() => _LoginPageMobileState();
}

class _LoginPageMobileState
    extends ModularState<LoginPageMobile, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/heroes.png",
                color: Colors.redAccent.withOpacity(0.35),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      child: Image.asset(
                        "assets/images/logo.png",
                      ),
                    ),
                    SizedBox(height: 64),
                    Text(
                      "Faça seu logon",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 25),
                    FormFieldWidget(
                      controller: controller.ongIDController,
                      hintText: "Sua ID",
                    ),
                    SizedBox(height: 14),
                    ActionButton(
                      text: "Entrar",
                      onPress: () {
                        controller.validateLogin(context);
                      },
                    ),
                    SizedBox(height: 25),
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      hoverColor: Colors.red.withOpacity(0.3),
                      child: Container(
                        width: 150,
                        child: Row(
                          children: [
                            Icon(
                              Feather.log_in,
                              color: redColor,
                              size: 16,
                            ),
                            SizedBox(width: 14),
                            Text(
                              "Não tenho cadastro",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed("/register");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
