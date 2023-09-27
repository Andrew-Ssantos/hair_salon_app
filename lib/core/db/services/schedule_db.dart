import 'package:hair_salon_app/core/db/collections/schedule_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ScheduleDb {
  Future<void> connectDb() async {
    final dir = await getLibraryDirectory();
    final db = await Isar.open(
      [ScheduleCollectionSchema],
      directory: dir.path,
    );
    print(db);
  }
}
