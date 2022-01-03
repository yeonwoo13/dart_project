class Animal {
  int age = 1;
}

void main(){
  Animal? animal = null;
  //null. -> null에 접근이 불가능해. 그래서 에러가 나요. (Error)
  //보통 이렇게 null에 접근해서 에러가나는 경우를 NullPointerException.
  //이 에러가 개발자가 내는 에러에 거의 80%이다.
  //이거는 기본으로 예측해야된다 그러니깐....
  //-> 80%가 에러가 난다고 했잖아요. 그래서 다트가 기본적으로 null을 못넣게함.
  //원래 다른언어들은 null을 넣을 수 있다.


  //있으면 age를 주고,없으면 null을 줄게..
  //단점이 좀 있음 -> null이 전파가돼 (귀찮음), 게속 null을 신경써야함.
  int? a = animal?.age; //animal != null ? animal.age: null;

  //null의 전파를 끊는 법. // 삼항연산자나 ?? 연산자를 써서 null전파를 끊어주는게 좋음.
  int age = animal != null ? animal.age: 1;
}