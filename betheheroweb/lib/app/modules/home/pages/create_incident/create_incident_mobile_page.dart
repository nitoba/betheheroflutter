import 'package:betheheroweb/app/shared/components/action_button.dart';
import 'package:betheheroweb/app/shared/components/form_field_widget.dart';
import 'package:betheheroweb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'create_incident_controller.dart';

class CreateIncidentMobilePage extends StatefulWidget {
  final String ongId;
  const CreateIncidentMobilePage({
    Key key,
    this.ongId,
  }) : super(key: key);

  @override
  _CreateIncidentMobilePageState createState() =>
      _CreateIncidentMobilePageState();
}

class _CreateIncidentMobilePageState
    extends ModularState<CreateIncidentMobilePage, CreateIncidentController> {
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
                      "Cadrastrar novo caso",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Descreva o caso detalhadamente para\nencontrar um heroi para resolver isso.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 40),
                    FormFieldWidget(
                      controller: controller.incidentTitleController,
                      hintText: "Título do caso",
                    ),
                    SizedBox(height: 10),
                    FormFieldWidget(
                      controller: controller.incidentDescriptionController,
                      maxLines: 8,
                      hintText: "Descrição",
                    ),
                    SizedBox(height: 10),
                    FormFieldWidget(
                      controller: controller.incidentValueController,
                      hintText: "Valor em reais",
                    ),
                    SizedBox(height: 10),
                    ActionButton(
                      text: "Cadrastrar",
                      onPress: () {
                        controller.validateNewIncident(context, widget.ongId);
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
                              "Voltar para o logon",
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
