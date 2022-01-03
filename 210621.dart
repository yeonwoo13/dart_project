/*//게임 만들기
  //게임 메뉴 만들기
    //게임 메뉴 출력하기
      //1. 캐릭터 생성하기
        //캐릭터는 이름, 직업, mp, hp와 스킬 2개가 있다.
        //스킬은 각각 이름이 다르고, 소모하는 mp와 데미지가 다르다.
        //사용자는 캐릭터의 직업을 정하고, 이름을 입력받는다.
        //게임을 시작하기 위해서는 2명 이상의 캐릭터를 생성해야한다.
      //2. 캐릭터 공격하기
        //캐릭터 공격을 위해서는 2명 이상의 캐릭터가 필요하다.
        //자신의 캐릭터의 이름을 입력받고, 공격할 상대방의 캐릭터의 이름을 입력받는다.
        //사용할 스킬은 입력받고, 사용 시 mp가 닳고, 상대방의 hp가 단다.
      //3. 현재 생성된 캐릭터 확인하기
        //현재 생성된 캐릭터의 직업군과 이름을 보여준다.
      //4. 종료하기
        //게임을 시작하면 캐릭터의 hp가 0이 되지 않는다면 게임을 종료할 수 없다.
    //수행할 기능 입력받기
    //메뉴에 따른 입력받은 기능 수행하기
    //게임이 종료되지 않는다면 반복하기
    //종료하기*/

import 'util/ReadUtil.dart';

enum MenuNum{ CREATE, ATTACK, CHECK, EXIT }

enum CharacterKind { Warrior, Wizard, Archer }

class AlreadyNameException implements Exception {}

class Game{
  Map characterMap = {};

  void start(){
    while(true){
      int num=ReadUtil.getInt
        ("[1. 캐릭터 생성하기 2. 캐릭터 공격하기 3. 현재 생성된 캐릭터 확인하기 4. 종료하기]");

      if(!(1<=num&&num<=4)) continue;

      MenuNum menuNum=MenuNum.values[num-1];
      if(menuNum==MenuNum.CREATE){
        createCharacter();
      }
      else if(menuNum==MenuNum.ATTACK){
        attackCharacter();
      }
      else if(menuNum==MenuNum.CHECK){
        checkCharacter();
      }
      else if(menuNum==MenuNum.EXIT){
        finished(); break;
      }
    }
  }

  void createCharacter() {
    int num = ReadUtil.getInt("[1. 전사 2.아처 3. 마법사]");
    CharacterKind characterKind = Character.getCharacterKind(num - 1);

    String characterName = getNewCharacterName("캐릭터의 이름을 입력하세요.");

    Character? character =
    Character.makeCharacter(characterName, characterKind);
    if (character != null) {
      characterMap[characterName] = character;
      return;
    }
    print("해당 직업의 캐릭터가 업습니다.");
  }

  void attackCharacter() {
    if(characterMap.length<2){
      print("2명 이상의 캐릭터를 생성하세요.");
      return;
    }

    Character i = characterMap[getCharacterName("자신의 캐릭터 이름을 입력하세요.")];
    Character you = characterMap[getCharacterName("상대방의 캐릭터 이름을 입력하세요.")];
    i.attack(you);
  }

  void checkCharacter() {
    for (MapEntry entry in characterMap.entries) {
      print("생성된 캐릭터 : ${entry.key}, 직업 : ${entry.value.kind}");
    }
  }

  bool finished() {
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

  String getNewCharacterName(info) {
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

  String getCharacterName(info) {
    String characterName;
    characterName=ReadUtil.getString(info);
    return characterName;
  }
}

class Skill {
  String name;
  int mp;
  int damage;

  Skill(String name, {int mp = 2, int damage = 2})
      : this.name = name,
        this.mp = mp,
        this.damage = damage;

  void useSkills(Character i, Character you) {
    print("${i.name}이(가) ${you.name}을(를) ${name} 스킬로 공격합니다.");

    i.mp -= mp;
    print("${i.name}의 mp가 ${i.mp}만큼 깎여서, ${i.mp}가 되었습니다.");

    you.hp -= damage;
    print("${you.name}의 hp가 ${damage}만큼 깎여서, ${you.hp}가 되었습니다.");
  }
}

class Character {
  String name;
  String kind;
  int hp;
  int mp;
  List<Skill> skillList;

  Character(this.name, this.kind, this.hp, this.mp, this.skillList);

  void attack(Character target) {
    showSkillList();
    int num = ReadUtil.getInt("사용하실 스킬을 선택하세요.");
    Skill skill = this.skillList[num];
    skill.useSkills(this, target);
  }

  void showSkillList() {
    int i = 0;
    for (Skill skill in skillList) {
      print("${i}. ${skill.name}");
      i++;
    }
  }

  static CharacterKind getCharacterKind(int index) {
    return CharacterKind.values[index];
  }

  static Character? makeCharacter(String characterName,
      CharacterKind characterKind) {
    String characterKindStr = characterKind.toString().split(".")[1];
    if (characterKind == CharacterKind.Warrior) {
      return new Warrior(characterName, characterKindStr);
    } else if (characterKind == CharacterKind.Wizard) {
      return new Wizard(characterName, characterKindStr);
    } else if (characterKind == CharacterKind.Archer) {
      return new Archer(characterName, characterKindStr);
    }
    return null;
  }
}

class Warrior extends Character {
  Warrior(String name, String kind)
      : super(name, kind, 20, 10,
      [new Skill("찌르기"), new Skill("돌진", mp: 4, damage: 5)]);
}

class Wizard extends Character {
  Wizard(String name, String kind)
      : super(name, kind, 10, 20,
      [new Skill("에너지볼"), new Skill("메테오", mp: 7, damage: 8)]);
}

class Archer extends Character {
  Archer(String name, String kind)
      : super(name, kind, 15, 15,
      [new Skill("활쏘기"), new Skill("집중사격", mp: 5, damage: 6)]);
}

void main(){
  Game game=new Game();
  game.start();
}

