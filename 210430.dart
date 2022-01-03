import 'dart:io';

enum TextMenu{
  COUNT,IS_EMPTY,CONTAINS,SPLIT,EXIT
}

void main() {
  print("텍스트를 입력하세요.");
  String text=stdin.readLineSync()??"";

  while(true) {
    print("==================================");
    print("1. 글자 수 세기");
    print("2. 빈 문자열인지 확인하기");
    print("3. 문자열 포함 여부 확인하기");
    print("4. 문자열의 구분자로 리스트로 만들기");
    print("5. 프로그램 종료");
    print("번호를 선택하세요.");

    String numStr=stdin.readLineSync()??"";
    int num=int.tryParse(numStr)??0;
    TextMenu textMenu=TextMenu.values[num-1];

    if(textMenu==TextMenu.COUNT){
      print("입력하신 텍스트의 글자수는 ${text.length}글자 입니다");
    }
    else if(textMenu==TextMenu.IS_EMPTY){
      print(text.isEmpty
          ?"빈 문자열 입니다."
          :"빈 문자열이 아닙니다.");
    }
    else if(textMenu==TextMenu.CONTAINS){
      print("문자열을 입력하세요.");
      String textContains=stdin.readLineSync()??"";

      bool isContains=text.contains("$textContains");
      if(isContains==true) print("입력하신 문자열은 텍스트에 포함합니다.");
      else print("입력하신 문자열은 텍스트에 포함하지 않습니다.");

      bool isStartsWith=text.startsWith("$textContains");
      if(isStartsWith==true) print("입력하신 문자열은 텍스트 첫 단어에 포함합니다.");
      else print("입력하신 문자열은 텍스트 첫 단어에 포함하지 않습니다.");

      bool isEndsWith=text.endsWith("$textContains");
      if(isEndsWith==true) print("입력하신 문자열은 텍스트 마지막 단어에 포함합니다.");
      else print("입력하신 문자열은 텍스트 마지막 단어에 포함하지 않습니다.");

    }
    else if(textMenu==TextMenu.SPLIT){
      List strList = text.split(" ");
      print("$strList");
    }
    else if(textMenu==TextMenu.EXIT){
      print("프로그램을 종료합니다.");
      break;
    }
  }
}

