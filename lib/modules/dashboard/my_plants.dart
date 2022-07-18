import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
import 'package:plant_tree/modules/dashboard/models/plants_model.dart';
import 'package:plant_tree/modules/dashboard/my_plants_details.dart';
import 'package:plant_tree/modules/dashboard/resourses/firestore_methods.dart';
import 'package:plant_tree/modules/dashboard/resourses/geolocator_resource.dart';
import 'package:provider/provider.dart';

import '../../styles/index.dart';

class MyPlants extends StatefulWidget {
  const MyPlants({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  String address = "";

  Future<String> getAddress(double lat, double lng) async {
    String address = await GeoLocatorService().getAddressFromLatLong(
        latitude: lat, longitude: lng, isSubLocality: false);
    return address;
  }

  bool _isLoading = false;

  void deletePlant(String plantId) async {
    setState(() {
      _isLoading = true;
    });
    try {
      bool res = await FirestoreMethods().deletePlant(plantId);
      if (res) {
        showSnackBar(context, "Plant Removed");
        setState(() {
          _isLoading = false;
        });
      } else {
        showSnackBar(context, "Some Error Occurred");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, e.toString());
    }
  }

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
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                getAddress(snapshot.data![index].latitude!,
                        snapshot.data![index].longitude!)
                    .then((value) {
                  address = value;
                });
                return Column(
                  children: [
                    _isLoading
                        ? const Loader()
                        : Stack(
                            children: [
                              InkWell(
                                onTap: () async {
                                  String longAddress = await GeoLocatorService()
                                      .getAddressFromLatLong(
                                          latitude: snapshot.data![index].latitude!,
                                          longitude: snapshot.data![index].longitude!,
                                          isSubLocality: true);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyPlantDetails(
                                                plantInfo:
                                                    snapshot.data?[index],
                                                address: longAddress,
                                              )));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 38.0.w, vertical: 30.0.h),
                                  height: 200.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.googleButtonColor,
                                      borderRadius:
                                          BorderRadius.circular(5.0.r)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 21.0.w, right: 30.0.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name",
                                              style: TextStyles.body19,
                                            ),
                                            SizedBox(
                                              height: 10.0.h,
                                            ),
                                            Text(
                                              snapshot.data?[index].plantName ??
                                                  "No Name Existed",
                                              style: TextStyles.body13,
                                            ),
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
                                              address,
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: TextStyles.body13,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 200.h,
                                          width: 500.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(5.0.r),
                                                  bottomRight:
                                                      Radius.circular(5.0.r)),
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                          .data?[index]
                                                          .plantImageUrl ??
                                                      "No Image Found"),
                                                  fit: BoxFit.fill)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 30,
                                  right: 30,
                                  child: IconButton(
                                      onPressed: () {
                                        deletePlant(
                                            snapshot.data![index].plantId!);
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        size: 30.0.h,
                                      )))
                            ],
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
