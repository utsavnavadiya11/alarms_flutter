import 'package:alarms/Provider/alarm_model.dart';
import 'package:flutter/material.dart';

class AlarmData with ChangeNotifier {
  final List<AlarmModel> _alarms = [];

  List<AlarmModel> get alarms {
    return [..._alarms];
  }

  void addAlarm(int hour, int minute, DateTime date) {
    _alarms.add(AlarmModel(id: DateTime.now().toString(), date: date));
    notifyListeners();
  }

  void removeAlarm(String id) {
    _alarms.removeWhere((alarm) => alarm.id == id);
    notifyListeners();
  }

  void editAlarm(String id, DateTime date) {
    _alarms.firstWhere((element) => element.id == id).date = date;
    notifyListeners();
  }
}
