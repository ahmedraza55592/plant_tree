import 'package:cloud_firestore/cloud_firestore.dart';

class Plants {
  final String? plantName;
  final String? uid;
  final String? plantId;
  final DateTime? datePublished;
  final String? plantImageUrl;
  final String? userName;
  final double? latitude;
  final double? longitude;

  Plants(
      {this.plantName,
      this.uid,
      this.plantId,
      this.datePublished,
      this.userName,
      this.plantImageUrl, this.latitude, this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'name': plantName,
      'uid': uid,
      'plantId': plantId,
      'datePublished': datePublished?.millisecondsSinceEpoch,
      'plantImageUrl': plantImageUrl,
      'userName': userName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Plants.fromMap(Map<String, dynamic> map) {
    return Plants(
        plantName: map['name'],
        uid: map['uid'],
        plantId: map['plantId'],
        datePublished: map['datePublished'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['datePublished'])
            : null,
        plantImageUrl: map['plantImageUrl'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        userName: map['userName']);
  }

  static Plants fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Plants(
        plantName: snapshot['name'],
        uid: snapshot['uid'],
        plantId: snapshot['plantId'],
        datePublished: snapshot['datePublished'] != null
            ? DateTime.fromMillisecondsSinceEpoch(snapshot['datePublished'])
            : null,
        plantImageUrl: snapshot['plantImageUrl'],
        latitude: snapshot['latitude'],
        longitude: snapshot['longitude'],
        userName: snapshot['userName']);
  }
}
