import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      this.borderside,
      required this.text,
      required this.width,
      required this.navigation,
      this.color,
      this.textColor,
      this.height})
      : super(key: key);
  final String text;
  final double width;
  final double? height;
  final VoidCallback navigation;
  final Color? color;
  final Color? textColor;
  final BorderSide? borderside;
  // final Color sideColors;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: navigation,
      shape: RoundedRectangleBorder(
          side: borderside ?? BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      height: height ?? 56,
      minWidth: width,
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}
