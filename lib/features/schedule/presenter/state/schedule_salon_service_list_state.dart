import 'package:hair_salon_app/core/db/collections/salon_service.dart';

sealed class ScheduleSalonServiceListState {
  ScheduleSalonServiceListState();
}

class ScheduleSalonServiceListStateLoading extends ScheduleSalonServiceListState {}

class ScheduleSalonServiceListStateSuccess extends ScheduleSalonServiceListState {
  final List<SalonService> salonServicesList;
  ScheduleSalonServiceListStateSuccess(this.salonServicesList);
}

class ScheduleSalonServiceListStateFail extends ScheduleSalonServiceListState {
  final String errorMessage;
  ScheduleSalonServiceListStateFail(this.errorMessage);
}
