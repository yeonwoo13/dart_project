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
  void create(List<Book> bookList) {
    String bookId = getData("추가할 도서의 아이디를 입력하세요.");
    String bookName = getData("추가할 도서의 제목을 입력하세요.");
    String bookGenre = getData("추가할 도서의 장르을 입력하세요.");
    String bookAuthor = getData("추가할 도서의 저자을 입력하세요.");

    Book book = new Book(bookId, bookName, bookGenre, bookAuthor);
    bookList.add(book);

    print("'$bookName'를(을) 도서에 추가하셨습니다.");
  }

  void update(List<Book> bookList) {
    read(bookList);

    Book? foundBook = findBook(bookList);
    if (foundBook != null) {
      String bookId = getData("수정할 도서의 아이디를 입력하세요.");
      String bookName = getData("수정할 도서의 제목을 입력하세요.");
      String bookGenre = getData("수정할 도서의 장르을 입력하세요.");
      String bookAuthor = getData("수정할 도서의 저자을 입력하세요.");

      foundBook.id = bookId;
      foundBook.name = bookName;
      foundBook.genre = bookGenre;
      foundBook.writer = bookAuthor;
    } else {
      print("해당 책이 없습니다.");
      return;
    }
  }

  void delete(List<Book> bookList) {
    read(bookList);

    Book? foundBook = findBook(bookList);
    if (foundBook != null) {
      bookList.remove(bookList);
    } else {
      print("해당 책이 없습니다.");
      return;
    }
  }

  void read(List<Book> bookList) {
    for (Book book in bookList) {
      print("[${book.id}] ${book.name}");
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

Book? findBook(List<Book> bookList) {
  String bookId = getData("책의 ID를 입력하세요.");
  Book? foundBook = null;
  for (Book book in bookList) {
    if (book.id == bookId) {
      foundBook = book;

      break;
    }
  }
  return foundBook;
}

void main() {
  Menu menu = new Menu();
  List<Book> bookList = [];
  while (true) {

    print("1. 도서 추가");
    print("2. 도서 수정");
    print("3. 도서 삭제");
    print("4. 도서 정보 보기");
    print("5. 프로그램 종료");

    String numStr = getData("번호를 입력하세요.", "-1");
    int num = int.tryParse(numStr) ?? -1;

    if (! (0 < num && num <= 5)) continue;

    BookMenu bookMenu = BookMenu.values[num - 1];
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
