class Book {
  String id;
  String name;
  String genre;
  String writer;

  Book(this.id, this.name, this.genre, this.writer);
}

class FictionBook extends Book {
  FictionBook(String id, String name, String genre, String writer)
      : super(id, name, genre, writer);
}

class PoetryBook extends Book {
  PoetryBook(String id, String name, String genre, String writer)
      : super(id, name, genre, writer);
}

class SelfHelpBook extends Book {
  SelfHelpBook(String id, String name, String genre, String writer)
      : super(id, name, genre, writer);
}

void main() {
  //부모는 자식을 받아들일 그릇이 있다.
  //자식은 부모를 받아들이기 어리다.

  Book book = new FictionBook("id", "name", "genere", "writer"); //성공
  // FictionBook fictionBook = new Book("id","name","genere","writer"); //실패

  List<Book> bookList = [];
  bookList.add(book);
  bookList.add(new FictionBook("id2", "name", "genere", "writer"));

  Map<String, Book> bookMap = {}; //map, set일수도 있는데 어떻게 map으로?ㄴ
  bookMap["id"] = new FictionBook("id", "name", "genere", "writer");

  //FictionBook을 만들었다는것은 FictionBook인지를 구분할 필요성 있는것.
  //하나 확가실한건 부모가 Book인녀석이다. 근데, Book 자신일수도있고, 상속을 받은  무언가 일 수도있다.
  Book book1 = bookList[0];

  //이 값이  특정 자료형이냐?
  bool isFictionBook =
      book1 is FictionBook; //is는 맞으면 true를 return, 아니면 false를 리턴.
  if (book1 is FictionBook) {
    print("어 픽션북이야.");
  }

  num a = 10.0;
  bool isInt = a is int;
  bool isInt2 = 10 is int;
}
