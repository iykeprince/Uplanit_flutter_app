import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplanit_supplier/ui/views/business_profile/widgets/round_edit_button.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 16.0, left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 156,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/supplier2.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.mode_edit,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -25,
                  left: 159,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage:
                            AssetImage('assets/images/supplier.png'),
                      ),
                      Positioned(
                        right: -8,
                        bottom: -8,
                        child: RoundEditButton(
                          onTap: () => print('Edit Image'),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 36,),
            child: Text(
              'Naomi Xaomi',
              style: GoogleFonts.workSans(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
