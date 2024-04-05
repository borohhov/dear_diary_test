import 'dart:io';

import 'package:dear_diary/controllers/open_meteo_weather_controller.dart';
import 'package:dear_diary/controllers/photo_memory_provider.dart';
import 'package:dear_diary/entities/photo_memory.dart';
import 'package:dear_diary/entities/weather_data.dart';
import 'package:dear_diary/utils/weather_utils.dart';
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            WeatherData wd = await fetchWeather();
            photoMemory.weather = getWeatherIcon(wd);
            photoMemory.description = textEditingController.value.text;
            await Provider.of<PhotoMemoryProvider>(context, listen: false)
                .addPhotoMemory(photoMemory);
            Navigator.of(context).popAndPushNamed('/');
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration:
                    InputDecoration(hintText: "Describe your memory..."),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // Optionally, add a border around the square
                    border: Border.all(color: Colors.black45),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: Image.file(File(photoMemory.filePath))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
