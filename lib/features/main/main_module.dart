import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/main/presenter/pages/main_page.dart';

class MainModule extends Module {
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const MainPage()),
  ];
}
