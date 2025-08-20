import 'dart:io';

Future<void> listStorageFiles() async{
  List<String> fileNames = [];
  String fileName = '';
  Directory myStorage = Directory('storage');

  await for (var file in myStorage.list()){
    fileName = file.path.split("\\").last;
    fileNames.add(fileName);
  }
  print(fileNames);
}

void main() {
  listStorageFiles();
}