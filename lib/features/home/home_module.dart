import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}
