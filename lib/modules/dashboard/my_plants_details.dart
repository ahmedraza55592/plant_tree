import 'package:flutter/material.dart';
import 'package:plant_tree/modules/dashboard/models/plants_model.dart';
import 'package:plant_tree/styles/index.dart';

class MyPlantDetails extends StatelessWidget {
  final Plants? plantInfo;
  final String address;
  const MyPlantDetails({Key? key, this.plantInfo, required this.address})
      : super(key: key);

  // DateTime getTime() {
  //   DateTime time = plantInfo!.datePublished!;
  //   print(time);
  //   return time;
  // }

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
          "My Plants",
          style: TextStyles.body22,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 25.0.h, left: 25.0.w, right: 25.0.w, bottom: 0.0.h),
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xffF0F0F0),
            child: Column(
              children: [
                Container(
                  height: 225.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0.r),
                      image: DecorationImage(
                          image: NetworkImage(plantInfo!.plantImageUrl!),
                          fit: BoxFit.fill)),
                ),
                SizedBox(height: 40.0.h),
                Container(
                  alignment: Alignment.center,
                  height: 40.0.h,
                  width: double.infinity,
                  child: Text(
                    "Plant Details",
                    style: TextStyles.body22,
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
                        plantInfo!.plantName!,
                        style: TextStyles.body15,
                      ),
                      Divider(
                        thickness: 1.0.w,
                      ),
                      Text(
                        "${plantInfo!.datePublished!.hour}:${plantInfo!.datePublished!.minute}:${plantInfo!.datePublished!.second} ${plantInfo!.datePublished!.timeZoneName} ",
                        style: TextStyles.body15,
                      ),
                      Divider(
                        thickness: 1.0.w,
                      ),
                      Text(
                        "${plantInfo!.datePublished!.month}-${plantInfo!.datePublished!.day}-${plantInfo!.datePublished!.year}",
                        style: TextStyles.body15,
                      ),
                      Divider(
                        thickness: 1.0.w,
                      ),
                      Text(
                        address,
                        style: TextStyles.body15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
