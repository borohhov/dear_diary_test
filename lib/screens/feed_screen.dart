import 'package:dear_diary/controllers/photo_memory_provider.dart';
import 'package:provider/provider.dart';
import 'package:dear_diary/widgets/photo_memory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../entities/photo_memory.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PhotoMemory>>(
        future: Provider.of<PhotoMemoryProvider>(context).getAllPhotoMemories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              snapshot.data!.isNotEmpty) {
            return Column(
              children: snapshot.data!.map((photoMemory) {
                Column col = Column(
                  children: [
                    PhotoMemoryWidget(photoMemory: photoMemory),
                    Container(
                      height: 2,
                      color: Colors.black12,
                    )
                  ],
                );
                return col;
              }).toList(),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(
              child: Text('You don\'t have any memories, create some first'),
            );
          } else {
            return Center(
              child: Text('Loading...'),
            );
          }
        });
  }
}
