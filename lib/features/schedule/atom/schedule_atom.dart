import 'package:asp/asp.dart';
import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/schedule_state.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/scheduled_client_data_state.dart';

final schedulesList = Atom<List<Schedule>>([]);
final scheduleState = Atom<ScheduleState>(ScheduleStateLoading());
final scheduleListState = Atom<ScheduledClientDataState>(ScheduledClientDataStateLoading());
