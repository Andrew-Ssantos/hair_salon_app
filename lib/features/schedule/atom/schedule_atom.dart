import 'package:asp/asp.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/schedule_salon_service_list_state.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/schedule_state.dart';

final schedule = Atom<List<Schedule>>([]);
final scheduleSalonServicesList = Atom<List<SalonService>>([]);
final scheduleState = Atom<ScheduleState>(ScheduleStateLoading());
final scheduleSalonServiceListState = Atom<ScheduleSalonServiceListState>(ScheduleSalonServiceListStateLoading());
