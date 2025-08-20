import 'dart:io';

Future<bool> deleteLogFileIfExists() async {
  File myFile = File('storage/data.txt');

  // A try-catch block is entirely vestigial in this exercise,
  // but it's still good practice to have just in case
  try {
    if (await myFile.exists()){
      await myFile.delete();
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print("Error: $e");
    return false;
  }
}

void main() async {
  bool result = await deleteLogFileIfExists();
  print (result);
}