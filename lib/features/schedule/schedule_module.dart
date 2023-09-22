import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/schedule/schedule_page.dart';

class ScheduleModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SchedulePage()),
  ];
}
