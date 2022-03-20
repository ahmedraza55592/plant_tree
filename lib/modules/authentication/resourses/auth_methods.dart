import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/models/user.dart' as model;
import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User get user => _auth.currentUser!;

  Stream<User?> get authChanges => _auth.authStateChanges();

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          model.User users = model.User(
            name: user.displayName,
            email: user.email,
            uid: user.uid,
            photoUrl: user.photoURL,
          );
          await _firebaseFirestore
              .collection('users')
              .doc(user.uid)
              .set(users.toMap());
          Provider.of<UserProvider>(context, listen: false).setUser(users);
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }

  Future<bool> signUp(BuildContext context,
      {required String name,
      required String password,
      required String email}) async {
    bool res = false;
    try {

      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);


      if (cred.user != null) {
        model.User user = model.User(
          name: name.trim(),
          email: email.trim(),
          uid: cred.user!.uid,
          photoUrl: '',
        );
        await _firebaseFirestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toMap());
        Provider.of<UserProvider>(context, listen: false).setUser(user);

        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    return res;
  }

  // Future<String> loginUser(
  //   BuildContext context, {
  //   required String email,
  //   required String password,
  // }) async {
  //   String res = "Some error Occurred";
  //   try {
  //     if (email.isNotEmpty || password.isNotEmpty) {
  //       // logging in user with email and password
  //       await _auth.signInWithEmailAndPassword(
  //         email: email,
  //         password: password,
  //       );
  //       // if (cred.user != null) {
  //       //     model.User.fromMap(
  //       //       await getCurrentUser(cred.user!.uid) ?? {},

  //       //   );
  //       // }
  //       res = "success";
  //     } else {
  //       res = "Please enter all the fields";
  //     }
  //   } on FirebaseAuthException catch (err) {
  //     showSnackBar(context, err.message!);
  //   }
  //   return res;
  // }

  Future<bool> singIn(BuildContext context,
      {required String email, required String password}) async {
    bool res = false;
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (cred.user != null) {
        Provider.of<UserProvider>(context, listen: false).setUser(
          model.User.fromMap(
            await getCurrentUser(cred.user!.uid) ?? {},
          ),
        );
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    return res;
  }

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firebaseFirestore.collection("users").doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<Map<String, dynamic>?> getCurrentUser(String? uid) async {
    if (uid != null) {
      final snap = await _firebaseFirestore.collection('users').doc(uid).get();
      return snap.data();
    }
    return null;
  }

  Future<void> resetPassword(BuildContext context,
      {required String email}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.green,
              ),
            ));
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      showSnackBar(context, "Password Reset Email has been Sent");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      Navigator.of(context).pop();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
