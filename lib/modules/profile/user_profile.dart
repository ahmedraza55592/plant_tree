import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_tree/modules/authentication/models/user.dart';
import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
// import 'package:plant_tree/styles/colors.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';

import '../../routes.dart';
import '../authentication/resourses/auth_methods.dart';
import '../dashboard/resourses/storage_methods.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // double height = 150.0;
  // double profilePicHeight = 140.0;

  // Uint8List? _file;

  // void addImage() async {
  //   // Navigator.pop(context);
  //   Uint8List file = await pickImage(ImageSource.gallery);

  //   setState(() {
  //     _file = file;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    // final top = height - profilePicHeight / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name!,
          style: TextStyles.body22,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.appBarColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0.h,
            ),
            Stack(
              children: [
                user.photoUrl == ""
                    ? const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://i.stack.imgur.com/l60Hf.png',
                        ),
                        radius: 64,
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                          user.photoUrl!,
                        ),
                        radius: 64,
                      ),
                Positioned(
                  bottom: -8,
                  left: 80,
                  child: IconButton(
                    onPressed: () async {
                      Uint8List file = await pickImage(ImageSource.gallery);
                      // setState(() {
                      //   _file = file;
                      // });

                      String plantImageUrl = await StorageMethods()
                          .uploadImageToFirebaseStorage('profilePics', file, false);
                      print(plantImageUrl);
                      print("before");
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .update({"photoUrl": plantImageUrl});
                      print("after");
                    },
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      size: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            // Stack(
            //   clipBehavior: Clip.none,
            //   alignment: Alignment.center,
            //   children: [
            //     Container(
            //       alignment: Alignment.topLeft,
            //       child: Padding(
            //         padding: const EdgeInsets.only(
            //           top: 20.0,
            //         ),
            //         child: IconButton(
            //             onPressed: () => Navigator.pop(context),
            //             icon: Icon(
            //               Icons.arrow_back,
            //               color: AppColors.black,
            //               size: 30.0,
            //             )),
            //       ),
            //       height: height,
            //       width: double.infinity,
            //       color: AppColors.lightgrey,
            //     ),
            //     Positioned(
            //       top: top,
            //       child: Stack(
            //         children: [
            //           Container(
            //             height: profilePicHeight,
            //             width: 130.0,
            //             decoration: BoxDecoration(
            //                 color: Theme.of(context).scaffoldBackgroundColor,
            //                 image:DecorationImage(
            //                   image: user.photoUrl == "" ? const NetworkImage(
            //                       'https://i.stack.imgur.com/l60Hf.png', scale: 0.1) : NetworkImage(user.photoUrl!, scale: 0.8),
            //                 ),
            //                 shape: BoxShape.circle,
            //                 border:
            //                     Border.all(width: 2.0, color: AppColors.green)),
            //           ),
            //           Positioned(
            //             right: 0,
            //             child: Container(
            //               height: 40.0,
            //               width: 40.0,
            //               decoration: BoxDecoration(
            //                   color: AppColors.white,
            //                   shape: BoxShape.circle,
            //                   border: Border.all(
            //                       width: 1.0, color: AppColors.green)),
            //               child: InkWell(
            //                 onTap: () {},
            //                 child: Icon(
            //                   Icons.edit_rounded,
            //                   color: AppColors.green,
            //                 ),
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(height: 50.0.h),
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
                        SizedBox(height: 20.0.h),
                        Text(
                          user.name!,
                          style: TextStyles.body19
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        // ProfileButton(
                        //   icon: const Icon(Icons.account_circle_rounded),
                        //   buttonText: "Update Full name",
                        //   onPressed: () {},
                        // ),
                        // const SizedBox(height: 20.0),
                        Text(
                          user.email!,
                          style: TextStyles.body19,
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        // ProfileButton(
                        //   icon: const Icon(Icons.email_rounded),
                        //   buttonText: "Update Email",
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0.h),
            ButtonWidget(
              buttonText: "Logout",
              onPressed: (() {
                AuthMethods().signOut();
                Navigator.pushReplacementNamed(context, MyRoutes.loginPage);
              }),
            ),
            // Container(
            //   margin:
            //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 13.0, vertical: 16.0),
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).scaffoldBackgroundColor,
            //     boxShadow: [
            //       BoxShadow(
            //         blurRadius: 2.0,
            //         spreadRadius: 1.0,
            //         color: AppColors.black.withOpacity(.25),
            //         offset: const Offset(0, 2),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Security",
            //         style: TextStyles.body22,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 20.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(height: 56.0.h),
            //             // Text(
            //             //   "Old Password:",
            //             //   style: TextStyles.body16,
            //             // ),
            //             // const Divider(
            //             //   thickness: 1.0,
            //             // ),
            //             // const SizedBox(height: 10.0),
            //             // Text(
            //             //   "New Password:",
            //             //   style: TextStyles.body16,
            //             // ),
            //             // const Divider(
            //             //   thickness: 1.0,
            //             // ),
            //             // ProfileButton(
            //             //   icon: const Icon(Icons.lock_rounded),
            //             //   buttonText: "Update Password",
            //             //   onPressed: () {},
            //             // ),
            //             // const SizedBox(
            //             //   height: 100.0,
            //             // ),
            //             ProfileButton(
            //               icon: const Icon(Icons.exit_to_app_rounded),
            //               buttonText: "Logout",
            //               onPressed: () =>
            //                   Navigator.pushReplacementNamed(context, '/login'),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
