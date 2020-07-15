import 'package:betheheroweb/app/modules/home/pages/home_profile/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IncidentItem extends StatelessWidget {
  final String caseTitle;
  final String description;
  final double value;
  final Function delete;

  IncidentItem({
    Key key,
    this.caseTitle,
    this.description,
    this.value,
    this.delete,
  }) : super(key: key);
  final HomeController controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "CASO:",
                  style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width >= 1360 ? 22 : 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff41414D),
                    height: 3,
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Icon(
                      Feather.trash_2,
                      size: 26,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: delete,
                )
              ],
            ),
            Text(
              caseTitle,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width >= 1360 ? 22 : 16,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Text(
              "DESCRIÇÃO:",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width >= 1360 ? 22 : 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff41414D),
                height: 3,
              ),
            ),
            Text(
              description,
              maxLines: 3,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width >= 1360 ? 22 : 16,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Text(
              "VALOR:",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width >= 1360 ? 22 : 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff41414D),
                height: 3,
              ),
            ),
            Text(
              "R\$ ${value.toStringAsFixed(2)} reais",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width >= 1360 ? 22 : 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
