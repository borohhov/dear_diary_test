import 'package:dear_diary/screens/feed_screen.dart';
import 'package:dear_diary/screens/photo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }


}
class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [];
  late Widget displayedScreen = FeedScreen();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      displayedScreen = screens[index];
    });
  }
  @override
  Widget build(BuildContext context) {
    screens = [
      FeedScreen(),
      PhotoCaptureScreen()
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: displayedScreen,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Photo',
          ),
        ],
        currentIndex: _selectedIndex, // Current selected item's index
        selectedItemColor: Colors.amber[800], // Color of the selected item
        onTap: _onItemTapped, // Function to handle item taps
      ),
    );
  }

/**
 * Identical code for mapping demoList to a list of PhotoMemoryWidget
 *
 * List<PhotoMemoryWidget> getPhotoMemories() {
    List<PhotoMemoryWidget> p = [];
    for(var i = 0; i < demoList.length; i++) {
    p.add(PhotoMemoryWidget(photoMemory: demoList[i]));
    }
    return p;
    }
 **/
}


