class User {
  int id = 0;
  String name = "";
  String email = "";

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}

void main(){
  User user = User();
  user.id = 1;
  user.name = "Alice";
  user.email = "alice@example.com";

  Map<String, dynamic> json = user.toJson();
}