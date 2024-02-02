import 'package:dear_diary/entities/photo_memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PhotoMemoryWidget extends StatelessWidget {
  PhotoMemoryWidget({super.key, required this.photoMemory});

  final PhotoMemory photoMemory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            DateFormat('MMM d, yyyy').format(photoMemory.date),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(photoMemory.filePath),
          Text(photoMemory.text)
        ],
      ),
    );
  }
}

/**
    class Test extends StatelessWidget {
    const Test({super.key});

    @override
    Widget build(BuildContext context) {
    // Named argument
    //return PhotoMemoryWidget(photoMemory: photoMemory, key: Key('test'),);

    // Positional argument
    return PhotoMemoryWidget('test', photoMemory: PhotoMemory());
    }
    }
 **/
