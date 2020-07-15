import 'package:betheheromobile/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IncidentItem extends StatelessWidget {
  final Function goToDetail;
  final bool isDetail;
  final String incidentDescription;
  final String ongCity;
  final String ongUf;
  final String incidentTitle;
  final String ongName;
  final double incidentValue;
  const IncidentItem({
    Key key,
    this.goToDetail,
    @required this.incidentTitle,
    @required this.incidentValue,
    @required this.ongName,
    this.isDetail = false,
    this.incidentDescription,
    this.ongCity,
    this.ongUf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ONG:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              Text(
                "$ongName de $ongCity / $ongUf",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              Text(
                "CASO:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              Text(
                incidentTitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18),
              if (isDetail) ...[
                Text(
                  "DESCRIÇÃO:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  incidentDescription,
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
              ],
              Text(
                "VALOR:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              Text(
                "R\$ ${incidentValue.toStringAsFixed(2)} reais",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              if (!isDetail) ...[
                Divider(),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ver mais detalhes",
                          style: TextStyle(
                            color: redColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Feather.arrow_right,
                          color: redColor,
                        )
                      ],
                    ),
                    onPressed: goToDetail,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
