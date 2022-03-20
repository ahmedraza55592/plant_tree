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

  static TextStyle get body22 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 22.0,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );

  static TextStyle get body19 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 19.0,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
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

  static TextStyle get primaryHeading => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 30.0,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );
  
  static TextStyle get body15 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(.5),
          fontSize: 15.0,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );
  
  static TextStyle get body13 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(.5),
          fontSize: 13.0,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );
}
