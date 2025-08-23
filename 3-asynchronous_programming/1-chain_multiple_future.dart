Future<String> multiStepProcess() async {
  await Future.delayed(Duration(seconds: 1));
  print('Step 1');

  await Future.delayed(Duration(seconds: 1));
  print('Step 2');

  return 'Done';
}

void main() async {
  String multipleFutures = await multiStepProcess();
  print(multipleFutures);
}