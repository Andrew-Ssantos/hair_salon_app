import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/features/settings/settings_page.dart';

class SettingsModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SettingsPage()),
  ];
}
