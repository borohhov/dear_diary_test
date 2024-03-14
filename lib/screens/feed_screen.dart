import 'package:dear_diary/controllers/photo_memory_provider.dart';
import 'package:provider/provider.dart';
import 'package:dear_diary/widgets/photo_memory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Provider.of<PhotoMemoryProvider>(context)
          .getAllPhotoMemories()
          .map((photoMemory) {
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
  }
}
