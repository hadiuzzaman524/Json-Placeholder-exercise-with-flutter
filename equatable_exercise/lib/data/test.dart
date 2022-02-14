
class MyClass{
  String name;
  int roll;
  MyClass(this.name,this.roll);

  @override
  bool operator ==(Object other) {
  if(identical(this, other)) return true;

  return other is MyClass && other.roll==roll && other.name==name;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => name.hashCode;

}