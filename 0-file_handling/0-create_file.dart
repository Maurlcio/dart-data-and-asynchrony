import 'dart:io';

void initializeLogFile() {
  Directory myStorage = Directory('');
  if (!myStorage.existsSync()) {
    // Checking if the directory exists is pretty pointless here,
    // this is just for the sake of me understanding how this syntax works
    Directory myStorage = Directory('storage');
    myStorage.createSync(recursive: true);
  }
  File myFile = File('storage/data.txt');
  myFile.writeAsString("User activity log initialized");
}

void main(){
  initializeLogFile();
}