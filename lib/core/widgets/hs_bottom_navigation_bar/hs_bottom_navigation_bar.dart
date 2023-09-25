import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

class HsBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const HsBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
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
