import 'package:equatable/equatable.dart';

class MyClass extends Equatable {
  String name;
  int roll;

  MyClass(this.name, this.roll);

  @override
  List<Object?> get props => [name, roll];

  @override
  bool? get stringify => false;
}
