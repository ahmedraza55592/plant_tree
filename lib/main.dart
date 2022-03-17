import 'package:plant_tree/modules/index.dart';
import 'package:flutter/material.dart';
import 'package:plant_tree/routes.dart';
import 'modules/index.dart';

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
        MyRoutes.userProfile: (context) => const UserProfile(),
        MyRoutes.libraryDetail: (context) => const LibraryDetail(),
      },
    );
  }
}