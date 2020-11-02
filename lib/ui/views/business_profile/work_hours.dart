import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'viewmodels/work_hour_model.dart';
import 'widgets/round_edit_button.dart';

class WorkHoursView extends StatelessWidget {
  const WorkHoursView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WorkHourModel>(
        create: (_) => WorkHourModel(),
        child: Consumer<WorkHourModel>(
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
                        'Work Hours',
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
                    children: [
                      WorkHour(
                          day: 'Monday',
                          from: '12:00',
                          to: '16:00',
                          isEditMode: model.isEditMode),
                      WorkHour(
                        day: 'Tuesday',
                        from: '12:00',
                        to: '16:00',
                        isEditMode: model.isEditMode,
                      ),
                      WorkHour(
                        day: 'Wednesday',
                        from: '12:00',
                        to: '16:00',
                        isEditMode: model.isEditMode,
                      ),
                      WorkHour(
                        day: 'Thursday',
                        from: '12:00',
                        to: '16:00',
                        isEditMode: model.isEditMode,
                      ),
                      WorkHour(
                        day: 'Friday',
                        from: '12:00',
                        to: '16:00',
                        isEditMode: model.isEditMode,
                      ),
                      WorkHour(
                        day: 'Saturday',
                        from: '12:00',
                        to: '16:00',
                        isEditMode: model.isEditMode,
                      ),
                      WorkHour(
                        day: 'Sunday',
                        from: '12:00',
                        to: '16:00',
                        isEditMode: model.isEditMode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class WorkHour extends StatelessWidget {
  final bool isEditMode;
  final String day;
  final String from;
  final String to;
  const WorkHour({
    Key key,
    this.isEditMode,
    this.day,
    this.from,
    this.to,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkHourModel model = Provider.of<WorkHourModel>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '$day',
              style: GoogleFonts.workSans(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: !isEditMode
                ? Text(
                    '$from - $to',
                    style: GoogleFonts.workSans(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.shade500,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<Day>(
                      isDense: false,
                      elevation: 1,
                      items: [
                        DropdownMenuItem<Day>(
                          child: Text(
                            '$from - $to',
                            style: GoogleFonts.workSans(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          value: model.day,
                        )
                      ],
                      onChanged: (value) {
                        model.updateDay(value);
                      },
                      value: model.day,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
