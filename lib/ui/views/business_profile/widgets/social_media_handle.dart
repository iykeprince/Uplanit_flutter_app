import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplanit_supplier/ui/shared/custom_colors.dart';
import 'package:uplanit_supplier/ui/widgets/custom_textfield.dart';

class SocialMediaHandle extends StatelessWidget {
  final IconData icon;
  final String handle;
  final bool isEditMode;
  final TextEditingController controller;
  const SocialMediaHandle({
    Key key,
    this.icon,
    this.handle,
    this.isEditMode,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icon,
          color: CustomColor.socialMedia,
          size: 24,
        ),
        SizedBox(
          width: 4,
        ),
        !isEditMode
            ? Text(
                '$handle',
                style: GoogleFonts.workSans(
                  fontSize: 12,
                ),
              )
            : Expanded(
                          child: Container(
                  child: CustomTextField(
                    controller: controller..text = '$handle',
                    onChanged: (String value) => controller.text = value,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
            ),
      ],
    );
  }
}
