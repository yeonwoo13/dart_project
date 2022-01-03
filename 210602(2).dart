
//name,age
class Person{
  final String name;
  final int age;

  const Person(this.name,this.age);
}

void main(){
  Person person1=const Person('a',1);
  Person person2=const Person('a',1);

  bool isSame = identical(person1, person2);
  print("isSame : ${isSame}");

  Person person3=new Person('a',1);
  Person person4=new Person('a',1);

  Person person5=const Person('a',2);

  print('isSame2 : ${identical(person3,person4)}');

  print("isSame3 : ${identical(person2,person3)}");

  print("isSame4 : ${identical(person2,person5)}");
}