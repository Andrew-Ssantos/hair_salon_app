import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/widgets/hs_salon_services_list/hs_salon_services_list.dart';

class SalonServicesPage extends StatelessWidget {
  const SalonServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          HsSalonServicesList(),
        ],
      ),
    );
  }
}
