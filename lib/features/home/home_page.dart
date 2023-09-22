import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_bottom_navigation_bar.dart';
import 'package:hair_salon_app/core/widgets/hs_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tela inicial')),
        drawer: const HsDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: ColorsConstants.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        const Text(
                          'Clientes agendados hoje:',
                          style: TextStyle(fontSize: 15),
                        ),
                        const Text(
                          '7',
                          style: TextStyle(
                            color: ColorsConstants.purple,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: ColorsConstants.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cliente',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Horário',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(color: ColorsConstants.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const HsBottomNavigationBar());
  }
}
