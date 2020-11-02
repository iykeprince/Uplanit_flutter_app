import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uplanit_supplier/core/models/event_type.dart';
import 'package:uplanit_supplier/core/models/post_event_type.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
import 'package:uplanit_supplier/core/services/onboard_service.dart';
import 'package:uplanit_supplier/core/utils/locator.dart';
import 'package:uplanit_supplier/core/viewmodels/base_model.dart';

class EventTypeProvider extends BaseModel {
  OnboardService onboardService = OnboardService();
  AuthenticationService auth = locator<AuthenticationService>();
  List<EventType> _eventTypeList = [];
  List<EventType> _selectedEventTypeList = [];

  List<EventType> get eventTypeList => _eventTypeList;
  List<EventType> get selectedEventTypeList => _selectedEventTypeList;

  Future<List<EventType>> createEventType() async {
    String token = await auth.user.getIdToken();
    PostEventType postEventType = PostEventType(
        eventTypes:
            List<String>.from(selectedEventTypeList.map<String>((e) => e.id))
                .toList());

    return onboardService.createEventType(
      postEventType: postEventType,
      token: token,
    );
  }

  void toggleSelected(int index) {
    _eventTypeList[index].selected = !_eventTypeList[index].selected;
    notifyListeners();
  }

  void addSelected(EventType eventType) {
    List<EventType> list = _selectedEventTypeList
        .where((element) => element.eventTypeId == eventType.eventTypeId)
        .toList();
    if (list.length == 0) {
      _selectedEventTypeList.add(eventType);
    }

    notifyListeners();
  }

  bool isEventTypeLoading = false;

  void loadEventType() async {
    isEventTypeLoading = true;
    List<EventType> eventTypeList =
        await onboardService.getEventTypes(user: auth.user);

    isEventTypeLoading = false;
    _eventTypeList = eventTypeList;

    notifyListeners();
  }
}
