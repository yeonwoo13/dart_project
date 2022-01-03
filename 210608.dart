import 'util/ReadUtil.dart';
import 'dart:io';

class Character {
  String name;
  int hp;
  int mp;
  int mpUsedWhenAttacking1; // 1번째 스킬로 공격할 때 쓰는 mp
  int damageDealtWhenAttacking1; // 1번째 스킬로 공격할 때 입히는 피해량
  int mpUsedWhenAttacking2; // 2번째 스킬로 공격할 때 쓰는 mp
  int damageDealtWhenAttacking2; // 2번째 스킬로 공격할 때 입히는 피해량

  Character(
      this.name,
      this.hp,
      this.mp,
      this.mpUsedWhenAttacking1,
      this.damageDealtWhenAttacking1,
      this.mpUsedWhenAttacking2,
      this.damageDealtWhenAttacking2);

  void skill1(Character anotherCharacter) {
    print("${this.name}이(가) ${anotherCharacter.name}을(를) 공격합니다.");

    mp -= mpUsedWhenAttacking1;
    print(
        "${this.name}의 mp가 ${this.mpUsedWhenAttacking1}만큼 깎여서, ${this.mp}가 되었습니다.");

    anotherCharacter.hp -= damageDealtWhenAttacking1;
    print(
        "${anotherCharacter.name}의 hp가 ${anotherCharacter.damageDealtWhenAttacking1}만큼 깎여서, ${anotherCharacter.hp}가 되었습니다.");
  }

  void skill2(Character anotherCharacter) {
    print("${this.name}이(가) ${anotherCharacter.name}을(를) 공격합니다.");

    mp -= mpUsedWhenAttacking2;
    print(
        "${this.name}의 mp가 ${this.mpUsedWhenAttacking2}만큼 깎여서, ${this.mp}가 되었습니다.");

    anotherCharacter.hp -= damageDealtWhenAttacking2;
    print(
        "${anotherCharacter.name}의 hp가 ${anotherCharacter.damageDealtWhenAttacking2}만큼 깎여서, ${anotherCharacter.hp}가 되었습니다.");
  }

  void attack(Character target) {
    //스킬  입력 받는다.
    line();
    printSkillList();
    String numStr = ReadUtil.getString("사용할 스킬을 선택하세요.");

    //스킬에 따라 기능을 수행한다.
    line();
    if (numStr == "1") skill1(target);
    else if (numStr == "2") skill2(target);
  }

  void printSkillList(){
    throw new UnimplementedError(); //캐릭터를 생성한경우 에러가 발생함.
  }
}

class Camille extends Character {
  Camille(String name, int hp, int mp) : super(name, hp, mp, 12, 24, 17, 32);

  @override
  void printSkillList() {
    print("[1. 갈고리 발사 2. 돌진]");
  }
}

class Silas extends Character {
  Silas(String name, int hp, int mp) : super(name, hp, mp, 10, 17, 14, 26);

  @override
  void printSkillList() {
    print("[1. 사이러스스킬1 2. 사이러스스킬2]");
  }
}

class Aatrox extends Character {
  Aatrox(String name, int hp, int mp) : super(name, hp, mp, 7, 13, 11, 20);

  @override
  void printSkillList() {
    print("[1. 아트록스스킬1 2. 아트록스스킬2]");
  }
}

class Game {
  List<Character> characterList = [];

  void start() {
    Camille camille = new Camille("camille", 200, 300);
    Silas silas = new Silas("silas", 250, 250);
    Aatrox aatrox = new Aatrox("aatrox", 300, 200);

    characterList.add(camille);
    characterList.add(silas);
    characterList.add(aatrox);

    while (true) {
      Character me = selectCharacter();
      Character target = selectCharacter(me);
      me.attack(target);

      //종료인지 확인하고 종료한다.
      if (isFinished()) break;
    }
  }

  Character selectCharacter([Character? me = null]) {
    //캐릭터 선택 후보를 띄운다.
    line();
    for (int i = 0; i < characterList.length; i++) {
      Character character = characterList[i];

      //A && B, A가 false라면, B는 절대 안한다.
      if (me != null && character == me) continue;

      stdout.write("${i}. ${character.name} ");
    }
    print("");

    //캐릭터를 입력받는다.
    String info = me != null ? "공격할 대상을 선택하세요." :  "캐릭터를 선택하세요.";
    String numStr = ReadUtil.getString(info);
    int index = int.tryParse(numStr) ?? -1;
    Character character = characterList[index];

    //캐릭터를 선택했다는 메시지를 띄운다.
    print("${character.name}를 선택하셨습니다.");

    return character;
  }
  bool isFinished() {
    for (Character character in characterList) {
      if (character.hp <= 0) {
        return true;
      }
    }
    return false;
  }
}

void line() {
  print("=============================");
}

void main() {
  Game game = new Game();
  game.start();
  print("게임이 끝났습니다.");
}
//게임 종료하기.

/*- 210609에  짜준 WarGame 코드 출력해서 보고, 코드 흐름을 어느정도 본것같다 싶으면, 아래 형태로 WarGame 만들기
- 게임 메뉴를 출력하여서 사용자가 게임을 컨트롤 하도록 한다.
- 이 때, 각 캐릭터를 생성할 때, 이름을 입력하지 않는 캐릭터에 경우에 EmptyNameException을  만들어서 발생시키기,

그리고, 해당  에러에 의해 Game Class가 종료되지 않도록, 에러를 잘 처리해보기.

```jsx
1. 캐릭터 생성 (상속을 이용해서 캐릭터 종류 3개 이상 만들어보기)
2. 캐릭터 공격하기 (누가 누구를?)
- 각 캐릭터마다  기술 2개를 부여하기.
- 기술은 이름이 있고, 기술별 사용되는 mp가  다르고, 깎는 hp가 다르다.
- 공격시에, 해당 기술을  활용하도록 하기.
3. 게임 종료하기
```*/
