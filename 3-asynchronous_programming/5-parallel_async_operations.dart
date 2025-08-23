Future<List<String>> runParallelCalls() async {
  Future<String> firstCall = Future.delayed(Duration(seconds: 1), () => "First");
  Future<String> secondCall = Future.delayed(Duration(seconds: 2), () => "Second");
  Future<String> thirdCall = Future.delayed(Duration(seconds: 3), () => "Third");

  List<String> results = await Future.wait([firstCall, secondCall, thirdCall]);

  return (results);
}

void main() async {
  List<String> result = await runParallelCalls();
  print(result);
}
