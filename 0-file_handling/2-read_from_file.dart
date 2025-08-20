import 'dart:io';

Future<List<String>> readLogFile(File file) async{
  List<String> logLines = [];
  String fileContents = await file.readAsString();
  logLines.addAll(fileContents.split('\n'));
  return (logLines);
}

void main() async{
  File myFile = File('storage/data.txt');
  List<String> logLines = [];

  logLines = await readLogFile(myFile);
  print(logLines);
}