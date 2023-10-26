import 'dart:developer';

import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/database.dart';
import 'package:hair_salon_app/features/salon_services/atom/salon_services_atom.dart';
import 'package:hair_salon_app/features/salon_services/presenter/states/salon_services_states.dart';

class SalonServiceController {
  Future<void> fetchSalonServices() async {
    salonServicesState.setValue(SalonServicesStatesLoading());
    salonServicesList.value.clear();
    try {
      final db = Database();
      final servicesList = await db.findAllSalonServices();
      salonServicesList.value.addAll(servicesList);
      salonServicesState.setValue(SalonServicesStatesSuccess(salonServicesList.value));
    } catch (e, s) {
      log('Erro ao carregar serviços', error: e, stackTrace: s);
    }
  }

  addSalonService(SalonService newService) {
    try {
      return Database().addSalonService(newService);
    } on Exception catch (e, s) {
      log('Erro ao carregar serviços', error: e, stackTrace: s);
    }
  }

  deleteSalonService(SalonService service) {
    try {
      return Database().deleteSalonService(service);
    } on Exception catch (e, s) {
      log('Erro ao deletar serviço', error: e, stackTrace: s);
    }
  }
}
