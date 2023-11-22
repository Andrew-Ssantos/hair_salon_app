import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/splash/presenter/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SplashPage()),
  ];
}
