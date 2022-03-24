import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plant_tree/modules/authentication/models/user.dart';
import 'package:plant_tree/modules/authentication/resourses/auth_methods.dart';
import 'package:plant_tree/modules/dashboard/models/plants_model.dart';
import 'package:plant_tree/modules/dashboard/resourses/firestore_methods.dart';
import 'package:plant_tree/modules/dashboard/resourses/geolocator_resource.dart';


class UserProvider extends ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  final GeoLocatorService _geoLocatorService = GeoLocatorService();
  String? address;

  // Position? currentLocation;
  LatLng? _currentMapPosition = const LatLng(37.4219983, -122.084);

  // get getCurrentLocation => _geoLocatorService.getGeoLocationPosition;

  LatLng get currentMapPosition => _currentMapPosition!;

  // setCurrentPosition(CameraPosition position) {
  //   currentLocation = position.target;
  // }

  UserProvider() {
    setAdd();
    // setCurrentLocation();
  }

  // setCurrentLocation() async {
  //   currentLocation = await _geoLocatorService.getGeoLocationPosition();
  //   notifyListeners();
  // }

  void updateCurrentLocation(CameraPosition position) {
    _currentMapPosition = position.target;
    notifyListeners();
  }

  // void updateCurrentLocatioUsingFunction(CameraPosition position) {
  //   currentLocation = position.target as Position?;
  //   notifyListeners();
  // }

  // int _noOfPlants = 0;

  // Future<void> getPlantInfoLength(String uid) async {
  //   var number = await _firestoreMethods.getUserInfo(uid);
  //   _noOfPlants = number.docs.length;
  //   notifyListeners();
  // }

  setAdd() async {
    address = await _geoLocatorService.getAddressFromLatLong(
        latitude: currentMapPosition.latitude,
        longitude: currentMapPosition.longitude);
    notifyListeners();
  }


  // Future<String> getaddress() async {
  //   String address = await _geoLocatorService.getAddressFromLatLong(
  //       latitude: currentMapPosition.latitude,
  //       longitude: currentMapPosition.longitude);
  //   notifyListeners();
  //   return address;
  //   //   // notifyListeners();
  // }

  Stream<List<Plants>> get getUserPlantInfo =>
      _firestoreMethods.userPlantsInfo(getUser.uid!);

  // int get noOfPlants => _noOfPlants;

  // User _user = User(
  //   email: '',
  //   name: '',
  //   uid: '',
  //   photoUrl: '',
  // );

  User get getUser => _user!;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
