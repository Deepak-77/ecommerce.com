import 'package:flutter/material.dart';
//import 'package:impageuploader/common/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.controller,
      this.keyBoardType,
      this.hintText,
      this.icon,
      this.validator});

  TextEditingController? controller;

  TextInputType? keyBoardType;
  FormFieldValidator? validator;
  String? hintText;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
             //// borderSide: const BorderSide(color: CustomTheme.black))
             ),
    )
      );
  }
}
