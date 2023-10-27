import 'package:hair_salon_app/core/db/collections/salon_service.dart';

sealed class SalonServicesStates {
  SalonServicesStates();
}

class SalonServicesStatesSuccess extends SalonServicesStates {
  final List<SalonService> data;
  SalonServicesStatesSuccess(this.data);
}

class SalonServicesStatesFail extends SalonServicesStates {
  final String errorMessage;
  SalonServicesStatesFail(this.errorMessage);
}

class SalonServicesStatesLoading extends SalonServicesStates {
  SalonServicesStatesLoading();
}
