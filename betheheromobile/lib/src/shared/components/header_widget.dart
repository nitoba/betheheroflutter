import 'package:flutter/material.dart';

Widget headerAppBar({@required Widget action}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Image.asset(
          "assets/images/logo.png",
          height: 50,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: action,
      )
    ],
  );
}
