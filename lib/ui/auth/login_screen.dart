import 'package:android_setup_firebase/components/login_buttons.dart';
import 'package:android_setup_firebase/components/textformfield.dart';
import 'package:android_setup_firebase/const/constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        title: const Text('Login_screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textfield(
            title: 'Email',
            style: TextStyle(color: Colors.black),
            hint: emailHint,
            icons: const Icon(Icons.email_outlined),
          ),
          5.heightBox,
          textfield(
            title: 'Password',
            style: TextStyle(color: Colors.green),
            hint: passHint,
            icons: const Icon(Icons.password),
          ),
          10.heightBox,
          Center(
            child: loginButtons(
              color: buttonColor,
              title: 'Login',
              onpress: () {},
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
