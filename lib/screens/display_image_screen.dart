import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImageScreen extends StatelessWidget {

  const DisplayImageScreen({Key? key, this.imagePath}) : super(key: key);
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captured Image")),
      body: Center(
        child: Image.file(File(imagePath ?? ""))
      ),
    );
  }
}