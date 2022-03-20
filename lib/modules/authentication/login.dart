import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/google_button.dart';
import 'package:plant_tree/widgets/index.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
                    Text("Login", style: TextStyles.primaryHeading),
                    const SizedBox(height: 8.0),
                    Text("Please enter the details to continue",
                        style: TextStyles.body15),
                    const SizedBox(height: 180.0),
                    TextFieldWidget(
                      controller: emailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10.0),
                    TextFieldWidget(
                      controller: passwordController,
                      obscureText: true,
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 30.0),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, '/resetPasswordEmail'),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Forgot Password? ",
                          style: TextStyles.body13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 26.0),
                    ButtonWidget(
                      buttonText: "Login",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/homepage');
                      },
                    ),
                    const SizedBox(height: 45.0),
                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: "Don't Have an Account? ",
                            style: TextStyles.body13,
                            children: [
                              TextSpan(
                                  text: "Register",
                                  style: TextStyles.body13,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.pushReplacementNamed(
                                            context, '/signup')),
                            ]),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "OR",
                        style: TextStyles.body13,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    GoogleButton(
                      buttonText: "Continue With Google",
                      onPressed: () {
                        debugPrint("Google button pressed");
                      },
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
