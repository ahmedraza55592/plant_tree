import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/models/user.dart';
import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
// import 'package:plant_tree/styles/colors.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';
import 'package:provider/provider.dart';

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
    final User user = Provider.of<UserProvider>(context).getUser;
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
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.black,
                          size: 30.0,
                        )),
                  ),
                  height: height,
                  width: double.infinity,
                  color: AppColors.lightgrey,
                ),
                Positioned(
                  top: top,
                  child: Stack(
                    children: [
                      Container(
                        height: profilePicHeight,
                        width: 140.0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            image: user.photoUrl == "" ? const DecorationImage(
                              image: AssetImage(
                                  "assets/png/images/profile_picture.png"),
                            ) : DecorationImage(image: NetworkImage(user.photoUrl!, scale: 0.7)),
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 4.0, color: AppColors.green)),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2.0, color: AppColors.green)),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.edit_rounded,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      )
                    ],
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
                    style: TextStyles.body22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 56.0),
                        Text(
                          user.name!,
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
                          user.email!,
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
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
                    style: TextStyles.body22,
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
                        const SizedBox(
                          height: 100.0,
                        ),
                        ProfileButton(
                          icon: const Icon(Icons.exit_to_app_rounded),
                          buttonText: "Logout",
                          onPressed: () =>
                              Navigator.pushReplacementNamed(context, '/login'),
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
