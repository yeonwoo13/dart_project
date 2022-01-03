import 'dart:io';

enum BookMenu { CREATE, UPDATE, DELETE, READ, EXIT }

class Menu {
  void create(List bookList) {
    //추가 받을 도서의 정보(1개이상)를 입력받는다.
    String bookId = getString("추가할 도서의 아이디를 입력하세요.");
    String bookName = getString("추가할 도서의 제목을 입력하세요.");
    String bookGenre = getString("추가할 도서의 장르을 입력하세요.");
    String bookAuthor = getString("추가할 도서의 저자을 입력하세요.");

    //책을 생성한다.
    Book book = new Book(bookId, bookName, bookGenre, bookAuthor);

    //리스트에 책을 저장한다.
    bookList.add(book);
  }

  void read(List bookList) {
    //책의 정보를 사용자에게 보여준다.
    for (Book book in bookList) {
      print("[${book.id}] ${book.name}");
    }
  }

  void update(List bookList) {
    read(bookList);

    Book? foundBook = findBook(bookList);
    if (foundBook != null) {
      String bookId = getString("수정할 도서의 아이디를 입력하세요.");
      String bookName = getString("수정할 도서의 제목을 입력하세요.");
      String bookGenre = getString("수정할 도서의 장르을 입력하세요.");
      String bookAuthor = getString("수정할 도서의 저자을 입력하세요.");

      foundBook.id = bookId;
      foundBook.name = bookName;
      foundBook.genre = bookGenre;
      foundBook.author = bookAuthor;
    } else {
      print("해당 책이 없습니다.");
      return;
    }
  }

  void delete(List bookList) {
    read(bookList);

    Book? foundBook = findBook(bookList);
    if (foundBook != null) {
      bookList.remove(bookList);
    } else {
      print("해당 책이 없습니다.");
      return;
    }
  }
}

class Book {
  String id;
  String name;
  String genre;
  String author;

  Book(this.id, this.name, this.genre, this.author);
}

String getString(String info, [String defaultVal = ""]) {
  String input;
  while (true) {
    print(info);

    //값을 입력 한다.
    input = stdin.readLineSync() ?? defaultVal;

    //값을 잘입력 받았으면(빈 문자열이 아니면) 탈출한다.
    if (input != "") break;

    print("방금 입력한 것은 빈 문자열입니다.");
  }

  return input;
}

Book? findBook(List bookList) {
  String bookId = getString("책의 ID를 입력하세요.");
  Book? foundBook = null;
  for (Book book in bookList) {
    if (book.id == bookId) {
      foundBook = book;

      break; //책이 10000개일 때 1번 째가 찾는 책이면 바로 탈출하지 않으면 불필요한 연산을 많이 하게 됨.
    }
  }

  return foundBook;
}

void main() {
  Menu menu = new Menu();
  List bookList = [];
  while (true) {
    //메뉴를 출력한다.
    print("1. 도서 추가");
    print("2. 도서 수정");
    print("3. 도서 삭제");
    print("4. 도서 정보 보기");
    print("5. 프로그램 종료");

    //메뉴 번호를 입력받는다.
    String numStr = getString("번호를 입력하세요.", "-1");
    int num = int.tryParse(numStr) ?? -1;

    //num이 0~4가 아니면, 아래를 실행하지 못하게 한다.
    bool isValid = (0 < num && num <= 5);
    if (!isValid) continue;

    //사용자가 선택한 번호의 기능을 수행한다.
    BookMenu bookMenu = BookMenu.values[num - 1]; //RangeError
    if (bookMenu == BookMenu.CREATE) {
      menu.create(bookList);
    } else if (bookMenu == BookMenu.UPDATE) {
      menu.update(bookList);
    } else if (bookMenu == BookMenu.DELETE) {
      menu.delete(bookList);
    } else if (bookMenu == BookMenu.READ) {
      menu.read(bookList);
    } else if (bookMenu == BookMenu.EXIT) {
      break;
    }
  }
}
