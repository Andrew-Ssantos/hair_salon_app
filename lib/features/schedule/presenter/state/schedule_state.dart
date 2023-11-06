import 'package:hair_salon_app/core/db/collections/schedule.dart';

sealed class ScheduleState {
  ScheduleState();
}

class ScheduleStateSuccess extends ScheduleState {
  final Schedule schedule;
  ScheduleStateSuccess(this.schedule);
}

class ScheduleStateFail extends ScheduleState {
  final String errorMessage;
  ScheduleStateFail(this.errorMessage);
}

class ScheduleStateLoading extends ScheduleState {}
