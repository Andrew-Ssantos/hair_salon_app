import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';
import 'package:hair_salon_app/features/schedule/controller/schedule_controller.dart';
import 'package:hair_salon_app/features/splash/atom/splash_atom.dart';
import 'package:hair_salon_app/features/splash/presenter/state/splash_state.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final salonServiceController = Modular.get<SalonServiceController>();
  final scheduleController = Modular.get<ScheduleController>();

  _fetchServicesList() async {
    await salonServiceController.fetchSalonServices();
  }

  _fetchScheduledClientsList() async {
    await scheduleController.fetchAllScheduledClients();
  }

  _loadMainData() async {
    splashState.setValue(SplashStateLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      _fetchServicesList();
      _fetchScheduledClientsList();
      splashState.setValue(SplashStateSuccess());
    } on Exception catch (e, s) {
      log('Erro ao carregar lista de serviços', error: e, stackTrace: s);
      splashState.setValue(SplashStateFail('Erro ao carregar lista de serviços'));
    }
  }

  @override
  void initState() {
    _loadMainData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => splashState.value);

    return switch (state) {
      SplashStateLoading _ => loadScreen(),
      SplashStateSuccess _ => successScreen(),
      SplashStateFail state => Center(child: Text(state.errorMessage))
    };
  }

  loadScreen() {
    return Scaffold(
      backgroundColor: ColorsConstants.purple,
      body: Center(
        child: Lottie.asset(
          'lib/core/assets/animation/splash_page_icon.json',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget successScreen() {
    Modular.to.pushReplacementNamed('/main/');
    return const Scaffold(
      backgroundColor: ColorsConstants.purple,
      body: Center(
        child: Text(
          'Carregamento Concluído!',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
