class AnimalInterface{ //기능이 없음.
  void eat() {
  }
  void cry(){
  }
  void sleep(){
  }
}

class Bird implements AnimalInterface{
  //해당 Interface에 있는 메소드들을 반드시 정의해야한다.
  //목적 : 해당 메소드를 반드시 만드는 것을 강제하기위해서, 저 Inteface를 만든거에요.
  //4명에 개발자가. 코드를 짜요.
  //4명이 다 다르게 코드를 짤 수 있잖아요.
  //그러니깐, 처음에 Interface를 다 같이 만들어요.
  //그 다음에, 각각 Interface대로 코드를 짜요.

  @override //에노테이션, 어노테이션
  void eat(){
    print("새가 먹습니다.");
  }
  void cry(){
    print("새가 웁니다.");
  }
  void sleep(){
    print("새가 잡니다.");
  }
}


class Lion implements AnimalInterface{
  //해당 Interface에 있는 메소드들을 반드시 정의해야한다.
  //목적 : 해당 메소드를 반드시 만드는 것을 강제하기위해서, 저 Inteface를 만든거에요.
  //4명에 개발자가. 코드를 짜요.
  //4명이 다 다르게 코드를 짤 수 있잖아요.
  //그러니깐, 처음에 Interface를 다 같이 만들어요.
  //그 다음에, 각각 Interface대로 코드를 짜요.

  @override //에노테이션, 어노테이션
  void eat(){
    print("사자가 먹습니다.");
  }
  void cry(){
    print("사자가 웁니다.");
  }
  void sleep(){
    print("사자가 잡니다.");
  }
}

void main(){
  List<AnimalInterface> list = [];

  list.add(new Bird());
  list.add(new Lion());

  //모든 개발자가 다 모이지 않아도, 실행로직을 만들 수 있음
  //왜? AnimalInterface대로 메소들르 짰을테니깐.
  for (var value in list) {
    value.cry();
    value.eat();
    value.sleep();
  }

  Bird bird= new Bird();
  bird.cry();
  bird.eat();
  bird.sleep();

  Bird bird2 = new Bird()
  ..cry()
  ..eat()
  ..sleep();

  //문자열을 숫자로 바꿀 수 없는, 비정상적인 상황이 바랭했을 때, 예외를 발생시키기 때문이다.
  int a = int.parse(""); //FormatException //언제 발생? 입력값이 잘못되엇을 때,
  // int? b = int.tryParse("");

}

