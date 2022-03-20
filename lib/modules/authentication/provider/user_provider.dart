import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/models/user.dart';
import 'package:plant_tree/modules/authentication/resourses/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

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
