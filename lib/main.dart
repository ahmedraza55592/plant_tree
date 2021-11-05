import 'package:plant_tree/modules/authentication/login.dart';
import 'package:plant_tree/modules/authentication/otp_screen.dart';
import 'package:plant_tree/modules/authentication/reset_password.dart';
import 'package:plant_tree/modules/authentication/reset_password_email.dart';
import 'package:plant_tree/modules/authentication/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_tree/routes.dart';

import 'modules/dashboard/homepage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
      routes: {
        MyRoutes.loginPage: (context) => const Login(),
        MyRoutes.signupPage: (context) => const SignUp(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.resetPasswordEmail: (context) => const ResetPasswordEmail(),
        MyRoutes.otpscreeen: (context) => const OTPScreen(),
        MyRoutes.resetPassword: (context) => const ResetPassword(),
      },
    );
  }
}