class GrandParent{
  int a=1;

  GrandParent(){
    print("GrandParent");
  }
}

class Parent extends GrandParent{
  int b=1;

  Parent(){
    print("Parent");
  }
}

class Child extends Parent {
  int c=1;

  // new Child()할 때 문제가 없다.
  // -> 기본 생성자가 생성되니깐.(에디터가)
  //new Parent() -> new Child();
  //Parent 도 기본생성자가 생길 수 있다.
  Child(){
    print("Child");
  }
}

void main(){
  new Child();
}

