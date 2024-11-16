import 'package:android_setup_firebase/const/constant.dart';

Widget loginButtons({
  color,
  String? title,
  onpress,
  textColor,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
    ),
    onPressed: onpress,
    child: title!.text.color(textColor).size(15).make(),
  );
}
