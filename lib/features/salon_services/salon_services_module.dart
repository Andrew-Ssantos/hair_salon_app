import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/salon_services/atom/salon_services_atom.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';
import 'package:hair_salon_app/features/salon_services/presenter/pages/salon_services_page.dart';

class SalonServicesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SalonServiceController(),
          export: true,
        ),
        Bind.lazySingleton(
          (i) => salonServicesList,
          export: true,
        ),
      ];

  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SalonServicesPage()),
  ];
}
