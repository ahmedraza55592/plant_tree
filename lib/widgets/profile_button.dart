import 'package:plant_tree/styles/index.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String? buttonText;
  final void Function()? onPressed;
  final Widget? icon;
  const ProfileButton({Key? key, this.buttonText, this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            const SizedBox(width: 5.0),
            Text(
              buttonText!,
              style: TextStyles.body16,
            ),
          ],
        ),
        decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    color: AppColors.black.withOpacity(.2),
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(5.0)
              ),
      ),
    );
  }
}
