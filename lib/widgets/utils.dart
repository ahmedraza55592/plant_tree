import 'package:flutter/material.dart';
import '../styles/index.dart';

showTermsAndConditionsBox(BuildContext context) async {
  return showDialog(
      context: context,
      barrierColor: Colors.transparent.withOpacity(.7),
      builder: (_) => SimpleDialog(
            titlePadding:
                EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 20.0.h),
            elevation: 2.0,
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r)),
            title: Text(
              'Terms and Conditons',
              style: TextStyles.body19,
            ),
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                      child: Text(
                        "1. This is First Term, The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "2. This is Second Term. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "3. This is Third Term. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        style: TextStyles.body15,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "4. This is Fourth Term. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "5. This is Fifth Term, The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "6. This is Sixth Term, The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                  ])),
            ],
          ));
}
