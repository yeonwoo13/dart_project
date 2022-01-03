class Animal {
  //클래스 변수
  static int animalCount = 0;

  //인스턴스 변수
  String type = "";
  String sex = "";
  int age = 0;
  
  //클래스 메소드
  static void increseAnimalCount(){
    animalCount++;
  }
  
  //인스턴스 메소드
  void printAge(){
    print("나이는 ${age}입니다.");
  }
}

void main(){
  Animal animal = new Animal();
  animal.type = "dog"; //인스턴스 변수
  animal.printAge(); //인스턴스 메소드

  Animal.animalCount = 3; //클래스 변수
  Animal.increseAnimalCount(); //클래스 메소드
  //왜??? 클래스변수란, 모든 인스턴스가 공유하는 녀석이기 떄문에,
  //인스턴스. 할필요가 없다. 클래스. 해도된다.

  /*
  //클래스 메소드.
  int.tryParse(); //int가 자료형(class)
  
  //인스턴스 메소드.
  double a = 1.5;
  int b = a.toInt(); 
   */
  
  //사실 클래스 변수는 거의 안써요. 근데, 클래스 메소드는 많이 써요.
}