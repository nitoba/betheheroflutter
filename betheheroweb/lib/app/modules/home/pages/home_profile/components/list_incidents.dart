import 'package:betheheroweb/app/modules/home/pages/home_profile/components/incidents_item_widget.dart';
import 'package:betheheroweb/app/modules/home/pages/home_profile/home_controller.dart';
import 'package:flutter/material.dart';

class ListIncidents extends StatelessWidget {
  final String ongId;
  const ListIncidents({
    Key key,
    @required this.controller,
    this.ongId,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: controller.incidentsOfOng.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: IncidentItem(
              caseTitle: controller.incidentsOfOng[index].title,
              description: controller.incidentsOfOng[index].description,
              value: controller.incidentsOfOng[index].value,
              delete: () {
                controller.deleteIncidentByOng(
                    ongId, controller.incidentsOfOng[index].id);
              },
            ),
          );
        },
      ),
    );
  }
}
