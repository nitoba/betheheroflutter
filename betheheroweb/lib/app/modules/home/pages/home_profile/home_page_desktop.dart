import 'package:betheheroweb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/grid_incidents_widget.dart';
import 'components/header_widget.dart';
import 'home_controller.dart';

class HomePageDesktop extends StatefulWidget {
  final String ongID;
  final String ongName;
  const HomePageDesktop({
    Key key,
    this.ongID,
    this.ongName,
  }) : super(key: key);

  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState
    extends ModularState<HomePageDesktop, HomeController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.getIncidentsByOng(widget.ongID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 100, right: 100),
            child: HeaderWidget(
              ongName: widget.ongName,
              onPress: () {
                Modular.to.popAndPushNamed("/");
              },
              registerNewCase: () {
                Modular.to.pushNamed("/home/newIncident",
                    arguments: widget.ongID);
              },
            ),
          ),
          SizedBox(height: 65),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Text(
              "Casos cadastrados",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          //SizedBox(height: 30),
          Container(
            child: Observer(builder: (_) {
              if (controller.incidentsOfOng == null) {
                return Expanded(
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(redColor),
                  )),
                );
              } else if (controller.incidentsOfOng.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "Sua ONG não tem nenhum caso cadastrado",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else {
                return GridIncidents(
                  controller: controller,
                  ongId: widget.ongID,
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
