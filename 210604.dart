import 'util/ReadUtil.dart';

enum BookMenu{
  CREATE,UPDATE,DELETE,READ,EXIT
}

class Book{
  String id;
  String name;
  String genre;
  String writer;

  Book(this.id,this.name,this.genre,this.writer);
  //왜 생성자륾 만들 필요 없는가? -> 자동으로 만들어준다. 매개변수가 비어있는 기본 생성자를 만들어줌.
  //Dart는 기본적으로 null을 받을 수 없다. 그러니깐 String id인 경우에 생성자가 없으면 문제가 생겨
  //왜?셋팅을 안하면 null이 들어가니깐.
}
class Menu{
  Map bookMap;

  Menu(this.bookMap);

  void update(){
    read();

    String bookIdToFind = ReadUtil.getString("책의 ID를 입력하세요.");
    Book? foundBook = bookMap.containsKey(bookIdToFind) ? bookMap[bookIdToFind] : null;
    if (foundBook != null) {
      String bookId = ReadUtil.getString("수정할 도서의 아이디를 입력하세요.");
      String bookName = ReadUtil.getString("수정할 도서의 제목을 입력하세요.");
      String bookGenre = ReadUtil.getString("수정할 도서의 장르을 입력하세요.");
      String bookAuthor = ReadUtil.getString("수정할 도서의 저자을 입력하세요.");

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
  void delete(){
    read();

    String bookId = ReadUtil.getString("책의 ID를 입력하세요.");
    Book? foundBook = bookMap.containsKey(bookId) ? bookMap[bookId] : null;
    if (foundBook != null) {
      bookMap.remove(foundBook.id);
    } else {
      print("해당 책이 없습니다.");
      return;
    }
  }
  void read(){
    for (MapEntry entry in bookMap.entries) {

      String id = entry.key;
      Book book = entry.value;
      print("[${id}] ${book.name}");
    }
  }

  void create(){
    String bookId = ReadUtil.getString("추가할 도서의 아이디를 입력하세요.");
    String bookName = ReadUtil.getString("추가할 도서의 제목을 입력하세요.");
    String bookGenre = ReadUtil.getString("추가할 도서의 장르을 입력하세요.");
    String bookAuthor = ReadUtil.getString("추가할 도서의 저자을 입력하세요.");

    Book book = new Book(bookId, bookName, bookGenre, bookAuthor);
    bookMap[bookId] = book;

    print("'$bookName'를(을) 도서에 추가하셨습니다.");
  }
}

void main(){
  Map bookMap={};
  Menu menu=new Menu(bookMap);
  while(true){
    //메뉴를 출력한다.
    print ("1. 도서 추가");
    print("2. 도서 수정");
    print("3. 도서 삭제");
    print("4. 도서 정보 보기");
    print("5. 프로그램 종료");

    //메뉴를 입력받는다.
    String numStr = ReadUtil.getString("메뉴를 입력하세요");
    int num = int.tryParse(numStr) ?? -1;

    //입력받은 값이 0초과 5이하인 경우에만 아래 코드를 실행한다
    bool isValid = 0<num && num<=5;
    if(!isValid) continue;

    //입력한 번호에 따른 enum 값을 가져온다.
    BookMenu bookMenu = BookMenu.values[num - 1];

    //입력받은 번호의 기능을 수행한다.
    if(bookMenu==BookMenu.CREATE){
      menu.create();
    }
    else if(bookMenu==BookMenu.UPDATE){
      menu.update();
    }
    else if(bookMenu==BookMenu.DELETE){
      menu.delete();
    }
    else if(bookMenu==BookMenu.READ){
      menu.read();
    }
    else if(bookMenu==BookMenu.EXIT){
      break;
    }

    //종료하지 않으면 반복한다.
  }
}