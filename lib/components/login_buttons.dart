import 'package:android_setup_firebase/const/constant.dart';

Widget loginButtons({
  color,
  String? title,
  onpress,
  textColor,
}) {
  return SizedBox(
    width: 400,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan,
      ),
      onPressed: onpress,
      child: title!.text.color(textColor).size(15).make(),
    ),
  );
}
