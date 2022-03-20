import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/index.dart';

class TextButtonWidget extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const TextButtonWidget({Key? key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text!,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            color: AppColors.black.withOpacity(.5),
            fontSize: 15.0,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
