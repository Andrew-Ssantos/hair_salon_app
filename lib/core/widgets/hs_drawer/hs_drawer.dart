import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

import '../../../features/salon_services/controller/salon_service_controller.dart';

class HsDrawer extends StatelessWidget {
  HsDrawer({super.key});

  final service = Modular.get<SalonServiceController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(color: ColorsConstants.ligthPurple),
            child: Center(
              child: Text(
                'HS APP',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 5),
                ListTile(
                  leading: HsIcons.servicesIcon,
                  title: const Text(
                    'Serviços',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () async {
                    await service.fetchSalonServices();
                    Modular.to.pushNamed('/salon-service/');
                  },
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: HsIcons.settingsIcon,
                  title: const Text(
                    'Configurações',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    Modular.to.pushNamed('/schedule/schedule-client/');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
