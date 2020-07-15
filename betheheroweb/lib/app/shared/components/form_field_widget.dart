import 'package:flutter/material.dart';
import '../constants.dart';

class FormFieldWidget extends StatelessWidget {
  final String hintText;

  final int maxLines;
  final TextEditingController controller;
  final double width;

  const FormFieldWidget({
    Key key,
    @required this.hintText,
    this.width = 300,
    this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: controller,
          cursorColor: redColor,
          maxLines: maxLines,
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: redColor,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
