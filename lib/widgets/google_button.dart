import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svg/icons/google_button.svg"),
            const SizedBox(width: 10.0),
            Text(widget.buttonText!,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(),
                    fontSize: 18.0,
                    color: AppColors.black)),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: AppColors.googleButtonColor),
      ),
    );
  }
}
