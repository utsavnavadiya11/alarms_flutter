import 'package:flutter/material.dart';

class AlarmModel with ChangeNotifier {
  // final int hour;
  // final int minute;
  final String id;
  late DateTime date; // final String mode;
  // final List selectDays = [
  //   ['Sun', false],
  //   ['Mon', false],
  //   ['Tue', false],
  //   ['Wed', false],
  //   ['Thu', false],
  //   ['Fri', false],
  //   ['Sat', false],
  // ];

  AlarmModel({
    // required this.hour,
    // required this.minute,
    required this.id,
    required this.date,
  });
}
