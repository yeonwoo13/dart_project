import 'dart:io';

import 'util/ReadUtil.dart';


class AlreadyNameException implements Exception {}

enum CharacterKind {
  Warrier, Magicion, Archer
}
class Character {
  String name;
  String kind;
  int hp;
  int mp;
  int mpUsedWhenAttacking1; // 1번째 스킬로 공격할 때 쓰는 mp
  int damageDealtWhenAttacking1; // 1번째 스킬로 공격할 때 입히는 피해량
  int mpUsedWhenAttacking2; // 2번째 스킬로 공격할 때 쓰는 mp
  int damageDealtWhenAttacking2;

  Character(
      this.name,
      this.kind,
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
    printSkillList();
    String numStr = ReadUtil.getString("사용할 스킬을 선택하세요.");

    if (numStr == "1")
      skill1(target);
    else if (numStr == "2") skill2(target);
  }

  void printSkillList() {
    throw new UnimplementedError();
  }

  static Character? makeCharacter(String characterName, CharacterKind characterKind) {
    String characterKindStr = characterKind.toString().split(".")[1];
    if (characterKind == CharacterKind.Warrier) {
      return new Warrior(characterName, characterKindStr);
    } else if (characterKind == CharacterKind.Magicion) {
      return new Magicion(characterName, characterKindStr);
    } else if (characterKind == CharacterKind.Archer) {
      return new Archer(characterName, characterKindStr);
    }
    return null;
  }

  static CharacterKind getCharacterKindByIndex(int index){
    return CharacterKind.values[index];
  }
}

class Warrior extends Character {
  Warrior(String name, String kind) : super(name, kind, 20, 10, 2, 1, 5, 2);

  @override
  void printSkillList() {
    print("[1. 찌르기 2. 돌진]");
  }
}

class Magicion extends Character {
  Magicion(String name, String kind) : super(name, kind, 10, 20, 4, 3, 9, 7);

  @override
  void printSkillList() {
    print("[1. 에너지볼 2. 메테오]");
  }
}

class Archer extends Character {
  Archer(String name, String kind) : super(name, kind, 15, 15, 3, 2, 6, 3);

  @override
  void printSkillList() {
    print("[1. 활쏘기 2. 집중사격]");
  }
}

class GameMenu {
  Map characterMap = {};

  void start() {
    while (true) {
      //메뉴를 출력한다.
      print("[1. 캐릭터 생성 2. 캐릭터 공격하기 3. 현재 생성된 캐릭터 보기 4. 게임 종료하기]");

      //메뉴를 입력받는다.
      String? numStr = stdin.readLineSync(); //null이 나오면 어떻게하지?

      //메뉴에 따라 기능을 수행한다.
      if (numStr == "1") {
        generateCharacter();
      } else if (numStr == "2") {
        attackCharacter();
      } else if (numStr == "3") {
        viewCharacter();
      } else if (numStr == "4") {
        if (isFinished()) break;
      }
      //else일 때는 어떻게 하지?
    }
  }

  void generateCharacter() {
    //캐릭터의 종류를 선택한다.
    int inputNum =  ReadUtil.getInt("[1. 전사 2. 마법사 3. 궁수]");

    //캐릭터의 정보를 입력받는다.
    CharacterKind characterKind = Character.getCharacterKindByIndex(inputNum-1);
    String characterName = getCharacterName("캐릭터의 이름을 입력하세요.");

    //종류와 이름을 이용해서 캐릭터를 생성해서 맵에 넣는다.
    characterMap[characterName] = Character.makeCharacter(characterName, characterKind);

  }

  void attackCharacter() {
    viewCharacter();

    Character i = characterMap[getCharacterName("자신의 캐릭터의 이름을 입력하세요.")];
    Character you = characterMap[getCharacterName("상대방의 캐릭터의 이름을 입력하세요.")];
    i.attack(you);
  }

  void viewCharacter() {
    //characterMap를 for문을 돌려서, key를 출력한다.
    for (MapEntry entry in characterMap.entries) {
      print("생성된 캐릭터 : ${entry.key}, 직업 : ${entry.value.kind}");
    }
  }

  bool isFinished() {
    for (MapEntry entry in characterMap.entries) {
      Character character = entry.value;
      if (character.hp <= 0) {
        print("게임을 종료하였습니다.");
        return true;
      }
    }
    return false;
  }

  String getCharacterName(String info) {
    String characterName;
    while (true) {
      characterName = ReadUtil.getString(info);

      // 해당 게임에 입력받은 이름이 존재하면, ALreadyNameException을 출력하고,
      // 그 경우에 다시 이름을 입력받도록 한다.
      bool isBreak;
      try {
        if (characterMap.containsKey(characterName)) {
          throw new AlreadyNameException();
        }
        isBreak = true;
      } on AlreadyNameException {
        print("이미 해당 캐릭터의 이름이 존재합니다.");
        isBreak = false;
      }
      if (isBreak) break;
    }

    return characterName;
  }
}

void main() {
  GameMenu game = new GameMenu();
  game.start();
}
