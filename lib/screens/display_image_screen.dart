import 'dart:io';

import 'package:dear_diary/controllers/photo_memory_provider.dart';
import 'package:dear_diary/entities/photo_memory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayImageScreen extends StatefulWidget {
  const DisplayImageScreen({Key? key, this.imagePath}) : super(key: key);
  final String? imagePath;

  @override
  State<StatefulWidget> createState() {
    return DisplayImageScreenState();
  }
}

class DisplayImageScreenState extends State<DisplayImageScreen> {
  late PhotoMemory photoMemory;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    photoMemory = PhotoMemory(DateTime.now(), "", widget.imagePath ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captured Image")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Describe your memory..."),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: Image.file(File(photoMemory.filePath))),
            ),
            OutlinedButton(onPressed: () {
              photoMemory.text = textEditingController.value.text;
              Provider.of<PhotoMemoryProvider>(context, listen: false).addPhotoMemory(photoMemory);
            }, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
