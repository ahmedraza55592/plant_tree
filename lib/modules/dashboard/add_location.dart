import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:provider/provider.dart';

import '../authentication/provider/user_provider.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  // static LatLng center = const LatLng(45.521563, -122.677433);
  GoogleMapController? controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // LatLng _center =  LatLng(9.669111, 80.014007);
  // final Set<Marker> _markers = {};

  // LatLng _currentMapPosition = center;

  // void _onMapCreated(GoogleMapController controller) {
  //   controller = controller;

  // const marker = Marker(
  //   markerId: MarkerId('place-Name'),
  //   position: LatLng(37.4219983, -122.084),
  //   icon: BitmapDescriptor.defaultMarker,
  //   infoWindow: InfoWindow(
  //     title: 'title',
  //     snippet: 'address',
  //   ),
  // );

  // setState(() {
  //   markers[const MarkerId('place_name')] = marker;
  // });
  // }

  // void _onCameraMove(CameraPosition position) {
  //   _currentMapPosition = position.target;
  // }

  // void _onAddMarkerButtonPressed() {
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: MarkerId(_currentMapPosition.toString()),
  //       position: _currentMapPosition,
  //       infoWindow:
  //           const InfoWindow(title: 'Nice Place', snippet: 'Welcome to Poland'),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Location"),
          actions: [
            TextButton(
                onPressed: () async {
                  showSnackBar(context, "Plant Location has been Added");
                  Navigator.pop(context);
                  // print("Something");
                  // print(userInfo.setCurrentLocation);
                  // print("Something");
                  // var instance = await userInfo.setAdd();
                  // print(instance);

                  // print(userInfo.setAdd());
                  // print("Function");
                  // print(userInfo.currentLocation!.latitude);
                  // print(userInfo.currentLocation!.longitude);
                  // print("Hard Coded");

                  // print(userInfo.currentMapPosition.latitude);
                  // print(userInfo.currentMapPosition.longitude);
                  // String address = await GeoLocatorService()
                  //     .getAddressFromLatLong(
                  //         latitude: userInfo.currentLocation!.latitude,
                  //         longitude: userInfo.currentLocation!.longitude);
                  // print(address);
                  // String finalAddress = userInfo.address;
                  // print("Final Address is: $finalAddress ");
                  // print(userInfo.address);

                  // print(userInfo.address);
                  // var add = userInfo.getAdd;
                  // print(add);

                  // print(userInfo.address);
                },
                child: Text(
                  "Something",
                  style: TextStyle(color: AppColors.white),
                ))
          ],
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(
                userInfo.currentMapPosition.latitude,
                userInfo.currentMapPosition.longitude,
              ),
              zoom: 18.0),
          // onMapCreated: _onMapCreated,
          onMapCreated: (GoogleMapController controller) {
            controller = controller;

            var marker = Marker(
              markerId: MarkerId(
                  userInfo.currentMapPosition.latitude.toString() +
                      userInfo.currentMapPosition.longitude.toString()),
              position: LatLng(userInfo.currentMapPosition.latitude,
                  userInfo.currentMapPosition.longitude),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(
                title: userInfo.getUser.name,
                snippet: userInfo.getUser.email,
              ),
            );

            setState(() {
              markers[MarkerId(userInfo.currentMapPosition.latitude.toString() +
                  userInfo.currentMapPosition.longitude.toString())] = marker;
            });
          },
          onCameraMove: userInfo.updateCurrentLocation,
          myLocationEnabled: true,
          mapType: MapType.satellite,
          markers: markers.values.toSet(),
        )

        //     Stack(
        //   children: [
        //     GoogleMap(
        //       markers: _markers,
        //       onCameraMove: _onCameraMove,
        //       onMapCreated: _onMapCreated,
        //       myLocationEnabled: true,
        //       mapType: MapType.satellite,
        //       initialCameraPosition: CameraPosition(
        //           target: center,

        //           // target: LatLng(userInfo.currentLocation!.latitude,
        //           //     userInfo.currentLocation!.longitude),
        //           zoom: 12.0),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(14.0),
        //       child: Align(
        //         alignment: Alignment.bottomLeft,
        //         child: FloatingActionButton(
        //           onPressed: _onAddMarkerButtonPressed,
        //           materialTapTargetSize: MaterialTapTargetSize.padded,
        //           backgroundColor: Colors.green,
        //           child: const Icon(Icons.map, size: 30.0),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
