import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg, Color textColor) {
  // Fluttertoast.showToast(
  //   msg: msg,
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.CENTER,
  //   timeInSecForIosWeb: 1,
  //   textColor: Colors.red,
  // );
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: msg, backgroundColor: textColor);
}
