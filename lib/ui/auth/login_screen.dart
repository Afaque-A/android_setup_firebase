import 'package:android_setup_firebase/components/login_buttons.dart';
import 'package:android_setup_firebase/components/textformfield.dart';
import 'package:android_setup_firebase/const/constant.dart';
import 'package:android_setup_firebase/ui/auth/signup_screen.dart';
import 'package:android_setup_firebase/ui/post/post_screen.dart';
import 'package:android_setup_firebase/utlis/utlis.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
            title: const Text('Login Screen'),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textfield(
              title: 'Email',
              style: const TextStyle(color: Colors.black),
              hint: emailHint,
              obscureText: false, // Email should not be obscured
              icons: const Icon(Icons.email_outlined),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              controllar: _emailController,
            ),
            const SizedBox(
              height: 5,
            ),
            textfield(
              title: 'Password',
              style: const TextStyle(color: Colors.black),
              hint: passHint,
              obscureText: true,
              icons: const Icon(Icons.lock_outlined),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controllar: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: loginButtons(
                color: buttonColor,
                title: 'Login',
                loading: loading,
                onpress: () {
                  FocusScope.of(context).unfocus();

                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    _auth
                        .signInWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim())
                        .then((value) {
                      Utlis().toastMessage(value.user!.email.toString());

                      Get.to(() => const PostScreen());
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, stackTrace) {
                      debugPrint(error.toString());
                      Utlis().toastMessage(error.toString());

                      setState(() {
                        loading = false;
                      });
                    });
                    print('Form is valid');
                    // Proceed with login logic
                  } else {
                    print('Form is not valid');
                  }
                },
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don’t have an account?'),
                TextButton(
                  onPressed: () {
                    Get.to(() => const SignupScreen());
                  },
                  child: const Text('SignUp'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
