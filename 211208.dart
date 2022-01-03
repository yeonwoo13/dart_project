class GrandParent {
  String? a; //a유전자.
  GrandParent() {
    print("GrandParent");
  }

  void cry() {
    print("cry");
  }
}

class Parent extends GrandParent {
  String? b; //b유전자.
  Parent() {
    print("Parent");
  }
}

class Child extends Parent {
  String? c; //c유전자.
  Child() {
    print("Child");
    this.c = "c";
    this.b = "b";
    this.a = "a";

    this.cry();
    super.cry();

    print("${this.b} == ${super.b}");

    super.b = "b1";
    print("${this.b} == ${super.b}");
    super.a = "a1";
  }
}

void main() {
  Child a = Child();
  // Parent a = Parent();

  // List<Child> childList = [];
  // childList.add(Child());
  // childList.add(Parent()); //error
  // childList.add(GrandParent()); //error
  //
  // List<Parent> parentList = [];
  // parentList.add(Child());
  // parentList.add(Parent());
  //
  // List<GrandParent> grandParentList = [];
  // grandParentList.add(Child());
  // grandParentList.add(Parent());
  // grandParentList.add(GrandParent());
  //
  // List<Unit> unitList = [];
  // unitList.add(Any()); //Any만 hiddenAtack1을 갖고 있다.
  // unitList.add(Queen()); //Queen만 hiddenAtack2을 갖고 있다.
  // for (Unit unit in unitList) {
  //   unit.attack(); //의문점 : 자식이 attack이 있어? 있지. 당연히 상속받았으니깐..
  //   // unit.hiddenAtack1(); //이건 못해..........
  //   // unit.hiddenAtack2(); //이건 못해..........
  // }


  // //Any는 hiddenAtack1가 있다.
  // //Unit은 hiddenAtack1가 없다.
  // Any c = Unit(); //이게 왜 안될까?
  // c.hiddenAtack1(); //68번재줄이되면... hiddenAtack1가 없는데 어떻게 씀?
  //
  // //Unit은 attack이 있다.
  // //Any는 attack이 있다.
  // Unit u = Any(); //이게 왜 될까?
  // u.attack();

  //parse가 ㅁ를 어떻게 숫자로 바꿔?
  //숫자로 못바꾸는 경우 어떻게 되는가?
  //Exception이 남
  //TODO: FormatException
  //TODO: 누가 만들고 발생시키는데 FormatException? dart 개발자가.....
  String e = "ㅁ";
  int b = int.parse(e); //String -> int
}

class Unit {
  void attack() {
    print("attack");
  }
}

class Any extends Unit {
  void hiddenAtack1() {
    print("hiddenAtack1");
  }
}

class Queen extends Unit {
  void hiddenAtack2() {
    print("hiddenAtack2");
  }
}
