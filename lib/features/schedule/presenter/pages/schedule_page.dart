import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_drawer/hs_drawer.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda')),
      drawer: HsDrawer(),
      body: DayView(
        scrollPhysics: const ScrollPhysics(),
        timeLineWidth: 60,
        headerStyle: const HeaderStyle(
          decoration: BoxDecoration(color: ColorsConstants.green),
          headerTextStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        showHalfHours: true,
        hourIndicatorSettings: const HourIndicatorSettings(offset: 10),
        halfHourIndicatorSettings: const HourIndicatorSettings(
          lineStyle: LineStyle.dashed,
          color: ColorsConstants.ligthGrey,
          offset: 10,
        ),
        minuteSlotSize: MinuteSlotSize.minutes30,
        startDuration: Duration(hours: DateTime.now().hour),
        heightPerMinute: 2,
        controller: EventController(),
        onDateTap: (date) {
          Modular.to.pushNamed('/schedule/schedule-client/', arguments: date);
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsConstants.green,
        onPressed: () {
          Modular.to.pushNamed('/schedule/schedule-client/');
        },
        child: const Icon(
          Icons.add,
          color: ColorsConstants.purple,
          size: 30,
        ),
      ),
    );
  }
}
