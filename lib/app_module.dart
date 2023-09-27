import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/dashboard/dashboard_module.dart';
import 'package:hair_salon_app/features/home/home_module.dart';
import 'package:hair_salon_app/features/main/main_module.dart';
import 'package:hair_salon_app/features/salon_services/salon_services_module.dart';
import 'package:hair_salon_app/features/schedule/schedule_module.dart';
import 'package:hair_salon_app/features/settings/settings_module.dart';
import 'package:hair_salon_app/features/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/main/', module: MainModule()),
        ModuleRoute('/home/', module: HomeModule()),
        ModuleRoute('/schedule/', module: ScheduleModule()),
        ModuleRoute('/schedule-client/', module: ScheduleModule()),
        ModuleRoute('/dashboard/', module: DashboardModule()),
        ModuleRoute('/salon-service/', module: SalonServicesModule()),
        ModuleRoute('/settings/', module: SettingsModule()),
      ];
}
