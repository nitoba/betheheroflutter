import 'package:BeTheHeroWeb/app/shared/constants.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final double minWidth;
  const CancelButton({
    Key key,
    @required this.text,
    @required this.onPress,
    this.minWidth = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: minWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: borderColor),
      ),
      child: MaterialButton(
        height: 50,
        minWidth: minWidth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
