import 'package:flutter/material.dart';
import 'package:plant_tree/styles/colors.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  double height = 150.0;
  double profilePicHeight = 140.0;

  @override
  Widget build(BuildContext context) {
    final top = height - profilePicHeight / 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: height,
                  width: double.infinity,
                  color: AppColors.lightgrey,
                ),
                Positioned(
                  top: top,
                  child: Container(
                    height: profilePicHeight,
                    width: 140.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        image: const DecorationImage(
                          image: AssetImage(
                              "assets/png/images/profile_picture.png"),
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(width: 5.0, color: AppColors.green)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 100.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    color: AppColors.black.withOpacity(.25),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: TextStyles.body23,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 56.0),
                        Text(
                          "Full name:",
                          style: TextStyles.body16,
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        ProfileButton(
                          icon: const Icon(Icons.account_circle_rounded),
                          buttonText: "Update Full name",
                          onPressed: () {},
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Email:",
                          style: TextStyles.body16,
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        ProfileButton(
                          icon: const Icon(Icons.email_rounded),
                          buttonText: "Update Email",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    color: AppColors.black.withOpacity(.25),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Security",
                    style: TextStyles.body23,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 56.0),
                        Text(
                          "Old Password:",
                          style: TextStyles.body16,
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "New Password:",
                          style: TextStyles.body16,
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        ProfileButton(
                          icon: const Icon(Icons.lock_rounded),
                          buttonText: "Update Password",
                          onPressed: () {},
                        ),
                        const SizedBox(height: 100.0,),
                        ProfileButton(
                          icon: const Icon(Icons.exit_to_app_rounded),
                          buttonText: "Logout",
                          onPressed: () {},
                        ),
                      ],
                      
                    ),
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
