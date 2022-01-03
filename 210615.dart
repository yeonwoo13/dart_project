import 'dart:io';

import 'util/ReadUtil.dart';

class AlreadyNameException implements Exception {}

enum CharacterKind { Warrier, Magicion, Archer }

enum MenuNumber { GENERATION, TOATTACK, READ, EXIT }

class Skill {
  String name;
  int mp;
  int damage;

  Skill(this.name, this.mp, this.damage);

  void used(Character me, Character target) {
    print("${me.name}이(가) ${target.name}을(를) ${name} 스킬로 공격합니다.");

    me.mp -= mp;
    print("${me.name}의 mp가 ${me.mp}만큼 깎여서, ${me.mp}가 되었습니다.");

    target.hp -= damage;
    print("${target.name}의 hp가 ${damage}만큼 깎여서, ${target.hp}가 되었습니다.");
  }
}

class Character {
  String name;
  String kind;
  int hp;
  int mp;

  List<Skill> skillList;

  //SKill이라는 Class가 있었으면, 이건 해결됬을거야.

  static Character? makeCharacter(
      String characterName, CharacterKind characterKind) {
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

  static CharacterKind getCharacterKindByIndex(int index) {
    return CharacterKind.values[index];
  }

  Character(this.name, this.kind, this.hp, this.mp, this.skillList);

  void attack(Character target) {
    printSkillList();
    int num = ReadUtil.getInt("사용할 스킬을 선택하세요."); //0부터  시작.
    Skill skill = this.skillList[num];
    skill.used(this, target);
  }

  void printSkillList() {
    //첫번째 방법
    int i = 0;
    for (Skill skill in skillList) {
      print("${i}. ${skill.name}");
      i++;
    }

   /* //두번째 방법
    for (int i = 0; i < skillList.length; i++) {
      Skill skill = skillList[i];

    }*/
  }
}

class Warrior extends Character {
  Warrior(String name, String kind) : super(name, kind, 20, 10, [new Skill("돌진",5,10), new Skill("찌르기",3,7)]);
}

class Magicion extends Character {
  Magicion(String name, String kind) : super(name, kind, 10, 20, [new Skill("돌진",5,10), new Skill("찌르기",3,7)]);
}

class Archer extends Character {
  Archer(String name, String kind) : super(name, kind, 15, 15,[new Skill("돌진",5,10), new Skill("찌르기",3,7)]);
}

class GameMenu {
  Map characterMap = {};

  void start() {
    while (true) {
      //메뉴를 출력한다.
      print("[1. 캐릭터 생성 2. 캐릭터 공격하기 3. 현재 생성된 캐릭터 보기 4. 게임 종료하기]");

      //메뉴를 입력받는다.
      String numStr = stdin.readLineSync() ?? "";
      int num = int.tryParse(numStr) ?? -1;
      MenuNumber menuNumber = MenuNumber.values[num - 1];
      //메뉴에 따라 기능을 수행한다.
      if (menuNumber == MenuNumber.GENERATION) {
        generateCharacter();
      } else if (menuNumber == MenuNumber.TOATTACK) {
        attackCharacter();
      } else if (menuNumber == MenuNumber.READ) {
        viewCharacter();
      } else if (menuNumber == MenuNumber.EXIT) {
        if (isFinished()) break;
      }
    }
  }

  void generateCharacter() {
    //캐릭터의 종류를 선택한다.
    int inputNum = ReadUtil.getInt("[1. 전사 2. 마법사 3. 궁수]");

    //캐릭터의 정보를 입력받는다.
    CharacterKind characterKind =
        Character.getCharacterKindByIndex(inputNum - 1);
    String characterName = getCharacterName("캐릭터의 이름을 입력하세요.");

    //종류와 이름을 이용해서 캐릭터를 생성해서 맵에 넣는다.
    Character? character =
        Character.makeCharacter(characterName, characterKind);
    if (character != null) {
      characterMap[characterName] = character;
      return;
    }

    print("해당 직업의 캐릭터가 업습니다.");
  }

  void attackCharacter() {
    viewCharacter();

    Character me = characterMap[getCharacterName("자신이 선택한 캐릭터의 이름을 입력하세요.")];
    Character target = characterMap[getCharacterName("상대방의 캐릭터의 이름을 입력하세요.")];
    me.attack(target);
  }

  void viewCharacter() {
    for (MapEntry entry in characterMap.entries) {
      print("생성된 캐릭터 : ${entry.key}, 직업 : ${entry.value.kind}");
    }
  }

  bool isFinished() {
    for (MapEntry entry in characterMap.entries) {
      Character character = entry.value;
      if (character.hp <= 0) {
        print("게임을 종료하였습니다.");
        return true; //TODO: 1개의 캐릭터가 피가 0이하이면, for문을  그만 돌도록 하는 효과가 있다.
      }
    }
    return false;
  }

  String getCharacterName(String info) {
    String characterName;
    while (true) {
      characterName = ReadUtil.getString(info);

      //이름을 입력받을 때 이미 입력받은 이름이라면 AlreadyNameException을 발생시킨다.
      //다시 이름을 입력받도록 한다.
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
