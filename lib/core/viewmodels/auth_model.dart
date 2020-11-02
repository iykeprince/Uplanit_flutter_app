import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uplanit_supplier/core/enums/view_state.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
import 'package:uplanit_supplier/core/utils/locator.dart';

import 'base_model.dart';

class AuthModel extends BaseModel {
  AuthenticationService auth = locator<AuthenticationService>();
  bool _showPassword = false;
  String _displayName = "";
  String _uid = "";

  String get uid => _uid;
  String get displayName => _displayName;
  bool get showPassword => _showPassword;

  void togglePassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  setDisplayName(String displayName) {
    _displayName = displayName;
    notifyListeners();
  }

  setUid(String uid) {
    _uid = uid;
    notifyListeners();
  }

  Future<User> registerUserWithEmailAndPassword(
      {String email, String password}) async {
    try {
      return auth.registerUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
    }
  }
}
