import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/schedule/presenter/pages/schedule_client_page.dart';
import 'package:hair_salon_app/features/schedule/presenter/pages/schedule_page.dart';

class ScheduleModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SchedulePage()),
    ChildRoute('/schedule-client/', child: (context, args) => ScheduleClientPage(date: args.data))
  ];
}
