import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:toast/toast.dart';

const Color backgroundColor = Color(0xffF0F0F5);
const Color redColor = Color(0xffE02041);
const Color borderColor = Color(0xffDCDCE6);

showToast(BuildContext context, {String msgToast, duration = 1}) {
  Toast.show(msgToast, context, backgroundColor: redColor, duration: duration);
}

showLoader({String msg}) {
  Modular.to.showDialog(
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: backgroundColor,
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(redColor),
            )),
            SizedBox(height: 20),
            Text(msg),
          ],
        ),
      ),
    ),
  );
}

hideLoader(BuildContext context) {
  Navigator.of(context).pop();
}
