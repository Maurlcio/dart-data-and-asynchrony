Stream<int> emitWithDelay(List<int> values) async* {
  for (var value in values) {
    await Future.delayed(Duration(milliseconds: 500)); 
    
    yield value;
  }
}

void main() async {
  List<int> values = [1, 2, 3, 4, 5, 6];

  await for (var value in emitWithDelay(values)) {
    print(value);
  }
}