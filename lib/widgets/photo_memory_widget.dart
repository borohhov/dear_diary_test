import 'dart:io';

import 'package:dear_diary/entities/photo_memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PhotoMemoryWidget extends StatelessWidget {
  PhotoMemoryWidget({super.key, required this.photoMemory});

  final PhotoMemory photoMemory;

  @override
  Widget build(BuildContext context) {
    Widget image;
    if(photoMemory.filePath.startsWith('http')) {
      image = Image.network(
        Uri.encodeFull(photoMemory.filePath),
        fit: BoxFit
            .cover, // This will cover the square area without changing the aspect ratio of the image
      );
    }
    else {
      image = Image.file(File(photoMemory.filePath));
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              DateFormat('MMM d, yyyy').format(photoMemory.date),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            // Use a Container to create a square shape
            child: Container(
              height: 500, // Specify the height of the square
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // Optionally, add a border around the square
                border: Border.all(color: Colors.black45),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // Match the Container's BorderRadius
                child: image
              ),
            ),
          ),
          Text(photoMemory.text, style: TextStyle(fontSize: 16),)
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
