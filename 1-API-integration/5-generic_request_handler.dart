import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getJsonResponse(String url) async {
  try {
    //any URL passed to function will have to go through .toString() first
    var response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return;
    }
  } catch (e) {
    print("Exception occurred! $e");
    return;
  }
}