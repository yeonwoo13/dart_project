class Character {
  String name;
  int hp;
  int mp;
  int mpToAttack; // 공격할 때 쓰는 mp
  int hpToAttack; // 공격할 때 입히는 피해량

  Character(this.name, this.hp, this.mp, this.mpToAttack, this.hpToAttack);

  void attackTo(Character anotherCharacter) {
    print("${this.name}이 ${anotherCharacter.name}을 공격합니다.");

    //내 mp를  깎고
    mp -= mpToAttack;
    print("${this.name}의 mp가 ${this.mpToAttack}만큼 깎여서, ${this.mp}가 되었습니다.");

    //상대의 hp를 깎는다.
    anotherCharacter.hp -= hpToAttack;
    print(
        "${anotherCharacter.name}의 mp가 ${anotherCharacter.hpToAttack}만큼 깎여서, ${anotherCharacter.hp}가 되었습니다.");
  }
}

class Gwen extends Character {
  Gwen(String name, int hp, int mp) : super(name, hp, mp, 10, 20);
}

class Nocturne extends Character {
  Nocturne(String name, int hp, int mp) : super(name, hp, mp, 20, 10);
}

class WarGame {
  //대충 짬.
  void start() {
    List<Character> characterList = [];

    Gwen gwen = new Gwen("gwen1", 200, 100);
    characterList.add(gwen);

    Nocturne nocturne = new Nocturne("nocturne1", 100, 200);
    characterList.add(nocturne);

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    nocturne.attackTo(gwen); //녹턴이 그웬을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    nocturne.attackTo(gwen); //녹턴이 그웬을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    nocturne.attackTo(gwen); //녹턴이 그웬을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    nocturne.attackTo(gwen); //녹턴이 그웬을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;

    gwen.attackTo(nocturne); //그웬이 녹턴을 공격한다.
    if (isFinished(characterList)) return;
  }

  bool isFinished(List<Character> characterList) {
    bool isEnd = false;
    for (Character character in characterList) {
      if (character.hp == 0) {
        isEnd = true;
        break;
      }
    }

    return isEnd;
  }
}

void main() {
  WarGame warGame = new WarGame();
  warGame.start();
  print("게임이 끝났습니다.");
}
