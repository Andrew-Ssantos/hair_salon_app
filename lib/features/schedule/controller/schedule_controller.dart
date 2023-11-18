import 'dart:developer';
import 'package:hair_salon_app/core/db/database.dart';
import 'package:hair_salon_app/features/schedule/atom/schedule_atom.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/schedule_salon_service_list_state.dart';

class ScheduleController {
  final db = Database();

  fetchSalonServicesList() async {
    scheduleSalonServiceListState.setValue(ScheduleSalonServiceListStateLoading());
    scheduleSalonServicesList.value.clear();
    try {
      final salonServicesList = await db.findAllSalonServices();
      scheduleSalonServicesList.value.addAll(salonServicesList);
      scheduleSalonServiceListState.setValue(ScheduleSalonServiceListStateSuccess(scheduleSalonServicesList.value));
    } on Exception catch (e, s) {
      log('Erro ao carregar lista de serviços do agendamento.', error: e, stackTrace: s);
    }
  }
}
