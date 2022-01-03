// 클래스 선언
class Animal {
  //필드(속성)
  String type = ""; //동물의 종류
  String sex = ""; //암수
  int age = 0; //나이

  //생성자
  Animal(String type, String sex, int age) {
    this.type = type;
    this.sex = sex;
    this.age = age;
  }

  Animal.initList(String type, String sex, int age): this.type=type,this.sex=sex,this.age=age{
  }

  Animal.initType(String type){
    this.type = type;
  }

  //메소드(행동)
  void eat() {
    print("동물이 먹는다");
  }

  void sleep() {
    print("동물이 잔다");
  }

}

void main(){

  // 인스턴스 생성
  //생성자를 보통 쓰는경우, 필수적으로 인스턴스의 속성을 지정해야할 때,
  Animal animal1 = new Animal("dog","m",1);

  Animal animal2 = new Animal.initType("dog");
  Animal animal3 = new Animal.initList("dog","m",2);

  animal1.eat(); //animal1 인스턴스가 먹는다.
}
