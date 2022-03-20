import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_tree/modules/authentication/resourses/auth_methods.dart';
import 'package:plant_tree/routes.dart';
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
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  loginUser() async {
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethods.singIn(context,
        email: emailController.text, password: passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (res) {
      Navigator.pushReplacementNamed(context, MyRoutes.homePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.green,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100.0.h),
                          Text("Login", style: TextStyles.primaryHeading),
                          SizedBox(height: 16.0.h),
                          Text("Please enter the details to continue",
                              style: TextStyles.body15),
                          SizedBox(height: 150.0.h),
                          TextFieldWidget(
                            controller: emailController,
                            hintText: "Email",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 40.0.h),
                          TextFieldWidget(
                            controller: passwordController,
                            obscureText: true,
                            hintText: "Password",
                            textInputType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 26.0.h),

                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, MyRoutes.resetPasswordEmail),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Forgot Password? ",
                                style: TextStyles.body13,
                              ),
                            ),
                          ),
                          SizedBox(height: 26.0.h),
                          ButtonWidget(
                            buttonText: "Login",
                            onPressed: loginUser,
                          ),
                          SizedBox(height: 45.0.h),
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
                                                  context,
                                                  MyRoutes.signupPage)),
                                  ]),
                            ),
                          ),
                          SizedBox(height: 30.0.h),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "OR",
                              style: TextStyles.body13,
                            ),
                          ),
                          SizedBox(height: 24.0.h),
                          GoogleButton(
                            buttonText: "Continue With Google",
                            onPressed: () async {
                              bool res =
                                  await _authMethods.signInWithGoogle(context);
                              if (res) {
                                Navigator.pushReplacementNamed(context, MyRoutes.homePage);
                              }
                            },
                            // onPressed: () {

                            //   debugPrint("Google button pressed");
                            // },
                          ),
                          // SizedBox(height: 140.0.h),
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
