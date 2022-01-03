import 'dart:io';

enum BookMenu { CREATE, UPDATE, DELETE, READ, EXIT }

class Book {
  String id;
  String name;
  String genre;
  String writer;

  Book(this.id, this.name, this.genre, this.writer);
}

class Menu {
  Map bookMap;

  Menu(this.bookMap);

  bool doWorkByBookMenuAndGetIsExit(BookMenu bookMenu) {
    if (bookMenu == BookMenu.EXIT) {
      return true;
    }

    if (bookMenu == BookMenu.CREATE) {
      create();
    } else if (bookMenu == BookMenu.UPDATE) {
      update();
    } else if (bookMenu == BookMenu.DELETE) {
      delete();
    } else if (bookMenu == BookMenu.READ) {
      read();
    }
    return false;
  }

  void create() {
    String bookId = getData("추가할 도서의 아이디를 입력하세요.");
    String bookName = getData("추가할 도서의 제목을 입력하세요.");
    String bookGenre = getData("추가할 도서의 장르을 입력하세요.");
    String bookAuthor = getData("추가할 도서의 저자을 입력하세요.");

    Book book = new Book(bookId, bookName, bookGenre, bookAuthor);
    bookMap[bookId] = book; //bookId(String)-book(Book) 쌍이 계속 들어가야되는것.

    print("'$bookName'를(을) 도서에 추가하셨습니다.");
  }

  void update() {
    read();

    String bookIdToFind = getData("책의 ID를 입력하세요.");
    Book? foundBook = bookMap.containsKey(bookIdToFind) ? bookMap[bookIdToFind] : null;
    if (foundBook != null) {
      String bookId = getData("수정할 도서의 아이디를 입력하세요.");
      String bookName = getData("수정할 도서의 제목을 입력하세요.");
      String bookGenre = getData("수정할 도서의 장르을 입력하세요.");
      String bookAuthor = getData("수정할 도서의 저자을 입력하세요.");

      bookMap.remove(bookIdToFind);
      foundBook.id = bookId;
      foundBook.name = bookName;
      foundBook.genre = bookGenre;
      foundBook.writer = bookAuthor;
      bookMap[bookId] = foundBook;

    } else {
      print("해당 책이 없습니다.");
      return;
    }
  }

  void delete() {
    read();

    String bookId = getData("책의 ID를 입력하세요.");
    Book? foundBook = bookMap.containsKey(bookId) ? bookMap[bookId] : null;
    if (foundBook != null) {
      bookMap.remove(foundBook.id); //여기 반드시 키넣어줘야함.
    } else {
      print("해당 책이 없습니다.");
      return;
    }
  }

  void read() {
    for (MapEntry entry in bookMap.entries) {
      //map은 반복문 돌릴라면, entires.
      String id = entry.key;
      Book book = entry.value;
      print("[${id}] ${book.name}");
    }
  }
}

String getData(String info, [String defaultVal = ""]) {
  String input;
  while (true) {
    print(info);

    input = stdin.readLineSync() ?? defaultVal;

    if (input != "") break;

    print("방금 입력한 것은 빈 문자열입니다.");
  }

  return input;
}

void main() {
  Map bookMap = {};
  Menu menu = new Menu(bookMap);

  //UI(화면)(CUI, GUI)를 먼저 떠올려봐라, 그리고 주석을 짜라.
  while (true) {
    print("1. 도서 추가");
    print("2. 도서 수정");
    print("3. 도서 삭제");
    print("4. 도서 정보 보기");
    print("5. 프로그램 종료");

    String numStr = getData("번호를 입력하세요.", "-1");
    int num = int.tryParse(numStr) ?? -1; //정상적인 경우는 이상이니깐, 음수를 준다.

    if (!(0 < num && num <= 5)) continue;

    //번호에따라서, 해당 enum 리터럴을 booKMenu 변수에 담는다.
    BookMenu bookMenu =
        BookMenu.values[num - 1]; //RangeError, 음수든, 5가 들어가든 에러가 난다.
    bool isExit = menu.doWorkByBookMenuAndGetIsExit(bookMenu);
    if (isExit) break;

    //프로그램을 종료시키기 전까지 반복한다.
  }
}
