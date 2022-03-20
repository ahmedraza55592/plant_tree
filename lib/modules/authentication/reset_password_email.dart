import 'package:flutter/material.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';

class ResetPasswordEmail extends StatelessWidget {
  const ResetPasswordEmail({Key? key}) : super(key: key);

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
      backgroundColor: AppColors.white,
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
                  Text("Please enter the details to continue",
                      style: TextStyles.body15),
                  const SizedBox(height: 75.0),
                  const TextFieldWidget(
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ButtonWidget(
                    buttonText: "Send Email",
                    onPressed: () {
                      debugPrint("Send Email button pressed");
                      // Navigator.pushNamed(context, '/otpScreen');
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
