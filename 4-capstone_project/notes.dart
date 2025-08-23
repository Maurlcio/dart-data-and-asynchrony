import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class Note {
  int id;
  String title;
  String body;
  DateTime createdAt;

  Note({
    required this.id, 
    required this.title, 
    required this.body, 
    required this.createdAt
    });

  factory Note.fromJson(Map<String, dynamic> json) {
    DateTime createdAt = DateTime.parse(json['createdAt']);

    return Note(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

Future<void> writeNoteToFile(List<Note> notes, String filePath) async {
  try {
    List<Map<String, dynamic>> jsonNotes = notes.map((note) => note.toJson()).toList();
    String jsonString = jsonEncode(jsonNotes);
    final file = File(filePath);

    await file.writeAsString(jsonString);
    print("Notes have been saved to $filePath");
  } catch (e) {
    print("Error writing to file! $e");
  }
}

Future<List<Note>> readNoteFromFile(String filePath) async {
  try {
    final file = File(filePath);
    
    if (!await file.exists()) {
      return [];
    }

    String jsonString = await file.readAsString();

    if (jsonString.isEmpty) {
      return [];
    }

    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Note> notes = jsonList.map((json) => Note.fromJson(json)).toList();
    
    return (notes);
  } catch (e) {
    print("Error reading from file! $e");
    return [];
  }
}

Future<void> createAndSaveNote(String filePath) async {
  try {
    print("Enter the title of the note:");
    String title = stdin.readLineSync() ?? "";
    print("Enter the body of the note:");
    String body = stdin.readLineSync() ?? "";

    // this generates a new ID by grabbing the current highest ID and adding + 1 to it
    List<Note> notes = await readNoteFromFile(filePath);
    int newId = notes.isEmpty ? 1 : notes.last.id + 1;
    DateTime createdAt = DateTime.now();

    Note newNote = Note(id: newId, title: title, body: body, createdAt: createdAt);
    notes.add(newNote);
    await writeNoteToFile(notes, filePath);

    print("Note added successfully!");
  } catch (e) {
    print("Error creating note! $e");
  }
}

Future<void> sendNoteToAPI(List<Note> notes) async {
  try {
    Uri apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    // sending the title and body of the note as a test
    List<Map<String, dynamic>> notesData = notes.map((note) => {
      'title': note.title,
      'body': note.body,
    }).toList();

    for (var noteData in notesData) {
      var response = await http.post(apiUrl, body: jsonEncode(noteData), headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 201) {
        print("Note sent successfully to API");
      } else {
        print("Failed to send note. Status code: ${response.statusCode}");
      }
    }
  } catch (e) {
    print("Error sending notes to API: $e");
  }
}

Future<void> fetchNoteFromAPI() async {
  try {
    Uri apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<Note> notesFromAPI = jsonResponse.map((json) => Note.fromJson({
        'id': json['id'],
        'title': json['title'],
        'body': json['body'],
        'createdAt': DateTime.now().toIso8601String(),
      })).toList();

      await writeNoteToFile(notesFromAPI, 'notes.json');

      print("Notes from API saved locally correctly!");
    } else {
      print("Could not get notes from API.");
    }
  } catch (e) {
    print("Error fetching notes from API!");
  }
}

Stream<Note> streamNoteWithDelay(List<Note> notes) async* {
  for (var note in notes) {
    await Future.delayed(Duration(seconds: 1));

    yield note;
  }
}