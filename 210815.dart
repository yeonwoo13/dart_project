void main(){
  int a = add(1,2);
  double b = add<double>(1.3,2.3);
  print(b);

  var calculatorDouble = Calculator<double>();
  double e = calculatorDouble.add(3.0, 2.0);

  var calculatorInt = Calculator<int>();
  int e1 = calculatorInt.add(3, 2);

  //제네릭에서 자료형을 안넣어주면, dynamic 처리한다.
  var calculator = Calculator();
  // calculator.

  List list = [1,5,3,4]; //그래서 이 녀석은 요소의 자료형이 dynamic이다.

  List<String> strList = ["aaa","ddd"];
}

//제네릭(일반화) 프로그래밍

//짧은 요약.
//호출할 때 자료형을 결정하려고~~~~

//길은 요약.
//자료형이 정해져있는 프로그램은 활용도가 적음
//그래서 여러 자료형을 받을 수 있게, 일반화해서 프로그래밍 하는 방법
// int add(int a, int b){
//   return a+b;
// }

//함수의 제네릭 프로그래밍
//Type은 맨처음 입력 인자가 들어올 때 결정난다.
Type add<Type>(Type a, Type b){
  return ((a as num) + (b as num)) as Type;
}

//클래스의 제네릭 프로그래밍
//T은 맨처음 입력 인자가 들어올 때 결정난다.
class Calculator<T> {
  T add(T a, T b){
    return ((a as num) + (b as num)) as T;
  }

  T sub(T a, T b){
    return ((a as num) - (b as num)) as T;
  }
}