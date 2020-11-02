import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_supplier/ui/shared/custom_colors.dart';

import 'viewmodels/social_media_model.dart';
import 'widgets/round_edit_button.dart';
import 'widgets/social_media_handle.dart';

class SocialMediaView extends StatelessWidget {
  final bool isEditMode;
  const SocialMediaView({
    Key key,
    this.isEditMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SocialMediaModel>(
      create: (_) => SocialMediaModel(),
      child: Consumer<SocialMediaModel>(
        builder: (context, model, child) => Container(
          child: Column(
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
                      'Social Media',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SocialMediaHandle(
                              handle: '@bridallux',
                              icon: FontAwesomeIcons.instagramSquare,
                              isEditMode: model.isEditMode,
                              controller: model.instagramController,
                              ),
                          SocialMediaHandle(
                            handle: '@bridal_lux',
                            icon: FontAwesomeIcons.linkedin,
                            isEditMode: model.isEditMode,
                              controller: model.linkedinController,
                          ),
                          SocialMediaHandle(
                              handle: 'bridallux.com',
                              icon: FontAwesomeIcons.dribbbleSquare,
                              isEditMode: model.isEditMode,
                              controller: model.dribbbleController,),
                        ],
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SocialMediaHandle(
                            handle: '@bridal_lux',
                            icon: FontAwesomeIcons.facebookSquare,
                            isEditMode: model.isEditMode,
                              controller: model.facebookController,
                          ),
                          SocialMediaHandle(
                              handle: 'bridallux.com',
                              icon: FontAwesomeIcons.twitterSquare,
                              isEditMode: model.isEditMode,
                              controller: model.twitterController,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
