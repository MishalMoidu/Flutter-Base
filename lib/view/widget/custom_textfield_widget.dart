import 'package:flutter/material.dart';

import '../../utilites/app_utilities.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.w(30, context)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: Responsive.w(18, context),
                color: AppColor.primaryColor,
                fontFamily: "Poppins"),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            )),
      ),
    );
  }
}
