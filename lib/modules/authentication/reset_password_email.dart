import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.0.h),
                  Text(
                    "Reset Password",
                    style: TextStyles.primaryHeading,
                  ),
                  SizedBox(height: 16.0.h),
                  Text("Please enter the details to continue",
                      style: TextStyles.body15),
                  SizedBox(height: 150.0.h),
                  const TextFieldWidget(
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 26.0.h,
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
