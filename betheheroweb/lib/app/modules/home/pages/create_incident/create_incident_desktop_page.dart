import 'package:betheheroweb/app/modules/home/pages/create_incident/components/cancel_btn.dart';
import 'package:betheheroweb/app/modules/home/pages/home_profile/home_controller.dart';
import 'package:betheheroweb/app/shared/components/action_button.dart';
import 'package:betheheroweb/app/shared/components/form_field_widget.dart';
import 'package:betheheroweb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'create_incident_controller.dart';

class CreateIncidentDesktopPage extends StatefulWidget {
  final String ongId;
  const CreateIncidentDesktopPage({
    Key key,
    this.ongId,
  }) : super(key: key);

  @override
  _CreateIncidentDesktopState createState() => _CreateIncidentDesktopState();
}

class _CreateIncidentDesktopState
    extends ModularState<CreateIncidentDesktopPage, CreateIncidentController> {
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
                                        "Voltar para a home",
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
                            controller: controller.incidentTitleController,
                            hintText: "Título do caso",
                          ),
                          SizedBox(height: 10),
                          FormFieldWidget(
                            controller:
                                controller.incidentDescriptionController,
                            //formKey: controller.ongEmailFormKey,
                            maxLines: 8,
                            hintText: "Descrição",
                          ),
                          SizedBox(height: 10),
                          FormFieldWidget(
                            controller: controller.incidentValueController,
                            hintText: "Valor em reais",
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CancelButton(
                                text: "cancelar",
                                onPress: () {
                                  Modular.to.pop();
                                },
                              ),
                              SizedBox(width: 10),
                              ActionButton(
                                minWidth: 190,
                                text: "Cadrastrar",
                                onPress: () {
                                  controller.validateNewIncident(
                                      context, widget.ongId);
                                },
                              ),
                            ],
                          ),
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
