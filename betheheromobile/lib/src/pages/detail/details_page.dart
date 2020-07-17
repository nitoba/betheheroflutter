import 'package:betheheromobile/src/app_controller.dart';
import 'package:betheheromobile/src/pages/detail/components/contant_ong_widget.dart';
import 'package:betheheromobile/src/shared/components/header_widget.dart';
import 'package:betheheromobile/src/shared/components/incident_item.dart';
import 'package:betheheromobile/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final int index;

  const DetailsPage({Key key, this.index}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  AppController appController;
  @override
  void initState() {
    appController = context.read<AppController>();
    //appController = GetIt.I.get<AppController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            SizedBox(height: 46),
            headerAppBar(
              action: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Feather.arrow_left,
                  size: 30,
                  color: redColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            SizedBox(height: 40),
            IncidentItem(
              isDetail: true,
              incidentTitle: appController.incidents[widget.index].title,
              ongName: appController.incidents[widget.index].ong.name,
              incidentValue: appController.incidents[widget.index].value,
              incidentDescription:
                  appController.incidents[widget.index].description,
              ongCity: appController.incidents[widget.index].ong.city,
              ongUf: appController.incidents[widget.index].ong.uf,
            ),
            SizedBox(height: 25),
            ContantOng(
              handleWhatsApp: () {
                appController.sendWhatsAppToOng(
                  ongName: appController.incidents[widget.index].ong.name,
                  title: appController.incidents[widget.index].title,
                  value: appController.incidents[widget.index].value,
                  ongWhatsapp:
                      appController.incidents[widget.index].ong.whatsapp,
                );
              },
              handleEmail: () {
                appController.sendEmailToOng(
                  ongName: appController.incidents[widget.index].ong.name,
                  title: appController.incidents[widget.index].title,
                  value: appController.incidents[widget.index].value,
                  ongEmail: appController.incidents[widget.index].ong.email,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
