import 'package:betheheroweb/app/shared/components/action_button.dart';
import 'package:betheheroweb/app/shared/components/form_field_widget.dart';
import 'package:betheheroweb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../login_controller.dart';

class LoginPageDesktop extends StatefulWidget {
  const LoginPageDesktop({Key key}) : super(key: key);

  @override
  _LoginPageDesktopState createState() => _LoginPageDesktopState();
}

class _LoginPageDesktopState
    extends ModularState<LoginPageDesktop, LoginController> {
  //use 'controller' variable to access controller
  //final GlobalKey<FormState> ongIDFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 100, right: 100, left: 100),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 100),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 100,
                            ),
                          ),
                          SizedBox(height: 64),
                          Text(
                            "Faça seu logon",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
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
                          SizedBox(height: 12),
                          InkWell(
                            borderRadius: BorderRadius.circular(8),
                            hoverColor: Colors.red.withOpacity(0.3),
                            child: Container(
                              width: 160,
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Modular.to.pushNamed("/register");
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 100, bottom: 100),
              child: Container(
                child: Image.asset(
                  "assets/images/heroes.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
