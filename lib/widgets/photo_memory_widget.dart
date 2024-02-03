import 'package:dear_diary/entities/photo_memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          Center(
            // Use a Container to create a square shape
            child: Container(
              width: 200, // Specify the width of the square
              height: 200, // Specify the height of the square
              decoration: BoxDecoration(
                // Optionally, add a border around the square
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Image.network(
                'https://your-image-url-here.com/image.jpg',
                fit: BoxFit.cover, // This will cover the square area without changing the aspect ratio of the image
              ),
            ),
          ),
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
