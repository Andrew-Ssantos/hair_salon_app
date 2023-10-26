import 'package:hair_salon_app/core/db/collections/salon_service.dart';

sealed class SalonServicesStates {
  SalonServicesStates();
}

class SalonServicesStatesSuccess implements SalonServicesStates {
  final List<SalonService> data;
  SalonServicesStatesSuccess(this.data);
}

class SalonServicesStatesFail implements SalonServicesStates {
  final String errorMessage;
  SalonServicesStatesFail(this.errorMessage);
}

class SalonServicesStatesLoading implements SalonServicesStates {
  SalonServicesStatesLoading();
}
