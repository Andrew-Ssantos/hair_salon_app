import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  Future<Isar> connectDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [ScheduleSchema, SalonServiceSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addSalonService(SalonService newService) async {
    final db = await connectDB();

    final salonService = db.salonServices;
    await db.writeTxn(() async {
      await salonService.put(newService);
    });
  }

  Future<void> updateSalonService(SalonService service) async {
    final db = await connectDB();
    await db.writeTxn(() async {
      await db.salonServices.put(service);
    });
  }

  Future<void> deleteSalonService(SalonService service) async {
    final db = await connectDB();
    final salonService = db.salonServices;
    await db.writeTxn(() async {
      await salonService.delete(service.id);
    });
  }

  Future<SalonService?> findSingleSalonService(int id) async {
    final db = await connectDB();
    return await db.salonServices.get(id);
  }

  Future<List<SalonService>> findAllSalonServices() async {
    final db = await connectDB();
    return await db.salonServices.where().findAll();
  }
}
