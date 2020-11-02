import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
import 'package:uplanit_supplier/ui/shared/profile_app_bar.dart';

import 'contact_information.dart';
import 'product_description.dart';
import 'profile_image.dart';
import 'social_media.dart';
import 'work_hours.dart';

class BusinessProfile extends StatelessWidget {
  static const String ROUTE = '/business_profile/business_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(
        title: 'Business Profile',
        onTap: () => context.read<AuthenticationService>().logout()
      ),
      body: ListView(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
            
              ProfileImageView(),
              ProductDescriptionView(),
              ContactInformationView(),
              SocialMediaView(),
              WorkHoursView()
            ],
          ),
        ],
      ),
    );
  }
}