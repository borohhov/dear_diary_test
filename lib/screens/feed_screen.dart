import 'package:dear_diary/widgets/photo_memory_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entities/photo_memory.dart';

List<PhotoMemory> demoList = [
  PhotoMemory(DateTime.now(), 'Image 1 caption', 'Image 1 path'),
  PhotoMemory(DateTime.now(), 'Image 2 caption', 'Image 2 path')
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: demoList
              .map((photoMemory) => PhotoMemoryWidget(photoMemory: photoMemory))
              .toList(),
        ),
      ),
    );
  }

/**
 * Identical code for mapping demoList to a list of PhotoMemoryWidget
 *
 * List<PhotoMemoryWidget> getPhotoMemories() {
    List<PhotoMemoryWidget> p = [];
    for(var i = 0; i < demoList.length; i++) {
    p.add(PhotoMemoryWidget(photoMemory: demoList[i]));
    }
    return p;
    }
 **/
}
