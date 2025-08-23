import 'dart:math';

Future<String> safeNetworkCall() async {
  try {
    await Future.delayed(Duration(seconds: 2));

    // this generates a random boolean and throws an exception if false
    if (!Random().nextBool()) {
      throw Exception("Network error");
    }

    return ("Data received");
  } catch (e) {
    return ("Fallback data");
  }
}

void main() async {
  String result = await safeNetworkCall();
  print(result);
}
