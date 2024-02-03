import 'package:dear_diary/entities/photo_memory.dart';
import 'package:dear_diary/widgets/photo_memory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


List<PhotoMemory> demoList = [
  PhotoMemory(DateTime.now(), 'Image 1 caption Image 1 caption Image 1 caption Image 1 caption Image 1 caption Image 1 caption',
      'https://atxanimalclinic.com/wp-content/uploads/2021/08/cats-and-dogs-shared-diseases-2.jpg'),
  PhotoMemory(DateTime.now(), 'Image 2 caption',
      'https://www.webbox.co.uk/wp-content/uploads/2019/04/shutterstock_1095001973.jpg'),
  PhotoMemory(DateTime.now(), 'Image 2 caption',
      'https://www.webbox.co.uk/wp-content/uploads/2019/04/shutterstock_1095001973.jpg')
];
class FeedScreen extends StatelessWidget {
  const FeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: demoList.map((photoMemory) {
        Column col = Column( children: [
          PhotoMemoryWidget(photoMemory: photoMemory),
          Container(
            height: 2,
            color: Colors.black12,
          )
        ],);
        return col;
      }).toList(),
    );
  }
}