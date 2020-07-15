import 'package:betheheromobile/src/app_controller.dart';
import 'package:betheheromobile/src/pages/detail/details_page.dart';
import 'package:betheheromobile/src/shared/components/incident_item.dart';
import 'package:betheheromobile/src/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListIncidents extends StatelessWidget {
  final AppController controller;
  final Future<void> Function() refresh;
  const ListIncidents({
    Key key,
    @required this.controller,
    this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: redColor,
        onRefresh: refresh,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: controller.incidents.length,
          itemBuilder: (context, index) {
            return IncidentItem(
              incidentTitle: controller.incidents[index].title,
              ongName: controller.incidents[index].ong.name,
              incidentValue: controller.incidents[index].value,
              ongCity: controller.incidents[index].ong.city,
              ongUf: controller.incidents[index].ong.uf,
              goToDetail: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => DetailsPage(
                      index: index,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
