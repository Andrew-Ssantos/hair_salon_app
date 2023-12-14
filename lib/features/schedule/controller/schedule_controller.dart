import 'dart:developer';

import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:hair_salon_app/core/db/database.dart';
import 'package:hair_salon_app/features/schedule/atom/schedule_atom.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/scheduled_client_data_state.dart';

class ScheduleController {
  final db = Database();

  fetchAllScheduledClients() async {
    scheduleListState.setValue(ScheduledClientDataStateLoading());
    schedulesList.value.clear();

    try {
      final schedules = await db.findAllScheduledClients();
      schedulesList.value.addAll(schedules);
      scheduleListState.setValue(ScheduledClientDataStateSuccess(schedulesList.value));
    } on Exception catch (e, s) {
      log('Erro ao carregar agendamentos', error: e, stackTrace: s);
      scheduleListState.setValue(ScheduledClientDataStateFail('Erro ao carregar agendamentos'));
    }
  }

  addScheduledClient(Schedule newSchedule) async {
    try {
      await db.addScheduledClient(newSchedule);
    } on Exception catch (e, s) {
      log('Erro ao incluir agendamento', error: e, stackTrace: s);
    }
  }

  updateScheduledClient(Schedule schedule) async {
    try {
      await db.updateScheduledClient(schedule);
    } on Exception catch (e, s) {
      log('Erro ao atualizar agendamento', error: e, stackTrace: s);
    }
  }

  deleteScheduledClient(Schedule schedule) async {
    try {
      await db.addScheduledClient(schedule);
    } on Exception catch (e, s) {
      log('Erro ao excluir agendamento', error: e, stackTrace: s);
    }
  }

  findSingleScheduledClient(int id) async {
    try {
      await db.findSingleScheduledClient(id);
    } on Exception catch (e, s) {
      log('Erro ao incluir agendamento', error: e, stackTrace: s);
    }
  }
}
