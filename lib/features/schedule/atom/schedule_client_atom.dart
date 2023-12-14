import 'package:asp/asp.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/schedule_salon_services_state.dart';

final scheduleClientServiceList = Atom<List<SalonService>>([]);
final scheduleSalonServicesState = Atom<ScheduleSalonServicesState>(ScheduleSalonServicesStateEmpty());

final date = Atom<DateTime>(DateTime.now());
final initialHour = Atom<DateTime>(DateTime.now());
final finalHour = Atom<DateTime>(DateTime.now());
final totalValue = Atom<double>(0.00);
