import 'dart:async';

import 'package:android_setup_firebase/ui/auth/login_screen.dart';
import 'package:android_setup_firebase/ui/post/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Get.to(const PostScreen());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.to(const LoginScreen());
      });
    }
  }
}
