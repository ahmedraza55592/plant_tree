import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Text("Register", style: TextStyles.primaryHeading),
                    const SizedBox(height: 8.0),
                    Text("Please enter the details to continue",
                        style: TextStyles.body15),
                    const SizedBox(height: 180.0),
                    TextFieldWidget(
                      controller: nameController,
                      hintText: "Name",
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 28.0),
                    TextFieldWidget(
                      controller: emailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 28.0),
                    TextFieldWidget(
                      controller: passwordController,
                      obscureText: true,
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 28.0),
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
                    const SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an account? ",
                            style: TextStyles.body13,
                            children: [
                              TextSpan(
                                  text: "Login",
                                  style: TextStyles.body13,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.pushReplacementNamed(
                                            context, '/login')),
                            ]),
                      ),
                    ),
                    const SizedBox(height: 140.0),
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
