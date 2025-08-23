Future<String> simulateNetworkCall() async {
  await Future.delayed(Duration(seconds: 2));

  return("Data received");
}

void main() async {
  String networkCall = await simulateNetworkCall();
  print(networkCall);
}