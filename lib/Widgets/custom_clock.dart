import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:analog_clock/analog_clock.dart';

class CustomClock extends StatelessWidget {
  const CustomClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 203,
          width: 203,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xffCAD1DA),
                blurRadius: 15.0,
                spreadRadius: 3,
                offset: Offset(
                  10,
                  10,
                ),
              ),
            ],
            gradient: LinearGradient(
              colors: [Color(0xffE6E9EF), Color(0xffEEF0F5)],
              begin: Alignment.topLeft,
              end: Alignment.center,
            ),
          ),
        ),
        Container(
          height: 176,
          width: 176,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xffA5B1C3), Color(0xffFEFEFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        AnalogClock(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Colors.transparent,
            ),
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          width: 150.0,
          height: 120.0,
          isLive: true,
          hourHandColor: const Color(0xff646E82),
          minuteHandColor: const Color(0xff646E82),
          secondHandColor: const Color(0xffFD251E),
          showSecondHand: true,
          numberColor: Colors.black87,
          showNumbers: false,
          showAllNumbers: false,
          textScaleFactor: 1.4,
          showTicks: false,
          showDigitalClock: false,
          datetime: DateTime.now(),
        ),
      ],
    );
  }
}
