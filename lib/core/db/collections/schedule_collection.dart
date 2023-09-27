import 'package:hair_salon_app/features/salon_services/model/salon_services.dart';
import 'package:isar/isar.dart';

part 'schedule_collection.g.dart';

@collection
class ScheduleCollection {
  Id id = Isar.autoIncrement;
  String? clientName;
  DateTime? date;
  double? startHour;
  double? endHour;
  String? phone;
  SalonServices? services;
  double? price;
}
