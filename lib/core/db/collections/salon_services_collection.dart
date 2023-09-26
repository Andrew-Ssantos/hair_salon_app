import 'package:isar/isar.dart';

// part 'salon_services_collection.g.dart';

@Collection()
class SalonServicesCollection {
  Id id = Isar.autoIncrement;
  late String serviceName;
  late double price;
}
