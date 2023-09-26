import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/home/presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}
