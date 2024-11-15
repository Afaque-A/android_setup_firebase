import 'package:android_setup_firebase/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('splash_screen'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'splash screen',
          style: TextStyle(fontSize: 30, color: Colors.amber),
        ),
      ),
    );
  }
}
