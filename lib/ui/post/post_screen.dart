import 'package:android_setup_firebase/ui/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(60), // AppBar height
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: AppBar(
          backgroundColor: Colors.cyan,
          automaticallyImplyLeading: false,
          title: const Text('Home_ Screen'),
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Get.to(() => LoginScreen());
                  });
                },
                icon: Icon(Icons.logout))
          ],
        ),
      ),
    ));
  }
}
