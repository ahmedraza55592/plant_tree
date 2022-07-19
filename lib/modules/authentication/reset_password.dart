// import 'package:flutter/material.dart';
// import 'package:plant_tree/styles/index.dart';
// import 'package:plant_tree/widgets/index.dart';

// class ResetPassword extends StatelessWidget {
//   const ResetPassword({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: AppColors.black,
//         ),
//         backgroundColor: AppColors.white,
//         elevation: 0.0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 35.0,
//                   ),
//                   Text(
//                     "Reset Password",
//                     style: TextStyles.primaryHeading,
//                   ),
//                   const SizedBox(height: 85.0),
//                   Text("New Password", style: TextStyles.body),
//                   const TextFieldWidget(
//                     hintText: "Enter new password",
//                     textInputType: TextInputType.visiblePassword,
//                     obscureText: true,
//                   ),
//                   const SizedBox(height: 28.0),
//                   Text("Confirm New Password", style: TextStyles.body),
//                   const TextFieldWidget(
//                     hintText: "Enter new password again",
//                     textInputType: TextInputType.visiblePassword,
//                     obscureText: true,
//                   ),
//                   const SizedBox(
//                     height: 35.0,
//                   ),
//                   ButtonWidget(
//                     buttonText: "Reset Password",
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/homepage');
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
