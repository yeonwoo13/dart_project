import 'dart:io';

enum TextMenu { COUNT, IS_EMPTY, CONTAINS, SPLIT, EXIT }

class TextUtil {
  String? text;

  //변수는 명사 형태
  //함수는 동사 형태.

  //생성자는 아래 처럼 둔다.
  TextUtil() {}

  //이름이 부여된 생성자를 통해서 text를 입력받도록 한다. 생성자 이름을 initText
  //이 init text를 만들때 초기화 리스트를 사용해보아라.

  TextUtil.initText(String text) : this.text = text {}

  int getLength() {
    //변수에 인스턴스가 들어잇으면,
    //해당 변수에 .을 치면 해당 변수의 필드와 메소드에 접근할  수 있다.
    //해당 변수에 NULL이 들어있으면, 해당 필드와 메소드에 접근할 수 없다.
    //근데,내가 명시적으로 해당 변수가 잇을거야라고 말하고 싶을 때 !.를 사용한다.
    //의미는 해당 변수가 NULL일리 없을꺼야 내가 보장할게.
    return this.text!.length;
  }

  bool isEmpty() {
    return this.text!.isEmpty;
  }

  bool contains(String textToContain) {
    return this.text!.contains(textToContain);
  }

  bool startsWith(String textToStartWith) {
    return this.text!.startsWith(textToStartWith);
  }

  bool endsWith(String textToEndwith) {
    return this.text!.endsWith(textToEndwith);
  }

  List makeSplitedList(String separator) {
    return this.text!.split(separator);
  }

  //포함관게를 체크한다.
  List<bool> checkInclusion(String text) {
    return [contains(text), startsWith(text), endsWith(text)];
  }
}

void main() {
  print("텍스트를 입력하세요.");
  String text = stdin.readLineSync() ?? "";

  while (true) {
    print("==================================");
    print("1. 글자 수 세기");
    print("2. 빈 문자열인지 확인하기");
    print("3. 문자열 포함 여부 확인하기");
    print("4. 문자열의 구분자로 리스트로 만들기");
    print("5. 프로그램 종료");
    print("번호를 선택하세요.");

    String numStr = stdin.readLineSync() ?? "";
    int num = int.tryParse(numStr) ?? 0;
    TextMenu textMenu = TextMenu.values[num - 1];

    TextUtil textUtil = new TextUtil.initText(text);

    if (textMenu == TextMenu.COUNT) {
      print("입력하신 텍스트의 글자수는 ${textUtil.getLength()}글자 입니다");
    } else if (textMenu == TextMenu.IS_EMPTY) {
      print(textUtil.isEmpty() ? "빈 문자열 입니다." : "빈 문자열이 아닙니다.");
    } else if (textMenu == TextMenu.CONTAINS) {
      print("문자열을 입력하세요.");
      String textContains = stdin.readLineSync() ?? "";

      List<bool> checkInclusion = textUtil.checkInclusion(textContains);

      print(checkInclusion[0]
          ? "입력하신 문자열은 텍스트에 포함합니다."
          : "입력하신 문자열은 텍스트에 포함하지 않습니다.");

      if (checkInclusion[1])
        print("입력하신 문자열은 텍스트 첫 단어에 포함합니다.");
      else
        print("입력하신 문자열은 텍스트 첫 단어에 포함하지 않습니다.");

      if (checkInclusion[2])
        print("입력하신 문자열은 텍스트 마지막 단어에 포함합니다.");
      else
        print("입력하신 문자열은 텍스트 마지막 단어에 포함하지 않습니다.");

    } else if (textMenu == TextMenu.SPLIT) {
      List strList = textUtil.makeSplitedList(" ");
      print("해당 문자열은 $strList의 문자로 구성되어있습니다.");
    } else if (textMenu == TextMenu.EXIT) {
      print("프로그램을 종료합니다.");
      break;
    }
  }
}
