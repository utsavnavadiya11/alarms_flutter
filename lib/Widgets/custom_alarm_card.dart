import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AlarmCard extends StatefulWidget {
  final DateTime date;

  const AlarmCard(
      {super.key,
      required this.date});

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  bool toggleSwitchValue = true;

  void toggleSwitch(_) {
    setState(() {
      toggleSwitchValue = !toggleSwitchValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      height: 75.0,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(
              -6,
              -6,
            ),
          ),
          BoxShadow(
            color: Color(0xffCAD1DA),
            blurRadius: 10.0,
            spreadRadius: 1,
            offset: Offset(
              10,
              10,
            ),
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color(0xffEEF0F5), Color(0xffE6E9EF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Text(
            // '${widget.hour}:${widget.minute}',
            DateFormat('hh:mm').format(widget.date),
            style: TextStyle(
              color: toggleSwitchValue == false
                  ? const Color(0xffB3B8C4)
                  : const Color(0xff646E82),
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            DateFormat('EEE, d MMM').format(widget.date),
            style: TextStyle(
              color: toggleSwitchValue == false
                  ? const Color(0xffB3B8C4)
                  : const Color(0xff646E82),
              fontSize: 12,
            ),
          ),
          const SizedBox(
            width: 18.0,
          ),
          Switch(
            value: toggleSwitchValue,
            onChanged: toggleSwitch,
            activeColor: const Color(0xffFD2A22),
            inactiveTrackColor: Colors.grey.shade400,
            thumbColor: MaterialStateProperty.all(Colors.white),
            activeTrackColor: const Color(0xffFD2A22),
          ),
        ],
      ),
    );
  }
}
