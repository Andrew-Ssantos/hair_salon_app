import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_drawer/hs_drawer.dart';
import 'package:hair_salon_app/core/widgets/hs_home_scheduled_client/hs_home_scheduled_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Tela inicial')),
        drawer: HsDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Clientes agendados hoje:',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        '7',
                        style: TextStyle(
                          color: ColorsConstants.purple,
                          fontSize: 37,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorsConstants.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: const EdgeInsets.all(10),
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
                          Expanded(child: HsHomeScheduledClient()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
