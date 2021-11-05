import 'package:flutter/material.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';

class ResetPasswordEmail extends StatelessWidget {
  const ResetPasswordEmail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        backgroundColor: AppColors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    "Reset Password",
                    style: TextStyles.primaryHeading,
                  ),
                  const SizedBox(height: 85.0),
                  Text("Email", style: TextStyles.body),
                  const TextFieldWidget(
                    hintText: "Enter your email",              
                    textInputType: TextInputType.emailAddress,      
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  ButtonWidget(
                    buttonText: "Send Email",
                    onPressed: () {
                      Navigator.pushNamed(context, '/otpScreen');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
