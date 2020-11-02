import 'package:uplanit_supplier/core/viewmodels/base_model.dart';

class ProductDescriptionModel extends BaseModel {

  final List<String> _myEventTypes = [];
  final String _eventType = '';

  
  List get myEventTypes => _myEventTypes;
  String get eventType => _eventType;

  

  void addEventType(String eventType) {
    _myEventTypes.add(eventType);
    notifyListeners();
  }
}
