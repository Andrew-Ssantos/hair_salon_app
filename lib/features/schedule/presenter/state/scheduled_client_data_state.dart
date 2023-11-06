import 'package:hair_salon_app/core/db/collections/schedule.dart';

sealed class ScheduledClientDataState {
  ScheduledClientDataState();
}

class ScheduledClientDataStateSuccess extends ScheduledClientDataState {
  final List<Schedule> scheduledClients;
  ScheduledClientDataStateSuccess(this.scheduledClients);
}

class ScheduledClientDataStateFail extends ScheduledClientDataState {
  final String errorMessage;
  ScheduledClientDataStateFail(this.errorMessage);
}

class ScheduledClientDataStateLoading extends ScheduledClientDataState {}
