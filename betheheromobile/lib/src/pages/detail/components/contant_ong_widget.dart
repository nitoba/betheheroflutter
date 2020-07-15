import 'package:betheheromobile/src/shared/components/action_button.dart';
import 'package:flutter/material.dart';

class ContantOng extends StatelessWidget {
  final Function handleWhatsApp;
  final Function handleEmail;
  const ContantOng({
    Key key,
    @required this.handleWhatsApp,
    @required this.handleEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "Salve o dia!\nSeja o herói desse caso.",
              style: TextStyle(
                height: 1.3,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 22),
            Text(
              "Entre em contato",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  minWidth: MediaQuery.of(context).size.width / 2 - 45,
                  text: "WhatsApp",
                  onPress: handleWhatsApp,
                ),
                ActionButton(
                  minWidth: MediaQuery.of(context).size.width / 2 - 45,
                  text: "E-mail",
                  onPress: handleEmail,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
