import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: msg);
}
