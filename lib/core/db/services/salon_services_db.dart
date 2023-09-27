import 'package:hair_salon_app/core/db/collections/salon_services_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class SalonServicesDb {
  Future<void> connectDb() async {
    final dir = await getLibraryDirectory();
    final db = await Isar.open(
      [SalonServicesCollectionSchema],
      directory: dir.path,
    );
  }
}
