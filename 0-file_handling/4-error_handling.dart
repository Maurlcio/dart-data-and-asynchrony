import 'dart:io';

void initializeLogFile(){
  try {
  File myFile = File('storage/data.txt');
  myFile.writeAsString("User activity log initialized");
  } catch (e) {
    print('Error: Could not read file');
  }
}

Future<List<String>> readLogFile() async{
  List<String> logLines = [];

  try {
    File file = File('storage/tata.txt');
    String fileContents = await file.readAsString();
    logLines.addAll(fileContents.split('\n'));
  } catch (e) {
    print('Error: File not found');
  }
  return (logLines);
}