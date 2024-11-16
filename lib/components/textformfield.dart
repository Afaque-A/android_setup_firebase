import 'package:android_setup_firebase/const/constant.dart';

Widget textfield({
  String? title,
  String? hint,
  required TextEditingController? controllar,
  required Icon? icons,
  required TextStyle style,
  required bool obscureText,
  required String? Function(dynamic value) validate,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null) title.text.color(Colors.teal).size(15).make(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: controllar,
          obscureText: obscureText,
          style: style,
          validator: validate, // Connect the validation logic here
          decoration: InputDecoration(
            prefixIcon: icons,
            hintText: hint,
            isDense: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff5f5f5f)),
            ),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}
