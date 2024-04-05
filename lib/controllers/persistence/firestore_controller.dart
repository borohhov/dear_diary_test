import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/controllers/persistence/persistence_controller.dart';
import 'package:dear_diary/entities/photo_memory.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';

class FirestoreController implements PersistenceController {
  late FirebaseFirestore db;

  @override
  Future<List<PhotoMemory>> getAllData() async {
    await init();
    QuerySnapshot snapshot = await db.collection('photoMemories').get();
    List<PhotoMemory> memories = snapshot.docs
        .map(
            (mem)  {
              Map<String, dynamic> data = mem.data() as Map<String, dynamic>;
              return PhotoMemory.fromMap(data);
            })
        .toList();
    return memories;
  }

  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    db = FirebaseFirestore.instance;
  }

  @override
  Future<void> saveData(PhotoMemory photoMemory) async {
    await init();
    await db.collection('photoMemories').add(photoMemory.toMap());
  }
}
