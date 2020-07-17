import 'package:betheheromobile/src/app_controller.dart';
import 'package:betheheromobile/src/shared/components/header_widget.dart';
import 'package:betheheromobile/src/pages/incidents/components/list_incidents_widget.dart';
import 'package:betheheromobile/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IncidentsPage extends StatefulWidget {
  @override
  _IncidentsPageState createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  AppController appController;
  @override
  void initState() {
    appController = context.read<AppController>();

    appController.getAllIncidents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16),
          child: AnimatedBuilder(
            animation: appController,
            builder: (BuildContext context, Widget child) {
              if (appController.incidents != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    headerAppBar(
                      action: Row(
                        children: [
                          Text(
                            "Total de",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${appController.incidents.length} casos",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Bem-vindo!",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Escolha um dos casos abaixo\ne salve o dia.",
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 20,
                        color: subtitleColor,
                      ),
                    ),
                    ListIncidents(
                      controller: appController,
                      refresh: () async {
                        await appController.getAllIncidents();
                        setState(() {});
                      },
                    )
                  ],
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/animation/loading.json",
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
