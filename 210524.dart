import 'dart:io';

enum BookMenu{
  ADD,REVISE,REMOVE,INFORMATION,EXIT
}

void main() {
  List<String> bookList=[];

  while(true) {
    print("==================================");
    print("1. 도서 추가");
    print("2. 도서 수정");
    print("3. 도서 삭제");
    print("4. 도서 정보 보기");
    print("5. 프로그램 종료");
    print("번호를 선택하세요.");

    String numStr = stdin.readLineSync() ?? "";
    int num = int.tryParse(numStr) ?? 0;
    BookMenu bookMenu = BookMenu.values[num - 1];

    if(bookMenu==BookMenu.ADD){
      print("추가할 도서를 입력하세요.");

      String bookAdd = stdin.readLineSync() ?? "";
      bookList.add("$bookAdd");

      print("'$bookAdd'를 도서에 추가하셨습니다.");
    }
    else if(bookMenu==BookMenu.REVISE){
      print("수정할 도서를 입력하세요.");

      String bookReviseBefore= stdin.readLineSync() ?? "";
      bookList.remove("$bookReviseBefore");

      print("수정할 내용을 입력하세요.");

      String bookReviseAfter= stdin.readLineSync() ?? "";
      bookList.add("$bookReviseAfter");

      print("'$bookReviseBefore'->'$bookReviseAfter' 수정하셨습니다.");
    }
    else if(bookMenu==BookMenu.REMOVE){
      print("삭제할 도서를 입력하세요.");

      String bookRemove= stdin.readLineSync() ?? "";
      bookList.remove("$bookRemove");

      print("'$bookRemove'를 도서에서 삭제했습니다.");
    }
    else if(bookMenu==BookMenu.INFORMATION){
      bookList.sort();
      print("현재 도서: $bookList ");
    }
    else if(bookMenu==BookMenu.EXIT){
      print("프로그램을 종료합니다.");
      break;
    }
  }
}