import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/schedule/controller/schedule_client_controller.dart';
import 'package:hair_salon_app/features/schedule/presenter/pages/schedule_client_page.dart';
import 'package:hair_salon_app/features/schedule/presenter/pages/schedule_page.dart';

class ScheduleModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ScheduleClientController(),
          export: true,
        )
      ];

  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SchedulePage()),
    ChildRoute('/schedule-client/', child: (context, args) => ScheduleClientPage(date: args.data))
  ];
}
