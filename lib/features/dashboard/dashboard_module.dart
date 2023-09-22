import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/dashboard/dashboard_page.dart';

class DashboardModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const DashboardPage()),
  ];
}
