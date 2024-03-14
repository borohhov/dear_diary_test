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
  void addPhotoMemory(PhotoMemory pm) {
    _demoList.add(pm);
    notifyListeners();
  }

  List<PhotoMemory> getAllPhotoMemories() {
    return _demoList;
  }
}
