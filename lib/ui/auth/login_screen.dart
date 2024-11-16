import 'package:android_setup_firebase/components/login_buttons.dart';
import 'package:android_setup_firebase/components/textformfield.dart';
import 'package:android_setup_firebase/const/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        title: const Text('Login_screen'),
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
              icons: const Icon(Icons.password_outlined),
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
                title: 'Login',
                onpress: () {
                  FocusScope.of(context).unfocus();

                  if (_formKey.currentState!.validate()) {
                    print('Form is valid');
                    // Proceed with login logic
                  } else {
                    print('Form is not valid');
                  }
                },
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
