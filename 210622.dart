
import 'util/ReadUtil.dart';

class Skill{
  String name;
  int mp;
  int damage;

  Skill(this.name, {this.mp=2, this.damage=2});

  void useSkills(Character i, Character you) {
    print("${i.name}이(가) ${you.name}을(를) ${name} 스킬로 공격합니다.");

    i.mp -= mp;
    print("${i.name}의 mp가 ${i.mp}만큼 깎여서, ${i.mp}가 되었습니다.");

    you.hp -= damage;
    print("${you.name}의 hp가 ${damage}만큼 깎여서, ${you.hp}가 되었습니다.");
  }
}

enum CharacterKind { Warrior, Wizard, Archer }
class Character{
  //캐릭터는 이름, 직업, mp, hp와 스킬 2개가 있다.
  String name;
  String kind;
  int mp;
  int hp;
  List<Skill> skillList;

  Character(this.name, this.kind, this.hp, this.mp, this.skillList);

  static CharacterKind getCharacterKind(int index) {
    return CharacterKind.values[index];
  }

  static void addCharacter(Map characterMap) {
    int num= ReadUtil.getInt("[1. 전사 2. 궁수 3. 마법사]");
    CharacterKind characterKind = getCharacterKind(num - 1);
    String characterName = getNewCharacterName("캐릭터의 이름을 입력하세요.", characterMap);

    Character? character;
    String characterKindStr = characterKind.toString().split(".")[1];
    if (characterKind == CharacterKind.Warrior) {
      character =  new Warrior(characterName,characterKindStr);
    } else if (characterKind == CharacterKind.Wizard) {
      character =  new Wizard(characterName,characterKindStr);
    } else if (characterKind == CharacterKind.Archer) {
      character =  new Archer(characterName,characterKindStr);
    }

    if (character != null) {
      characterMap[character.name] = character;
      return;
    }

    print("해당 직업의 캐릭터가 업습니다.");
    return;
  }

  void showSkillList() {
    int i = 0;
    for (Skill skill in skillList) {
      print("${i}. ${skill.name}");
      i++;
    }
  }

  void attack(Character target) {
    //사용할 스킬은 입력받고, 사용 시 mp가 닳고, 상대방의 hp가 단다.
    showSkillList();
    int num = ReadUtil.getInt("사용하실 스킬을 선택하세요.");
    Skill skill = this.skillList[num];
    skill.useSkills(this, target);
  }

  static String getNewCharacterName(String info, Map characterMap) {
    String characterName;
    while (true) {
      characterName = ReadUtil.getString(info);

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

//스킬은 각각 이름이 다르고, 소모하는 mp와 데미지가 다르다.
class Warrior extends Character{
  Warrior(String name,String kind)
      : super(name, kind, 20, 10,[new Skill("찌르기"), new Skill("돌진", mp: 4, damage: 5)]);
}

class Wizard extends Character {
  Wizard(String name,String kind)
      : super(name, kind, 10, 20, [new Skill("에너지볼"), new Skill("메테오", mp: 7, damage: 8)]);
}

class Archer extends Character {
  Archer(String name,String kind)
      : super(name, kind, 15, 15, [new Skill("활쏘기"), new Skill("집중사격", mp: 5, damage: 6)]);
}

enum GameMenu{ CREATE, ATTACK, CHECK, EXIT}

class AlreadyNameException implements Exception {}

class Game {
  Map characterMap = {};

  void start() {
    while(true){
      //게임 메뉴 출력하기
      int num = ReadUtil.getInt("[1. 캐릭터 생성하기 2. 캐릭터 공격하기 3. 현재 생성된 캐릭터 확인하기 4. 종료하기");

      //수행할 기능 입력받기
      GameMenu gameMenu=GameMenu.values[num-1];
      if(gameMenu==GameMenu.CREATE){
        createCharacter();
      }
      else if(gameMenu==GameMenu.ATTACK){
        attackCharacter();
      }
      else if(gameMenu==GameMenu.CHECK){
        checkCharacter();
      }
      else if(gameMenu==GameMenu.EXIT){
        if(isFinished()) break;
      }
    }
  }

  void createCharacter() {
    Character.addCharacter(characterMap);
  }

  void attackCharacter() {
    //캐릭터 공격을 위해서는 2명 이상의 캐릭터가 필요하다.
    if(characterMap.length<2){
      print("공격을 위해서는 2명 이상의 캐릭터를 생성하십시오.");
      return;
    }

    //자신의 캐릭터의 이름을 입력받고, 공격할 상대방의 캐릭터의 이름을 입력받는다.
    Character me = characterMap[getCharacterName("자신의 캐릭터 이름을 입력하세요.")];
    Character target = characterMap[getCharacterName("상대방의 캐릭터 이름을 입력하세요.")];
    me.attack(target);
  }

  void checkCharacter() {
    //현재 생성된 캐릭터의 직업군과 이름을 보여준다.
    for (MapEntry entry in characterMap.entries) {
      print("생성된 캐릭터 : ${entry.key}, 직업 : ${entry.value.kind}");
    }
  }

  bool isFinished() {
    //게임을 시작하면 캐릭터의 hp가 0이 되지 않는다면 게임을 종료할 수 없다.
    if (characterMap.isEmpty) {
      print("게임이 종료됩니다.");
      return true;
    }

    for (MapEntry entry in characterMap.entries) {
      Character character = entry.value;
      if (character.hp <= 0) {
        print("게임을 종료합니다.");
        return true;
      }
    }
    return false;
  }



  String getCharacterName(info) {
    String characterName;
    characterName=ReadUtil.getString(info);
    return characterName;
  }
}

void main() {
  Game game = new Game();
  game.start();
}
