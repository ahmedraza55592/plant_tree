import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/colors.dart';

abstract class TextStyles {
  static TextStyle get body => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
        ),
      );

  static TextStyle get body23 => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 23.0,
          fontStyle: FontStyle.normal,
        ),
      );

  static TextStyle get body19 => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.lightBlack,
          fontSize: 19.0,
          fontStyle: FontStyle.normal,
        ),
      );
  static TextStyle get body16 => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 16.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle get primaryHeading => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 30.0,
          fontStyle: FontStyle.normal,
        ),
      );
}
