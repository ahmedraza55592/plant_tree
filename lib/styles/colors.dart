import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get black => const Color(0xff333333);
  static Color get green => const Color(0xff0A7A37);
  static Color get white => const Color(0xffFFFFFF);
  static Color get lightgrey => const Color(0xffafafaf);
  static Color get lightBlack => const Color(0xff8D7C7C);
  static List<Color> get buttonColor => const [
        Color(0xff9AE382),
        Color(0xff0A7A37),
      ];
  static Color get googleButtonColor => const Color(0xffF5F5F5);
  static Color get errorColor => Colors.red;
  static List<Color> get appBarColor => const [
        Color(0xff96E080),
        Color(0xff0D7C38),
      ];

  // static Color get lightwhite => const Color(0xffEFE7E7);
  // static Color get facebook => const Color(0xFF3b5998);
  // static Color get google => const Color(0xFF4285f4);
}
