import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/main/presenter/pages/main_page.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => SalonServiceController(),
      export: true,
    )
  ];

  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const MainPage()),
  ];
}
