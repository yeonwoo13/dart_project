import 'dart:io';
class EmptyBookNameException implements Exception{

}

class EmptyBookTypeException implements Exception{
  String getMessage(){
    return "책이 없어요";
  }
}


void insertBook(String name, String type) {
  if(name.isEmpty) { //String class에 isEmpty라는 인스턴스 변수가 선언되어 있다.
    throw new EmptyBookNameException(); //throw는 에러를 발생시키는 return이라고 생각하면 된다.
  }

  if(type.isEmpty) {
    throw new EmptyBookTypeException(); //throw는 에러를 발생시키는 return이라고 생각하면 된다.
  }

  //책을 추가한다.
}

void main(){
  String bookName=stdin.readLineSync()??"";
  String bookType=stdin.readLineSync()??"";

  try{
    insertBook(bookName, bookType);
  }
  on EmptyBookNameException{
    print("EmptyBookNameException가 발생하였습니다.");
  }
  on EmptyBookTypeException catch(e1){
    print("e1 : ${e1.getMessage()}");
  }
}