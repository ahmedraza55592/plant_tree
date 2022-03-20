import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_tree/modules/authentication/models/user.dart';
import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
import 'package:plant_tree/modules/authentication/resourses/auth_methods.dart';
import 'package:plant_tree/routes.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethods.signUp(context,
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text);
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
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 100.0.h),
                            Text("Register", style: TextStyles.primaryHeading),
                            SizedBox(height: 16.0.h),
                            Text("Please enter the details to continue",
                                style: TextStyles.body15),
                            SizedBox(height: 150.0.h),
                            TextFieldWidget(
                              controller: nameController,
                              hintText: "Name",
                              textInputType: TextInputType.name,
                            ),
                            SizedBox(height: 40.0.h),
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
                            SizedBox(height: 40.0.h),
                            TextFieldWidget(
                              validator: (value) {
                                if (value != passwordController.text) {
                                  return "Password must be same as above";
                                }
                                return null;
                              },
                              obscureText: true,
                              hintText: "Confirm Password",
                              textInputType: TextInputType.visiblePassword,
                            ),
                            SizedBox(height: 26.0.h),
                            ButtonWidget(
                              buttonText: "Register",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                            ),
                            SizedBox(height: 25.0.h),
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
                                                    context,
                                                    MyRoutes.loginPage)),
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
      ),
    );
  }
}
