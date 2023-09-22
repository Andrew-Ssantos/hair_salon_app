import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/home/home_module.dart';
import 'package:hair_salon_app/features/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home/', module: HomeModule()),
      ];
}