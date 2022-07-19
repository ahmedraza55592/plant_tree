import 'package:flutter/material.dart';
import 'package:plant_tree/styles/index.dart';
import 'models/disease_model.dart';

class DiseaseDetail extends StatelessWidget {
  final DiseaseItem? diseaseItems;
  const DiseaseDetail({Key? key, this.diseaseItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        title: Text(
          diseaseItems!.name!,
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
      body: Padding(
        padding: EdgeInsets.only(
            top: 25.0.h, left: 25.0.w, right: 25.0.w, bottom: 0.0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 225.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0.r),
                    image: DecorationImage(
                        image: AssetImage(diseaseItems!.image!),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 20.0.h),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(6.0.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w, top: 20.0.h),
                        child: Text(
                          diseaseItems!.name!,
                          style: TextStyles.body22
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 25.0.h),
                      Container(
                        alignment: Alignment.center,
                        height: 40.0.h,
                        width: double.infinity,
                        child: Text(
                          "Signs of Damage",
                          style: TextStyles.body22
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        color: const Color(0xffB7E797).withOpacity(.3),
                      ),
                      SizedBox(height: 20.0.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w, right: 15.0.w),
                        child: Text(diseaseItems!.signsofDamage!),
                      ),
                      SizedBox(height: 20.0.h),
                      Container(
                        alignment: Alignment.center,
                        height: 40.0.h,
                        width: double.infinity,
                        child: Text(
                          "How To Prevent",
                          style: TextStyles.body22
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        color: const Color(0xffB7E797).withOpacity(.3),
                      ),
                      SizedBox(height: 20.0.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w, right: 15.0.w),
                        child: Text(diseaseItems!.howToPrevent!),
                      ),
                      SizedBox(height: 20.0.h),
                      Container(
                        alignment: Alignment.center,
                        height: 40.0.h,
                        width: double.infinity,
                        child: Text(
                          "Signs of Damage",
                          style: TextStyles.body22
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        color: const Color(0xffB7E797).withOpacity(.3),
                      ),
                      SizedBox(height: 20.0.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w, right: 15.0.w),
                        child: Text(diseaseItems!.howToPrevent!),
                      ),
                      SizedBox(height: 20.0.h),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
