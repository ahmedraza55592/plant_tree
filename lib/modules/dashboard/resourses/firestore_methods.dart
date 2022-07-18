import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_tree/modules/authentication/models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_tree/modules/dashboard/models/plants_model.dart';
import 'package:plant_tree/modules/dashboard/resourses/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  

  // Upload Plant to Firestore
  Future<bool> uploadPlant(
      {required String userName,
      required String plantName,
      required Uint8List file,
      required double latitude,
      required double longitude,
      required String uid}) async {
    bool res = false;
    try {
      String plantImageUrl = await StorageMethods()
          .uploadImageToFirebaseStorage('plants', file, true);
      String plantId = const Uuid().v1();
      Plants plants = Plants(
        plantName: plantName,
        uid: uid,
        plantId: plantId,
        datePublished: DateTime.now(),
        plantImageUrl: plantImageUrl,
        userName: userName,
        longitude: longitude,
        latitude: latitude,
      );

      _firebaseFirestore.collection('plants').doc(plantId).set(plants.toMap());
      res = true;
    } catch (e) {
      res = false;
    }
    return res;
  }

    // Delete A Plant from Firestore
  Future<bool> deletePlant(String plantId) async {
    bool res = false;
    try {
      // await StorageMethods().deleteImage('plants', plantId);
      await _firebaseFirestore.collection('plants').doc(plantId).delete();
      res = true;
    } catch (err) {
      res = false;
    }
    return res;
  }



  Stream<List<Plants>> userPlantsInfo(String uid) {
    return _firebaseFirestore
        .collection('plants')
        .where("uid", isEqualTo: uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Plants.fromMap(doc.data())).toList());
  }

  Stream<List<User>> userAllInfo(String uid) {
    return _firebaseFirestore
        .collection('users')
        .where("uid", isEqualTo: uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromMap(doc.data())).toList());
  }

  // Future<int> plantsInfo(String uid) async {
  //   int a = 0;
  //   try {
  //     a = await _firebaseFirestore
  //         .collection('plants')
  //         .doc()
  //         .snapshots()
  //         .length;
  //     a = a;
  //   } catch (e) {}
  //   return a;

}
