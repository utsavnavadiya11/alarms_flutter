import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:date_time_picker/date_time_picker.dart';

import './Widgets/custom_add_button.dart';
import './Widgets/custom_alarm_card.dart';
import './Widgets/custom_clock.dart';
import './Provider/alarm_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AlarmData alarmProvider;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    alarmProvider = Provider.of<AlarmData>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffEEF0F5), Color(0xffE2E4EA)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 42.0),
            const CustomClock(),
            const SizedBox(height: 35.0),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(
                        -50,
                        -1,
                      ),
                    ),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffEAECF1), Color(0xffE2E4EA)]),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 37.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/alarms_text.png',
                            height: 18,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/more_options.png',
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.48,
                      child: Consumer<AlarmData>(
                        builder: (_, value, child) => ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 23.0,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          shrinkWrap: true,
                          itemCount: alarmProvider.alarms.length,

                          // Building Alarm  cards with delete and edit..
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 300,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xffEEF0F5),
                                            Color(0xffE2E4EA)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            alarmProvider.editAlarm(
                                                alarmProvider.alarms[index].id,
                                                _selectedDate);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Save'),
                                        ),
                                        const SizedBox(height: 20.0),
                                        DateTimePicker(
                                          type: DateTimePickerType
                                              .dateTimeSeparate,
                                          dateMask: 'd MMM, yyyy',
                                          initialValue: alarmProvider
                                              .alarms[index].date
                                              .toString(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2100),
                                          icon: const Icon(Icons.event),
                                          dateLabelText: 'Date',
                                          timeLabelText: "Hour",
                                          onChanged: (val) => _selectedDate =
                                              DateTime.parse(val),
                                          onSaved: (val) => _selectedDate =
                                              DateTime.parse(val!),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Dismissible(
                                key: ValueKey(alarmProvider.alarms[index].id),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17.0),
                                  height: 75.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xffFD2B23),
                                        const Color(0xffFD2B23)
                                            .withOpacity(0.3),
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                onDismissed: (direction) => {
                                  alarmProvider.removeAlarm(
                                      alarmProvider.alarms[index].id),
                                },
                                confirmDismiss: (direction) {
                                  return showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Are You Sure?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: const Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            child: const Text('Yes'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: AlarmCard(
                                    date: alarmProvider.alarms[index].date),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: InkWell(
            child: const CustomAddButton(),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffEEF0F5), Color(0xffE2E4EA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          alarmProvider.addAlarm(_selectedDate.hour,
                              _selectedDate.minute, _selectedDate);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DateTimePicker(
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd MMM, yyyy',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          icon: const Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          onChanged: (val) =>
                              _selectedDate = DateTime.parse(val),
                          onSaved: (val) =>
                              _selectedDate = DateTime.parse(val!),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
