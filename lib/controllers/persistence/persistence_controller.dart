import 'package:dear_diary/entities/photo_memory.dart';

abstract class PersistenceController {
  Future<void> init();
  Future<List<PhotoMemory>> getAllData();
  Future<void> saveData(PhotoMemory photoMemory);
}