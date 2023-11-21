import 'package:asp/asp.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';

final dropValue = Atom<SalonService>(
  SalonService()
    ..price = 0
    ..serviceName = '',
);

final scheduleClientServiceList = Atom<List<SalonService>>([]);
