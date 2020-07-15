import 'package:flutter/material.dart';

import '../constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final double minWidth;
  const ActionButton({
    Key key,
    @required this.text,
    @required this.onPress,
    this.minWidth = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: redColor,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: onPress,
    );
  }
}
