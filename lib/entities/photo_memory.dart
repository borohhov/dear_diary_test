class PhotoMemory implements Comparable<PhotoMemory> {
  DateTime date;
  String description;
  String filePath;
  String weather = "";

  PhotoMemory(this.date, this.description, this.filePath);

  Map<String, Object> toMap() {
    // Serializing objects into data
    return {
      'date': date.toString(),
      'description': description,
      'filePath': filePath,
      'weather': weather,
    };
  }

  factory PhotoMemory.fromMap(Map<String, dynamic> map) {
    PhotoMemory pm = PhotoMemory(
      DateTime(map['date']),
      map['description'],
      map['filePath'],
    );
    pm.weather = map['weather'];
    return pm;
  }

  @override
  int compareTo(PhotoMemory other) {
    if (date.compareTo(other.date) == -1) {
      return 1;
    } else if (date.compareTo(other.date) == 0) {
      return 0;
    } else {
      return -1;
    }
  }
}
