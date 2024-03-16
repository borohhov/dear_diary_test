// A screen that allows users to take a picture using a given camera.
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dear_diary/controllers/camera_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'display_image_screen.dart';

class PhotoCaptureScreen extends StatefulWidget {
  const PhotoCaptureScreen({
    super.key,
  });

  @override
  PhotoCaptureScreenState createState() => PhotoCaptureScreenState();
}

class PhotoCaptureScreenState extends State<PhotoCaptureScreen> {
  late CameraController _controller;

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future<void> captureImageAndNavigate(context) async {
    if (!_controller.value.isInitialized) {
      print('Error: Camera not initialized.');
      return;
    }

    try {
      final XFile image = await _controller.takePicture();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayImageScreen(imagePath: image.path),
        ),
      );
    } catch (e) {
      print('Error: ${e.toString()}');
      // Handle any errors that occur during capture.
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return FutureBuilder<CameraController>(
      future: Provider.of<CameraProvider>(context).getCameraController(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller = snapshot.data!;
          // If the Future is complete, display the preview.
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Expanded(child: CameraPreview(_controller)),
                  Container(
                      child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.blue.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () async =>
                                await captureImageAndNavigate(context),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              // Space between border and inner circle
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                // Transparent background
                                border: Border.all(
                                    color: Colors.white,
                                    width: 4), // White circular border
                              ),
                              child: Container(
                                width: 60, // Diameter of the inner circle
                                height: 60, // Diameter of the inner circle
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white, // White inner circle
                                ),
                              ),
                            )),
                      ),
                    ),
                  ))
                ],
              ),
            ],
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
