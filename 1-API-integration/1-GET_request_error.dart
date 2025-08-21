import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchPost() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  Map<String, dynamic> bodyAndTitle = {};
  Map<String, dynamic> defaultResponse = {
    'title': 'Unavailable',
    'body': 'Error fetching post'
  };
  
  try {
    // sending the GET request
    var response = await http.get(url);
    // check if request code is 200 (request is successful)
    if (response.statusCode == 200) {
     Map<String, dynamic> dataMap = jsonDecode(response.body);
      bodyAndTitle['title'] = dataMap['title'];
      bodyAndTitle['body'] = dataMap['body'];
      print(bodyAndTitle);
      return (bodyAndTitle);
    } else {
      print("Request was unsuccessful - ${response.statusCode}.");
      return (defaultResponse);
    }
  } catch (e) {
    print("Exception occured!");
    return (defaultResponse);
  }
}

void main() async {
  Map<String, dynamic> testMap = await fetchPost();
  print(testMap);
}