import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_supplier/ui/shared/custom_colors.dart';
import 'package:uplanit_supplier/ui/views/business_profile/widgets/round_edit_button.dart';
import 'package:uplanit_supplier/ui/widgets/custom_textfield.dart';

import 'viewmodels/product_description_model.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class ProductDescriptionView extends StatelessWidget {
  ProductDescriptionView({
    Key key,
  }) : super(key: key);

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductDescriptionModel>(
      create: (_) => ProductDescriptionModel(),
      child: Consumer<ProductDescriptionModel>(
        builder: (context, model, child) => Column(
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
                    'Description',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                                              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Business Name',
                              style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                color: CustomColor.uplanitBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            !model.isEditMode
                                ? Text(
                                    'Bridal Luxury',
                                    style: GoogleFonts.workSans(
                                      fontSize: 14.0,
                                      color: Color(0xFF757575),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width * .5,
                                    child: CustomTextField(
                                      controller: _businessNameController
                                        ..text = 'Bridal Luxury',
                                      onChanged: (String value) =>
                                          _businessNameController.text = value,
                                      color: Colors.black,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                                              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category',
                              style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                color: CustomColor.uplanitBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            !model.isEditMode
                                ? Text(
                                    'Entertainment',
                                    style: GoogleFonts.workSans(
                                      fontSize: 14.0,
                                      color: Color(0xFF757575),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width * .5,
                                    child: CustomTextField(
                                      controller: _categoryController
                                        ..text = 'Entertainment',
                                      onChanged: (String value) =>
                                          _categoryController.text = value,
                                      color: Colors.black,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      !model.isEditMode
                              ?
                      Text(
                        'Event Types',
                        style: GoogleFonts.workSans(
                          fontSize: 16.0,
                          color: CustomColor.uplanitBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ) : MultiSelectFormField(
                  autovalidate: false,
                  chipBackGroundColor: Colors.red,
                  chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Colors.red,
                  checkBoxCheckColor: Colors.green,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "Event Types",
                    style: TextStyle(fontSize: 16),
                  ),
                  dataSource: [
                    {
                      "display": "Anniversary",
                      "value": "Anniversary",
                    },
                    {
                      "display": "Get Together",
                      "value": "Get Together",
                    },
                    {
                      "display": "Stag & Hen",
                      "value": "Stag & Hen",
                    },
                    {
                      "display": "Conference",
                      "value": "Conference",
                    },
                    {
                      "display": "Birthday",
                      "value": "Birthday",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text('Please choose one or more'),
                  initialValue: model.eventType,
                  onSaved: (value) {
                    if (value == null) return;
                   
                      model.addEventType(value);
                  
                  },
                ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        spacing: 4,
                        runSpacing: 2,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Text(
                              'Anniversary',
                              style: GoogleFonts.workSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Text(
                              'Get Together',
                              style: GoogleFonts.workSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Text(
                              'Stag & Hen',
                              style: GoogleFonts.workSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Text(
                              'Conference',
                              style: GoogleFonts.workSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Text(
                              'Birthday',
                              style: GoogleFonts.workSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
