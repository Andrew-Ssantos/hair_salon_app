import 'package:asp/asp.dart';
import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/schedule_state.dart';

final schedule = Atom<List<Schedule>>([]);
final scheduleState = Atom<ScheduleState>(ScheduleStateLoading());
