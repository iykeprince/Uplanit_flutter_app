import 'package:flutter/material.dart';
import 'package:uplanit_supplier/core/viewmodels/base_model.dart';

class ContactInformationModel extends BaseModel {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

}
