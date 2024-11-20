import 'package:android_setup_firebase/components/login_buttons.dart';
import 'package:android_setup_firebase/components/textformfield.dart';
import 'package:android_setup_firebase/const/constant.dart';
import 'package:android_setup_firebase/ui/auth/login_screen.dart';
import 'package:android_setup_firebase/utlis/utlis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

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
            title: const Text('Sign_up Screen'),
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
            5.heightBox,
            textfield(
              title: 'password',
              style: const TextStyle(color: Colors.black),
              hint: passHint,
              obscureText: true, // Email should not be obscured
              icons: const Icon(Icons.lock_outlined),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controllar: _passwordController,
            ),
            10.heightBox,
            Center(
              child: loginButtons(
                color: buttonColor,
                title: 'SignUp',
                loading: loading,
                onpress: () {
                  FocusScope.of(context).unfocus();

                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    _auth
                        .createUserWithEmailAndPassword(
                            email: _emailController.text.toString(),
                            password: _passwordController.text.toString())
                        .then((value) {
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, StackTrace) {
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
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('already have an account?'),
                TextButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
