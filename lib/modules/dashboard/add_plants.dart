import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
import 'package:plant_tree/modules/dashboard/add_location.dart';
import 'package:plant_tree/modules/dashboard/resourses/firestore_methods.dart';

import '../../styles/index.dart';
import '../../widgets/index.dart';

class AddPlant extends StatefulWidget {
  const AddPlant({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  final TextEditingController _plantNameController = TextEditingController();
  Uint8List? _file;
  bool _isLoading = false;
  // final GeoLocatorService _geoLocatorService = GeoLocatorService();

  // String address = "Some Address";

  // Future<void> getAddressFromLatLong(
  //     {required double latitude, required double longitude}) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(latitude, longitude);
  //   Placemark place = placemarks[0];
  //   address =
  //       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);

  //   getAddressFromLatLong(
  //       latitude: userProvider.currentMapPosition.latitude,
  //       longitude: userProvider.currentMapPosition.longitude);
  //   setState(() {

  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    _plantNameController.dispose();
    super.dispose();
  }

  void postPlant({
    required String uid,
    required String userName,
    required double latitude,
    required double longitude,
  }) async {
    setState(() {
      _isLoading = true;
    });
    try {
      bool res = await FirestoreMethods().uploadPlant(
          userName: userName,
          plantName: _plantNameController.text,
          latitude: latitude,
          longitude: longitude,
          file: _file!,
          uid: uid);
      if (res) {
        showSnackBar(context, "Plant Added");
        setState(() {
          _isLoading = false;
        });
        clearImage();
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

  void clearImage() {
    setState(() {
      _plantNameController.clear();
      _file = null;
    });
  }

  _addImage(BuildContext parentContext) {
    return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return SimpleDialog(
            titlePadding:
                EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 20.0.h),
            title: Text(
              "Add Image",
              style: TextStyles.body22,
            ),
            children: [
              SimpleDialogOption(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
                child: Text(
                  "Select from camera",
                  style: TextStyles.body16,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
                child: Text(
                  "Select from Gallery",
                  style: TextStyles.body16,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
                child: Text(
                  "Cancel",
                  style: TextStyles.body16,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Plants",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isLoading
                ? LinearProgressIndicator(
                    color: AppColors.green,
                    backgroundColor: AppColors.white,
                  )
                : const Padding(padding: EdgeInsets.only(top: 0.0)),
            _file == null
                ? const SizedBox(
                    width: double.infinity,
                  )
                : Container(
                    width: double.infinity,
                    height: 300.0.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!))),
                  ),
            SizedBox(
              height: 26.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Text("Please enter the details to continue",
                  style: TextStyles.body15),
            ),
            SizedBox(
              height: 60.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: TextFieldWidget(
                controller: _plantNameController,
                hintText: "Name",
                textInputType: TextInputType.name,
              ),
            ),
            SizedBox(
              height: 60.0.h,
            ),
            ButtonWidget(
              buttonText: "Add Image",
              isIcon: true,
              iconName: "assets/svg/icons/upload_icon.svg",
              onPressed: () => _addImage(context),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            // Text("Address is: ${userProvider.address}"),
            ButtonWidget(
              buttonText: "Add Location",
              isIcon: true,
              iconName: "assets/svg/icons/location_icon.svg",
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddLocation())),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            ButtonWidget(
              buttonText: "Send",
              onPressed: () {
                postPlant(
                    uid: userProvider.getUser.uid!,
                    userName: userProvider.getUser.name!,
                    latitude: userProvider.currentLocation!.latitude,
                    longitude: userProvider.currentLocation!.longitude);
              },
            ),
          ],
        ),
      ),
    );
  }
}
