class Animal{
  String name;

  Animal(this.name);

  void sleep(){
    print("$name 라는 동물이 잔다.");
  }
  void cry(){
    print("$name 라는 동물이 운다.");
  }
  void eat(){
    print("$name 라는 동물이 먹는다.");
  }
}
class Bird extends Animal{
  //알고 있어야 하는 중요한 사실
    //만약에 Bird에  생성자를 내가  정의하지 않았음다면,
      //new Bird(); 는 생성자가  없어도 인스턴스가 생김.
      //이유는, 에디터가 자동으로 기본 생성자를 만들어줌.
    //만약에  Bird에  내가 어떤 생성자를 정의한다면,
      //에디터는 자동으로 생성자를 만들어주지 않는다.

  //알고 있어야 하는 사실 2
    //이제  상속관계를 보면,
    //현재, Animal운 속성을 셋팅하는 생성자가 만들어져있음.
    //Bird는 생성자가 없어요. -> 글면 bird는 에디터가 생성자를 만들어주겠죠.
    //그래서 new Bird()를 하면, 그 기본 생성자가 불려요. 근데, Bird 인스턴스를 만들기 전에,  Animal을 만들어야 함.
    //내가  bird 하나를 생성하ㅕ면, new Animal()->new Bird() 순서로 불려야 한다.

  //this는 나 자신임.
  //super는 부모.
  //리다이렉팅 생성자는 super.이 불가능함.
  Bird(String name): super(name);

  void cry(){
    print("${name} 라는 새가 운다.");
  }
}

void main(){
  Animal animal1 = new Animal("bird");
  animal1.sleep();
  animal1.cry();
  animal1.eat();

  Animal animal2 = new Animal("bird2");
  animal2.sleep();
  animal2.cry();
  animal2.eat();

  Bird bird = new Bird("bird3");
  bird.sleep();
  bird.eat();
  bird.cry();
}