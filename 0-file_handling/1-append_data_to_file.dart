import 'dart:io';

void appendLogEntry(File file, String entry) {
  file.writeAsString(entry, mode: FileMode.append);
}

void main(){
  File myFile = File('storage/data.txt');
  String currentTime = DateTime.now().toIso8601String();
  appendLogEntry(myFile, '\n' + currentTime);
}