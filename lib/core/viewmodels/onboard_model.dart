import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uplanit_supplier/core/models/onboard.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
import 'package:uplanit_supplier/core/services/onboard_service.dart';
import 'package:uplanit_supplier/core/shared/validation.dart';
import 'package:uplanit_supplier/core/utils/locator.dart';

import 'base_model.dart';

class OnboardModel extends BaseModel {
  OnboardService onboardService = OnboardService();
  AuthenticationService auth = locator<AuthenticationService>();

  Validator _businessName = Validator(null, null);
  Validator _description = Validator(null, null);
  bool _isValid = false;

  Validator get name => _businessName;
  Validator get description => _description;
  bool get isValid => _isValid;

  void changeBusinessName(String value) {
    if (value.length > 0) {
      _businessName = Validator(value, null);
    } else {
      _businessName = Validator(null, "Please enter your business name");
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if (value.length > 0) {
      _description = Validator(value, null);
    } else {
      _description = Validator(null, "Please describe your business");
    }
    notifyListeners();
  }

  Future<Profile> createProfile() async {
    String idToken = await auth.user.getIdToken();
    
    return onboardService.createProfile(
      body: Profile(
        name: name.value,
        description: description.value,
      ),
      token: idToken,
    );
  }

  
}
