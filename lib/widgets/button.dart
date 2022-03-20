import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/index.dart';

class ButtonWidget extends StatefulWidget {
  final String? buttonText;
  final void Function()? onPressed;
  final bool isIcon;

  const ButtonWidget({
    Key? key,
    this.buttonText,
    this.onPressed,
    this.isIcon = false,
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
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 65.0),
        child: widget.isIcon ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/icons/plant_icon.svg",
              color: AppColors.white,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(widget.buttonText!,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(),
                    fontSize: 22.0,
                    color: AppColors.white)),
          ],
        ): Text(widget.buttonText!,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(),
                    fontSize: 22.0,
                    color: AppColors.white)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.buttonColor),
            borderRadius: BorderRadius.circular(5.0),
            color: AppColors.green),
      ),
    );
  }
}
