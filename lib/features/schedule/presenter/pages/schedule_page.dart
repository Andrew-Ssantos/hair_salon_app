import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/widgets/hs_drawer.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda')),
      drawer: const HsDrawer(),
      body: const Center(
        child: Text('AGENDA'),
      ),
    );
  }
}
