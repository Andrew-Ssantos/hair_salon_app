import 'package:isar/isar.dart';

part 'salon_services_collection.g.dart';

@embedded
@collection
class SalonServicesCollection {
  Id id = Isar.autoIncrement;
  String? serviceName;
  double? price;
}
