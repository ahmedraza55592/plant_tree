import 'package:flutter/material.dart';
import 'package:plant_tree/styles/colors.dart';
import 'package:plant_tree/styles/text_style.dart';

class TextFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;

  const TextFieldWidget(
      {Key? key,
      this.obscureText=false,
      this.textInputType,
      this.controller,
      this.hintText})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      controller: widget.controller,
      obscureText: widget.obscureText,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.body13,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black.withOpacity(.5))),
        focusedBorder: UnderlineInputBorder(
            
            borderSide: BorderSide(color: AppColors.black)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor)),
      ),
    );
  }
}
