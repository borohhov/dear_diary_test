import 'package:dear_diary/controllers/persistence/firestore_controller.dart';
import 'package:dear_diary/controllers/persistence/persistence_controller.dart';
import 'package:dear_diary/controllers/persistence/sqflite_controller.dart';
import 'package:dear_diary/entities/photo_memory.dart';
import 'package:flutter/material.dart';

class PhotoMemoryProvider extends ChangeNotifier {
  List<PhotoMemory> _demoList = [
    PhotoMemory(DateTime.now(), 'Image 1 caption Image 1 caption Image 1 caption Image 1 caption Image 1 caption Image 1 caption',
        'https://atxanimalclinic.com/wp-content/uploads/2021/08/cats-and-dogs-shared-diseases-2.jpg'),
    PhotoMemory(DateTime.now(), 'Image 2 caption',
        'https://www.webbox.co.uk/wp-content/uploads/2019/04/shutterstock_1095001973.jpg'),
    PhotoMemory(DateTime.now(), 'Image 2 caption',
        'https://www.webbox.co.uk/wp-content/uploads/2019/04/shutterstock_1095001973.jpg')
  ];
  PersistenceController persistenceController = FirestoreController();
  Future<void> addPhotoMemory(PhotoMemory pm) async {
    //_demoList.add(pm);
    await persistenceController.saveData(pm);
    notifyListeners();
  }

  Future<List<PhotoMemory>> getAllPhotoMemories() async {
    //_demoList.sort();
    return persistenceController.getAllData();
  }
}
