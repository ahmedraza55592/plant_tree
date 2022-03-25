import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
import 'package:plant_tree/modules/dashboard/models/plants_model.dart';
import 'package:provider/provider.dart';

import '../../styles/index.dart';

class MyPlants extends StatelessWidget {
  const MyPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Plants",
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
      body: StreamBuilder<List<Plants>>(
          stream: userInfo.getUserPlantInfo,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 38.0.w, vertical: 30.0.h),
                      height: 200.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                          color: AppColors.googleButtonColor,
                          borderRadius: BorderRadius.circular(5.0.r)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 21.0.w, right: 50.0.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyles.body19,
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Text(snapshot.data?[index].plantName ??
                                    "No Name Existed", style: TextStyles.body13,),
                                SizedBox(
                                  height: 15.0.h,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyles.body19,
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Text(
                                  "Karachi, Pakistan",
                                  style: TextStyles.body13,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 200.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.0.r), bottomRight: Radius.circular(5.0.r) ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data?[index].plantImageUrl ??
                                              "No Image Found"), fit: BoxFit.fill)),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Text("Lenght : ${snapshot.data?.length}"),
                    // Text(
                    //     "Address is: ${snapshot.data?[index].latitude} && ${snapshot.data?[index].latitude}"),
                    // Text("Address is ${userInfo.address}"),
                    // Text(
                    //     "Plants Name by ${snapshot.data?[index].userName} and Plant Name ${snapshot.data?[index].plantName}"),
                  ],
                );
              },
            );
          }),
    );
  }
}
