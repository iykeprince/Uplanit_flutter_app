import 'package:uplanit_supplier/core/viewmodels/base_model.dart';

class WorkHourModel extends BaseModel {
  Day _day = Day();
  Day get day => _day;

  void updateDay(Day day) {
    _day = day;
    notifyListeners();
  }
}

class Day {
  String title;
  String from;
  String to;

  Day({
    this.title,
    this.from,
    this.to,
  });
}
