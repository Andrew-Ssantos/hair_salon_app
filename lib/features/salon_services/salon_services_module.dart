import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/salon_services/presenter/pages/salon_services_page.dart';

class SalonServicesModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SalonServicesPage()),
  ];
}
