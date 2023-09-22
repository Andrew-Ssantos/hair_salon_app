import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

class HsBottomNavigationBar extends StatelessWidget {
  const HsBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 1,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: HsIcons.homeIcon,
          label: 'Tela inicial',
        ),
        BottomNavigationBarItem(
          icon: HsIcons.scheduleIcon,
          label: 'Agenda',
        ),
        BottomNavigationBarItem(
          icon: HsIcons.dashboardIcon,
          label: 'Dashboard',
        ),
      ],
    );
  }
}
