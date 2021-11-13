import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/colors.dart';

abstract class TextStyles {
  static TextStyle get body => GoogleFonts.roboto(
        textStyle: TextStyle(
      color: AppColors.black,
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
    ));

  static TextStyle get body23 => GoogleFonts.roboto(
        textStyle: TextStyle(
      color: AppColors.black,
      fontSize: 23.0,
      fontStyle: FontStyle.normal,
    ));

  static TextStyle get forgotPassword {
    return GoogleFonts.sourceSansPro(
      textStyle: TextStyle(
        color: AppColors.black,
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      )
    );
  }

  static TextStyle get primaryHeading {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontSize: 30.0,
      fontStyle: FontStyle.normal,
    ));
  }
}
