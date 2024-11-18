import 'package:android_setup_firebase/const/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utlis {
  void fluttertoast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
