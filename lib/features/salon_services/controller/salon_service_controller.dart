import 'dart:developer';

import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/database.dart';
import 'package:hair_salon_app/features/salon_services/atom/salon_services_atom.dart';
import 'package:hair_salon_app/features/salon_services/presenter/states/salon_services_states.dart';

class SalonServiceController {
  final db = Database();

  fetchSalonServices() async {
    salonServicesState.setValue(SalonServicesStatesLoading());
    salonServicesList.value.clear();
    try {
      final servicesList = await db.findAllSalonServices();
      salonServicesList.value.addAll(servicesList);
      salonServicesState.setValue(SalonServicesStatesSuccess(salonServicesList.value));
    } catch (e, s) {
      log('Erro ao lista de serviços', error: e, stackTrace: s);
    }
  }

  addSalonService(SalonService newService) async {
    try {
      return await db.addSalonService(newService);
    } on Exception catch (e, s) {
      log('Erro ao incluir serviço', error: e, stackTrace: s);
    }
  }

  updateSalonService(SalonService service) async {
    try {
      return await db.updateSalonService(service);
    } on Exception catch (e, s) {
      log('Erro ao atualizar serviço', error: e, stackTrace: s);
    }
  }

  deleteSalonService(SalonService service) async {
    try {
      return await db.deleteSalonService(service);
    } on Exception catch (e, s) {
      log('Erro ao deletar serviço', error: e, stackTrace: s);
    }
  }

  findSingleSalonService(int id) async {
    try {
      return await db.findSingleSalonService(id);
    } on Exception catch (e, s) {
      log('Erro ao carregar serviço', error: e, stackTrace: s);
    }
  }
}
