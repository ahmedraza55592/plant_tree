import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/index.dart';

class ButtonWidget extends StatefulWidget {
  final String? buttonText;
  final void Function()? onPressed;
  final bool isIcon;
  final String? iconName;

  const ButtonWidget({
    Key? key,
    this.buttonText,
    this.onPressed,
    this.isIcon = false,
    this.iconName,
  }) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 14.0.h),
        margin: EdgeInsets.symmetric(horizontal: 65.0.w),
        child: widget.isIcon
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    widget.iconName!,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    width: 10.0.w,
                  ),
                  Text(widget.buttonText!,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(),
                          fontSize: 22.0.sp,
                          color: AppColors.white)),
                ],
              )
            : Text(widget.buttonText!,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(),
                    fontSize: 22.0.sp,
                    color: AppColors.white)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.buttonColor),
            borderRadius: BorderRadius.circular(5.0.r),
            color: AppColors.green),
      ),
    );
  }
}
