import 'dart:async';

import 'package:android_setup_firebase/ui/auth/login_screen.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    Timer(Duration(seconds: 3), () {
      Get.to(LoginScreen());
    });
  }
}
