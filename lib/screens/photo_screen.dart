// A screen that allows users to take a picture using a given camera.
import 'package:camera/camera.dart';
import 'package:dear_diary/controllers/camera_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PhotoCaptureScreen extends StatefulWidget {
  const PhotoCaptureScreen({
    super.key,
  });

  @override
  PhotoCaptureScreenState createState() => PhotoCaptureScreenState();
}

class PhotoCaptureScreenState extends State<PhotoCaptureScreen> {
  late CameraController _controller;
  bool _isCapturing = false;
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
  void _captureImage() async {
    if (_isCapturing) {
      return; // If a capture is already in progress, do nothing
    }

    setState(() {
      _isCapturing = true; // Disable the button
    });

    try {
      // Attempt to take a picture
      final image = await _controller.takePicture();
      // Process the image as needed
      setState(() {
        _isCapturing = false; // Re-enable the button
      });
      var img = image;
    } catch (e) {
      // Handle any errors here
      print(e);
    } finally {
      setState(() {
        _isCapturing = false; // Re-enable the button
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return FutureBuilder<CameraController>(
      future: Provider.of<CameraProvider>(context).getCameraController(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done ) {
          _controller = snapshot.data!;
          // If the Future is complete, display the preview.
          return Column(
            children: [
              CameraPreview(_controller),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: _isCapturing ? null : _captureImage,
                    child: Text(
                      'Capture',
                      style: TextStyle(fontSize: 50),
                    )),
              )
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
