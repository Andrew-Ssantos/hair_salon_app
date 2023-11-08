import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:isar/isar.dart';

part 'schedule.g.dart';

@collection
class Schedule {
  Id id = Isar.autoIncrement;
  String? clientName;
  DateTime? date;
  DateTime? startHour;
  DateTime? endHour;
  String? whatsappNumber;
  final services = IsarLinks<SalonService>();
  double? price;
  bool? isServiceFinished;
}
