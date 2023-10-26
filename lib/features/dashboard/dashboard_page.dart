import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/widgets/hs_drawer/hs_drawer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: HsDrawer(),
      body: const Center(child: Text('DASHBOARD')),
    );
  }
}
