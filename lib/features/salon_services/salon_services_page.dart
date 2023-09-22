import 'package:flutter/material.dart';

class SalonServicesPage extends StatelessWidget {
  const SalonServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
      ),
      body: Center(child: Text('SERVIÇOS')),
    );
  }
}
