import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_supplier/ui/shared/custom_colors.dart';
import 'package:uplanit_supplier/ui/views/business_profile/viewmodels/contact_information_model.dart';
import 'package:uplanit_supplier/ui/widgets/custom_textfield.dart';

import 'widgets/round_edit_button.dart';

class ContactInformationView extends StatelessWidget {
  final bool isEditMode;
  ContactInformationView({
    Key key,
    this.isEditMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactInformationModel(),
      child: Consumer<ContactInformationModel>(
        builder: (context, model, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 8,
                bottom: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Contact Information',
                    style: GoogleFonts.workSans(
                      fontSize: 16.0,
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  model.isEditMode
                      ? FlatButton(
                          onPressed: () {
                            model.toggleMode();
                          },
                          child: Container(
                            color: Colors.grey.shade300,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Update',
                              style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : RoundEditButton(
                          onTap: model.toggleMode,
                        ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 8,
                bottom: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: GoogleFonts.workSans(
                          fontSize: 16.0,
                          color: CustomColor.uplanitBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      !model.isEditMode
                          ? Text(
                              '131, Abbott’s Hill Shitta Drive, Newcastle',
                              style: GoogleFonts.workSans(
                                fontSize: 14.0,
                                color: Color(0xFF757575),
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              child: CustomTextField(
                                controller: model.addressController
                                  ..text =
                                      '131, Abbott’s Hill Shitta Drive, Newcastle',
                                onChanged: (String value) =>
                                    model.addressController.text = value,
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country',
                              style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                color: CustomColor.uplanitBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            !model.isEditMode
                                ? Text(
                                    'United Kingdom',
                                    style: GoogleFonts.workSans(
                                      fontSize: 14.0,
                                      color: Color(0xFF757575),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: CustomTextField(
                                      controller: model.countryController
                                        ..text = 'United Kingdom',
                                      onChanged: (String value) =>
                                          model.countryController.text = value,
                                      color: Colors.black,
                                    ),
                                  ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Email Address',
                              style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                color: CustomColor.uplanitBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            !model.isEditMode
                                ? Text(
                                    'xaomiluxury@gmail.com',
                                    style: GoogleFonts.workSans(
                                      fontSize: 14.0,
                                      color: Color(0xFF757575),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: CustomTextField(
                                      controller: model.emailController
                                        ..text = 'xaomiluxury@gmail.com',
                                      onChanged: (String value) =>
                                          model.emailController.text = value,
                                      color: Colors.black,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                color: CustomColor.uplanitBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            !model.isEditMode
                                ? Text(
                                    '+44-244-899-445',
                                    style: GoogleFonts.workSans(
                                      fontSize: 14.0,
                                      color: Color(0xFF757575),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: CustomTextField(
                                      controller: model.phoneController
                                        ..text = '+44-244-899-445',
                                      onChanged: (String value) =>
                                          model.phoneController.text = value,
                                      color: Colors.black,
                                    ),
                                  ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Website',
                              style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                color: CustomColor.uplanitBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            !model.isEditMode
                                ? Text(
                                    'www.bridaluxury.com',
                                    style: GoogleFonts.workSans(
                                      fontSize: 14.0,
                                      color: Color(0xFF757575),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: CustomTextField(
                                      controller: model.phoneController
                                        ..text = 'www.bridaluxury.com',
                                      onChanged: (String value) =>
                                          model.phoneController.text = value,
                                      color: Colors.black,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MapView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/map.png"),
    );
  }
}
