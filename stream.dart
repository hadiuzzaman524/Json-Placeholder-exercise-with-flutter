import 'dart:math';

class A {
  int roll;
  String name;
  A(this.roll, this.name);
}

Stream<A> getRiver() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield A(i, 'hadiuzzaman');
  }
}

void main() {
  Stream<A> stream = getRiver();
  stream.listen((event) {
    print(event.roll);
    print(event.name);
  });
}
