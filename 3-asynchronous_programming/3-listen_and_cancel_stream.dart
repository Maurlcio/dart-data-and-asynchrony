import 'dart:async';

Stream<int> emitWithDelay(List<int> values) async* {
  for (var value in values) {
    await Future.delayed(Duration(milliseconds: 500));
    
    yield value;
  }
}

void listenAndCancel(Stream<int> stream) {
  late StreamSubscription<int> subscription;

  subscription = stream.listen((value) {
      print(value);

      if (value == 3) {
        subscription.cancel();
      }
    },
  );
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  listenAndCancel(emitWithDelay(numbers));
}