import 'package:BeTheHeroWeb/app/shared/components/action_button.dart';
import 'package:BeTheHeroWeb/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HeaderWidget extends StatelessWidget {
  final Function onPress;
  final registerNewCase;
  final String ongName;
  const HeaderWidget({
    Key key,
    @required this.onPress,
    @required this.registerNewCase,
    @required this.ongName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= 1020
        ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MediaQuery.of(context).size.width <= 388
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: MediaQuery.of(context).size.width <= 388
                              ? 40
                              : 50,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Bem vinda, $ongName",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width <= 388
                              ? 14.5
                              : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(width: 1, color: Color(0xffDCDCE6)),
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Feather.power,
                            color: redColor,
                            size: 17,
                          ),
                          onPressed: onPress,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: MediaQuery.of(context).size.width <= 764
                      ? const EdgeInsets.only(right: 0)
                      : const EdgeInsets.only(right: 16),
                  child: Align(
                    alignment: MediaQuery.of(context).size.width <= 764
                        ? Alignment.center
                        : Alignment.centerRight,
                    child: ActionButton(
                      text: "Cadastrar novo caso",
                      onPress: registerNewCase,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 50,
                  ),
                ),
                SizedBox(width: 35),
                Text(
                  "Bem vinda, $ongName",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                ActionButton(
                  text: "Cadastrar novo caso",
                  onPress: registerNewCase,
                ),
                SizedBox(width: 16),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Color(0xffDCDCE6)),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Feather.power,
                      color: redColor,
                      size: 17,
                    ),
                    onPressed: onPress,
                  ),
                )
              ],
            ),
          );
  }
}
