//Unit(유닛),부모
//공격기능, hp, mp.
class Unit {
  int hp;
  int mp;

  //기본 생성자
  // Unit(int hp, int mp) {
  //   //다른언어는 이게 되는데.. (JAVA,...)
  //   //이건 옛날방식
  //   //그래서
  //   // dart에서는 기본 생성자에서 필드를 초기화하면......
  //   //에러가 난다.
  //   this.hp = hp;
  //   this.mp = mp;
  // }

  //초기화 리스트를 사용하였음.
  /*
  : this.hp = hp,
        this.mp = mp
   */
  // Unit(int hp, int mp)
  //     : this.hp = hp,
  //       this.mp = mp;

  //리다이렉팅 생성자
  Unit(this.hp, this.mp) {
    print("Unit");
  }

  void attack() {
    print("공격하기");
  }
}

class Any implements Unit {
  //의문점 : 생성자는 재정의할 필요가 없네?
  //생성자는 해당 클래스만 갖고 있다.
  //그래서, 재정의 못한다....

  int hp;
  int mp;

  //extends은.. 내 유전자를 넘긴다. (super가 있음, 부모가 있음)
  //implentes는.. 어떤 유전자를 참고해서 새로 만든다. (super가 없음, 부모가 없음)
  Any(this.hp, this.mp) {
    print("Any");
  }

  void attack() {
    print("때리기");
  }
}

void main() {


  Any any = Any(10, 15);
}
