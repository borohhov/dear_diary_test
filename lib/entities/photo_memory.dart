class PhotoMemory implements Comparable<PhotoMemory> {
  DateTime date;
  String text;
  String filePath;
  String weather = "";

  PhotoMemory(this.date, this.text, this.filePath);

  @override
  int compareTo(PhotoMemory other) {
    if(date.compareTo(other.date) == -1) {
      return 1;
    } else if (date.compareTo(other.date) == 0) {
      return 0;
    }
    else {
      return -1;
    }
  }
}