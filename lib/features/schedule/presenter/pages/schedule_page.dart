import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_drawer.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda')),
      drawer: const HsDrawer(),
      body: DayView(
        timeLineWidth: 55,
        headerStyle: const HeaderStyle(
          decoration: BoxDecoration(color: ColorsConstants.green),
          headerTextStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        showHalfHours: true,
        hourIndicatorSettings: const HourIndicatorSettings(offset: 10),
        halfHourIndicatorSettings: HourIndicatorSettings(
          color: ColorsConstants.ligthGrey,
          offset: 10,
        ),
        heightPerMinute: 1.5,
        onDateTap: (date) {},
        controller: EventController(),
      ),
    );
  }
}
