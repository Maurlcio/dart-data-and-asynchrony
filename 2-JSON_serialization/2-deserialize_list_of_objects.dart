import 'dart:convert';

class User {
  int id = 0;
  String name = "";
  String email = "";

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}

List<User> parseUsers(String jsonStr){
  List<dynamic> jsonList = jsonDecode(jsonStr);
  return jsonList.map((json) {
    User user = User();
    user.fromJson(json);
    return user;
  }).toList();
}

void main(){
  String jsonString = '''
  [
    {"id": 1, "name": "Alice", "email": "alice@example.com"},
    {"id": 2, "name": "Bob", "email": "bob@example.com"},
    {"id": 3, "name": "Charlie", "email": "charlie@example.com"}
  ]''';

  List<User> users = parseUsers(jsonString);
}