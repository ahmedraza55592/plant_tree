import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 105),
                    Text("Register", style: TextStyles.primaryHeading),
                    const SizedBox(height: 50.0),
                    Text("Name", style: TextStyles.body),
                    TextFieldWidget(
                      controller: nameController,
                      hintText: "Enter your name",
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 28.0),
                    Text("Email", style: TextStyles.body),
                    TextFieldWidget(
                      controller: emailController,
                      hintText: "Enter your Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 28.0),
                    Text("Password", style: TextStyles.body),
                    TextFieldWidget(
                      controller: passwordController,
                      obscureText: true,
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 28.0),
                    Text("Confirm Password", style: TextStyles.body),
                    const TextFieldWidget(
                      obscureText: true,
                      hintText: "Confirm Password",
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 28.0),
                    ButtonWidget(
                      buttonText: "Register",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/homepage');
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, left: 60.0, bottom: 14.0),
                      child: RichText(
                        text: TextSpan(
                            text: "Already Have an Account? ",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: AppColors.black, fontSize: 16.0),
                            ),
                            children: [
                              TextSpan(
                                  text: "Login",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.pushReplacementNamed(
                                            context, '/login')),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
