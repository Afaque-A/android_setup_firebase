import 'package:android_setup_firebase/const/constant.dart';

Widget textfield({String? title, String? hint, controllar, icons, required TextStyle style}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(textFormFieldColor).size(18).make(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: controllar,
          decoration: InputDecoration(
              prefixIcon: icons,
              
              hintText: hint,

              // fillColor: textFormFieldColor,
              // filled: true,
              isDense: true,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              // border: UnderlineInputBorder(
              //     borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff5f5f5f)),
              )),
        ),
      ),
      5.heightBox,
    ],
  );
}
