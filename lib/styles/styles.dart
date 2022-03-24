import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/colors.dart';
import 'package:image_picker/image_picker.dart';

//Snank Bar
void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

// Pick image from Gallery or From Mobile

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  debugPrint("No Image has been Selected");
}

abstract class TextStyles {
  static TextStyle get body => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 14.0.sp,
          fontStyle: FontStyle.normal,
        ),
      );

  static TextStyle get body22 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 22.0.sp,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );

  static TextStyle get body19 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 19.0.sp,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );
  static TextStyle get body16 => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 16.0.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle get primaryHeading => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 30.0.sp,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );

  static TextStyle get body15 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(.5),
          fontSize: 15.0.sp,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );

  static TextStyle get body13 => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(.5),
          fontSize: 13.0.sp,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      );
}
