import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/index.dart';

class GoogleButton extends StatefulWidget {
  final String? buttonText;
  final void Function()? onPressed;

  const GoogleButton({
    Key? key,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15.0.h),
        margin: EdgeInsets.symmetric(horizontal: 42.0.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svg/icons/google_button.svg"),
            SizedBox(width: 12.46.w),
            Text(widget.buttonText!,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(),
                    fontSize: 18.0.sp,
                    color: AppColors.black)),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0.r),
            color: AppColors.googleButtonColor),
      ),
    );
  }
}
