import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_drawer/hs_drawer.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda')),
      drawer: HsDrawer(),
      body: DayView(
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
        heightPerMinute: 2,
        onDateTap: (date) {
          print(date);
          Modular.to.pushNamed('/schedule/schedule-client/', arguments: date);
        },
        controller: EventController(),
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
