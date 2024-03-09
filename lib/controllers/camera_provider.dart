import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraProvider extends ChangeNotifier  {
  Future<CameraDescription> getCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
    return cameras.last;
  }

  Future<CameraController> getCameraController() async {
    CameraController controller = CameraController(
      // Get a specific camera from the list of available cameras.
      await getCamera(),
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    await controller.initialize();
    return controller;
  }

}