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

void main(){
  Map<String, dynamic> json = {
  "id": 1,
  "name": "Alice",
  "email": "alice@example.com"
  };
  User user = User();

  user.fromJson(json);
}