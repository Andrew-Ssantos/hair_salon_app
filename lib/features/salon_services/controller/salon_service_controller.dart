import 'dart:developer';

import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/database.dart';

class SalonServiceController {
  Future<List<SalonService>> fetchSalonServices() async {
    try {
      final db = Database();
      final servicesList = await db.findAllSalonServices();
      return servicesList.toList();
    } catch (e, s) {
      log('Erro ao carregar serviços', error: e, stackTrace: s);
      throw Exception('Exceção: $e');
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
