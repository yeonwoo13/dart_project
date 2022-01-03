import 'dart:io';

enum BookMenu { CREATE, UPDATE, DELETE, READ, EXIT }

class Book {
  String id = "";
  String name = "";
  String writer = "";
  String genre = "";

  Book(String id, String name, String writer, String genre) {
    this.id = id;
    this.name = name;
    this.writer = writer;
    this.genre = genre;
  }
}
class Menu {
  void create(List<Book> bookList) {
    String bookId = getData("추가할 도서의 아이디를 입력하세요.");
    String bookName = getData("추가할 도서의 제목을 입력하세요.");
    String bookWriter = getData("추가할 도서의 저자를 입력하세요.");
    String bookGenre = getData("추가할 도서의 장르를 입력하세요.");

    Book book = new Book(bookId, bookName, bookWriter, bookGenre);
    bookList.add(book);

    print("'$bookName'를 도서에 추가하셨습니다.");
  }
  void update(List<Book> bookList) {
    printBookList(bookList);

    String bookId = getData("수정할 책의 Id를 입력하세요.");
    for (Book book in bookList) {
      if (book.id == bookId) {
        //책이있으면, 대체할 이름, 장르, 저자를 입력받는다.
        String bookName = getData("대체할 책의 이름을 입력하세요.");
        String bookGenre = getData("대체할 책의 장르를 입력하세요.");
        String bookWriter = getData("대체할 책의 저자를 입력하세요.");

        //해당 책에 해당 내용을 적용한다.
        book.name = bookName;
        book.genre = bookGenre;
        book.writer = bookWriter;

        break;
      }
    }

    print("도서가 수정되었습니다.");
  }
  void delete(List<Book> bookList) {
    printBookList(bookList);

    String bookId = getData("삭제할 책의 Id를 입력해주세요");
    for (Book book in bookList) {
      if (book.id == bookId) {
        bookList.remove(book);
        break; //만약에 리스트에 요소가 1000000000개, 근데, 내가 찾던게 1번째 요소에 있다.
      }
    }
    print("도서가 삭제되었습니다.");
  }
  void read(List<Book> bookList) {
    printBookList(bookList);
  }
}

String getData(String info) {
  print(info);
  return stdin.readLineSync() ?? "";
}
void printBookList(List<Book> bookList) {
  print("현재  책 리스트는 아래와 같습니다.");
  for (Book book in bookList) {
    print("[${book.id}] ${book.name}");
  }
}

void main() {
  Menu menu = new Menu();
  List<Book> bookList = [];

  while (true) {
    print("==================================");
    print("1. 도서 추가");
    print("2. 도서 수정");
    print("3. 도서 삭제");
    print("4. 도서 정보 보기");
    print("5. 프로그램 종료");

    String numStr = getData("번호를 선택하세요.");
    int num = int.tryParse(numStr) ?? 0;

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
      print("프로그램을 종료합니다.");
      break;
    }
  }
}

//어떤 객체가 잇을때 데이터  관리한다하면,
//거의 CRUD릃 함
//c(Create)
//r(read)
//u(update)
//d(delete)