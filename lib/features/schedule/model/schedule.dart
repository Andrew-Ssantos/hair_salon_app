import 'package:hair_salon_app/features/salon_services/model/salon_services.dart';

class Schedule {
  final String id;
  final String clientName;
  final DateTime date;
  final double startHour;
  final double endHour;
  final String phone;
  final SalonServices services;
  final double price;

  Schedule({
    required this.id,
    required this.clientName,
    required this.date,
    required this.startHour,
    required this.endHour,
    required this.phone,
    required this.services,
    required this.price,
  });
}
