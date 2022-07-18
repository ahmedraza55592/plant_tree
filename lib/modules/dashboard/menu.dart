import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/resourses/auth_methods.dart';
import 'package:plant_tree/routes.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';
import 'package:plant_tree/widgets/utils.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.appBarColor),
          ),
        ),
        title: Text(
          "Menu",
          style: TextStyles.body22,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 25.0.h, left: 23.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Legal",
                style: TextStyles.body19,
              ),
              SizedBox(
                height: 25.0.h,
              ),
              TextButtonWidget(
                text: "Privacy Policy",
                onPressed: () => showTermsAndConditionsBox(context),
              ),
              const Divider(
                thickness: 1.0,
              ),
              TextButtonWidget(
                  text: "Terms & Conditions",
                  onPressed: () => showTermsAndConditionsBox(context)),
              Divider(
                thickness: 1.0.w,
              ),
              SizedBox(
                height: 25.0.h,
              ),
              Text(
                "Communcation",
                style: TextStyles.body19,
              ),
              SizedBox(
                height: 25.0.h,
              ),
              TextButtonWidget(
                text: "FAQ",
                onPressed: () => Navigator.pushNamed(context, MyRoutes.faq),
              ),
              Divider(
                thickness: 1.0.w,
              ),
              TextButtonWidget(
                text: "Feedback",
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.myplantdetails);
                },
              ),
              Divider(
                thickness: 1.0.w,
              ),
              TextButtonWidget(
                  text: "Logout",
                  onPressed: () {
                    AuthMethods().signOut();
                    Navigator.pushReplacementNamed(context, MyRoutes.loginPage);
                  }),
              Divider(
                thickness: 1.0.w,
              ),
              SizedBox(
                height: 25.0.h,
              ),
              Text(
                "Profile",
                style: TextStyles.body19,
              ),
              SizedBox(
                height: 25.0.h,
              ),
              TextButtonWidget(
                text: "User Setting",
                onPressed: () => Navigator.pushNamed(context, '/userProfile'),
              ),
              Divider(
                thickness: 1.0.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
