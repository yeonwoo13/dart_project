import 'dart:io';

void main() {
  print("텍스트를 입력하세요.");
  String text=stdin.readLineSync()??"";

  while(true) {
    print("=================================");
    print("1. 글자 수 세기");
    print("2. 빈 문자열인지 확인하기");
    print("3. 문자열 포함 여부 확인하기");
    print("4. 문자열의 구분자로 리스트로 만들기");
    print("5. 프로그램 종료");
    print("번호를 선택하세요.");

    String numStr=stdin.readLineSync()??"";
    int num=int.tryParse(numStr)??0;

    if(num==1){
      print("입력하신 문자열의 글자수는 ${text.length}글자 입니다");
    }
    else if(num==2){

      bool isEmpty = text.isEmpty;

      if (isEmpty == true) {
        print("빈 문자열 입니다.");
      }
      else {
        print("빈 문자열이 아닙니다.");
      }
    }
    else if(num==3){

    }
    else if(num==4){

    }
    else if(num==5){
      print("프로그램을 종료합니다.");
      break;
    }
  }
}