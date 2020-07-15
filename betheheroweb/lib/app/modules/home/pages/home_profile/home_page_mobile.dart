import 'package:BeTheHeroWeb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/header_widget.dart';
import 'components/list_incidents.dart';
import 'home_controller.dart';

class HomePageMobile extends StatefulWidget {
  final String ongID;
  final String ongName;
  const HomePageMobile({
    Key key,
    this.ongID,
    this.ongName,
  }) : super(key: key);

  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState
    extends ModularState<HomePageMobile, HomeController> {
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
        children: <Widget>[
          HeaderWidget(
            ongName: widget.ongName,
            onPress: () {
              Modular.to.popAndPushNamed("/");
            },
            registerNewCase: () {
              Modular.to
                  .pushNamed("/home/newIncident", arguments: widget.ongID);
            },
          ),
          SizedBox(height: 15),
          Observer(builder: (_) {
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            } else {
              return ListIncidents(
                controller: controller,
                ongId: widget.ongID,
              );
            }
          })
        ],
      ),
    );
  }
}
