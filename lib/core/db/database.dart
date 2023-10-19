import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  Future<Isar> connectDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final db = await Isar.open(
      [ScheduleSchema, SalonServiceSchema],
      directory: dir.path,
      inspector: true,
    );
    return db;
  }

  Future<void> addSalonService(SalonService newService) async {
    final db = await connectDB();
    final salonService = db.salonServices;
    await db.writeTxn(() async {
      await salonService.put(newService);
    });
  }

  Future<void> deleteSalonService(SalonService service) async {
    final db = await connectDB();
    final salonService = db.salonServices;
    await db.writeTxn(() async {
      await salonService.delete(service.id);
    });
  }
}
