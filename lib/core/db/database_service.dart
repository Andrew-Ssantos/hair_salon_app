import 'package:hair_salon_app/core/db/collections/salon_services_collection.dart';
import 'package:hair_salon_app/core/db/collections/schedule_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  Future<Isar> connectDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final db = await Isar.open(
      [ScheduleCollectionSchema, SalonServicesCollectionSchema],
      directory: dir.path,
      inspector: true,
    );
    return db;
  }

  Future<void> addSalonServices(SalonServicesCollection service) async {
    final db = await connectDb();
    final salonServices = db.collection<SalonServicesCollection>();
    await db.writeTxn(() async {
      await salonServices.put(service);
    });
  }

  Future<void> deleteSalonServices(SalonServicesCollection service) async {
    final db = await connectDb();
    final salonServices = db.collection<SalonServicesCollection>();
    await db.writeTxn(() async {
      await salonServices.delete(service.id);
    });
  }
}
