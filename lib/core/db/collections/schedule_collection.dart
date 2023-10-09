import 'package:hair_salon_app/core/db/collections/salon_services_collection.dart';
import 'package:isar/isar.dart';

part 'schedule_collection.g.dart';

@collection
class ScheduleCollection {
  Id id = Isar.autoIncrement;
  String? clientName;
  DateTime? date;
  double? startHour;
  double? endHour;
  String? whatsappNumber;
  final services = IsarLinks<SalonServicesCollection>();
  double? price;
  bool? isServiceFinished;
}
