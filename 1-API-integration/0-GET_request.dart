import 'package:http/http.dart' as http;
import 'dart:convert';

void fetchPost() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  Map<String, dynamic> bodyAndTitle = {};
  
  // sending the GET request
  var response = await http.get(url);
  
  // check if request code is 200 (request is successful)
  if (response.statusCode == 200) {
    Map<String, dynamic> dataMap = jsonDecode(response.body);
    bodyAndTitle['title'] = dataMap['title'];
    bodyAndTitle['body'] = dataMap['body'];
    print(bodyAndTitle);
  } else {
    print('Request failed - ${response.statusCode}.');
  }
}

void main() {
  fetchPost();
}