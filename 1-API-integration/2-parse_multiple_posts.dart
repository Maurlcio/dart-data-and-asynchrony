import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> fetchPostTitles() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  List<Map<String, dynamic>> titlesList = [];
  
  try {
    var response = await http.get(url);
    
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      for (var post in dataList) {
        titlesList.add({'title': post['title']});
      }
      return (titlesList);
    } else {
      print("Request was unsuccessful - ${response.statusCode}.");
      return (titlesList);
    }
  } catch (e) {
    print("Exception occurred!");
    return (titlesList);
  }
}

void main() async {
  List<Map<String, dynamic>> posts = await fetchPostTitles();
  print(posts);
}