import 'package:flutter/material.dart';
import '../../styles/index.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

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
          "Feedback",
          style: TextStyles.body22,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 25.0.h, left: 25.0.w, right: 25.0.w, bottom: 0.0.h),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0.r),
              color: const Color(0xffF0F0F0),
            ),
            child: Column(
              children: [
                SizedBox(height: 10.0.h),
                Container(
                  alignment: Alignment.center,
                  height: 40.0.h,
                  width: double.infinity,
                  child: Text(
                    "Feedback",
                    style: TextStyles.body16.copyWith(
                        fontSize: 22.sp,
                        letterSpacing: .9,
                        fontWeight: FontWeight.w600),
                  ),
                  color: const Color(0xffB7E797).withOpacity(.3),
                ),
                SizedBox(height: 5.0.h),
                Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "For further queries, please contact us at:\n\nplantatree@gmail.com ",
                        style: TextStyles.body16
                            .copyWith(fontSize: 20.sp, letterSpacing: .2),
                      ),
                      SizedBox(height: 10.0.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //             alignment: Alignment.center,
      //             height: 40.0.h,
      //             width: double.infinity,
      //             child: Text(
      //               "Feedback",
      //               style: TextStyles.body22,
      //             ),
      //             color: const Color(0xffB7E797).withOpacity(.3),
      //           ),
      //           SizedBox(height: 5.0.h),
      //           Padding(
      //             padding: EdgeInsets.all(12.0.h),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "For further queries, please contact us at: ",
      //                   style: TextStyles.body15,
      //                 ),

      //               ],
      //             ),
      //           )
      //   ],
      // ),
    );
  }
}
