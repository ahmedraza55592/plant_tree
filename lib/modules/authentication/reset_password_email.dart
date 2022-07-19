import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/resourses/auth_methods.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';

class ResetPasswordEmail extends StatefulWidget {
  const ResetPasswordEmail({Key? key}) : super(key: key);

  @override
  State<ResetPasswordEmail> createState() => _ResetPasswordEmailState();
}

class _ResetPasswordEmailState extends State<ResetPasswordEmail> {
  final TextEditingController _emailController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                  TextFieldWidget(
                    controller: _emailController,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 26.0.h,
                  ),
                  ButtonWidget(
                      buttonText: "Send Email",
                      onPressed: () async {
                        await _authMethods.resetPassword(context,
                            email: _emailController.text.trim());
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
