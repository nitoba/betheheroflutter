import 'package:flutter/material.dart';

import '../home_controller.dart';
import 'incidents_item_widget.dart';

class GridIncidents extends StatelessWidget {
  final HomeController controller;
  final String ongId;
  const GridIncidents({
    Key key,
    this.controller,
    this.ongId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 84.0, vertical: 30),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: controller.incidentsOfOng.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width >= 1900 ? 3 : 2,
            childAspectRatio: 2 / 1.5,
          ),
          itemBuilder: (contenxt, index) {
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
      ),
    );
  }
}
