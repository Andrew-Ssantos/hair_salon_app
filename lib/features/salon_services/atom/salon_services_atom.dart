import 'package:asp/asp.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/features/salon_services/presenter/states/salon_services_states.dart';

final salonServicesList = Atom<List<SalonService>>([]);
final salonServicesState = Atom<SalonServicesStates>(SalonServicesStatesLoading());
