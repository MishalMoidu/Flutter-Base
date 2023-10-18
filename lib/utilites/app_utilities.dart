import 'package:flutter/material.dart';

class AppColor {
  static Color scaffoldBackGroundColor = const Color(0xffe8f1f8);
  static Color primaryColor = const Color(0xff376898);
}

class Responsive {
  static double w(double w, BuildContext context) {
    return MediaQuery.sizeOf(context).width * (w / 393);
  }

  static double h(double h, BuildContext context) {
    return MediaQuery.sizeOf(context).height * (h / 852);
  }
}
