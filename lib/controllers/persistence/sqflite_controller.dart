import 'package:dear_diary/controllers/persistence/persistence_controller.dart';
import 'package:dear_diary/entities/photo_memory.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteController implements PersistenceController {
  late Database database;

  @override
  Future<void> init() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'photo_memory_database.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        //  DateTime date;
        //   String description;
        //   String filePath;
        //   String weather = "";
        return db.execute(
          'CREATE TABLE photo_memories(id INTEGER PRIMARY KEY, date TEXT, description TEXT, filePath TEXT, weather TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  @override
  Future<List<PhotoMemory>> getAllData() async {
    await init();
    // Query the table for all the dogs.
    final List<Map<String, Object?>> photoMemories = await database.query('photo_memories');

    // Convert the list of each dog's fields into a list of `photo memories` objects.
    return photoMemories.map((pm) => PhotoMemory.fromMap(pm)).toList();
  }

  @override
  Future<void> saveData(PhotoMemory photoMemory) async {
    await init();
    await database.insert(
      'photo_memories',
      photoMemory.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
