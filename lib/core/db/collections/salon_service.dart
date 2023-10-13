import 'package:isar/isar.dart';

part 'salon_service.g.dart';

@collection
class SalonService {
  Id id = Isar.autoIncrement;
  String? serviceName;
  double? price;
}
