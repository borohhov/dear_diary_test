import 'package:dear_diary/controllers/camera_provider.dart';
import 'package:dear_diary/controllers/open_meteo_weather_controller.dart';
import 'package:dear_diary/controllers/photo_memory_provider.dart';
import 'package:dear_diary/screens/display_image_screen.dart';
import 'package:dear_diary/screens/feed_screen.dart';
import 'package:dear_diary/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => CameraProvider(),
      ),
      ChangeNotifierProvider(create: (context) => PhotoMemoryProvider())
    ], child: MyApp(),)

  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dear Diary...',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/displayImageScreen': (context) => const DisplayImageScreen(),
        '/feedScreen': (context) => const FeedScreen()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
    );
  }
}
