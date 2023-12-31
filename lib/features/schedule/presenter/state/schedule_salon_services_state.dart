import 'package:hair_salon_app/core/db/collections/salon_service.dart';

sealed class ScheduleSalonServicesState {
  ScheduleSalonServicesState();
}

class ScheduleSalonServicesStateEmpty extends ScheduleSalonServicesState {
  ScheduleSalonServicesStateEmpty();
}

class ScheduleSalonServicesStateSuccess extends ScheduleSalonServicesState {
  final List<SalonService> data;
  ScheduleSalonServicesStateSuccess(this.data);
}

class ScheduleSalonServicesStateLoading extends ScheduleSalonServicesState {
  ScheduleSalonServicesStateLoading();
}

class ScheduleSalonServicesStateFail extends ScheduleSalonServicesState {
  final String errorMessage;
  ScheduleSalonServicesStateFail(this.errorMessage);
}
