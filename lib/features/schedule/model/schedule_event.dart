class ScheduleEvent {
  final String clientName;
  final String whatsappNumber;
  // final DateTime startHour;
  // final DateTime endHour;
  final Future<void> services;
  final double price;
  final bool isServiceFinished;

  ScheduleEvent({
    required this.clientName,
    required this.whatsappNumber,
    // required this.startHour,
    // required this.endHour,
    required this.services,
    required this.price,
    required this.isServiceFinished,
  });
}
