import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? email;
  final String? uid;
  final String? photoUrl;
  final String? name;

  User({this.email, this.uid, this.photoUrl, this.name});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'photoUrl': photoUrl,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      uid: map['uid'],
      photoUrl: map['photoUrl'],
      name: map['name'],
    );
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      name: snapshot['name'],
    );
  }
}
