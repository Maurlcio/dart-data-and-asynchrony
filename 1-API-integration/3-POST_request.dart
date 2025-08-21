import 'package:http/http.dart' as http;
import 'dart:convert';

Future<int> sendPost() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  Map<String, dynamic> jsonField = {
  "title": "Hello",
  "body": "This is a test post",
  "userId": 1
};
  
  try {
    // sending the POST request
    var response = await http.post(url, body: jsonEncode(jsonField));
    
    // check if request code is 201 (request is successful)
    if (response.statusCode == 201) {
      Map<String, dynamic> dataMap = jsonDecode(response.body);
      return (dataMap['id']);
    } else {
      return response.statusCode;
    }
  } catch (e) {
    return -1;
  }
}

void main() async {
  int result = await sendPost();
  print(result);
}