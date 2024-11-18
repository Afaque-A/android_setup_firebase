import 'package:android_setup_firebase/const/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utlis {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
