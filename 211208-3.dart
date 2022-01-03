class AException implements Exception{
}

void a(){
  print("a");

  b();

  print("after  a"); //이거 실행 안됨
}

void b(){
  print("b");

  throw FormatException(); //예외를 위한 return이다. return과 비슷한 개념.

  print("after b"); //이거 실행 안됨
}

void main(){
  //핵심은 예외는 처리 안하면, 계속 위에 함수로 올라간다.
  //그래서 결국 main에 도달하면, 에러로 인해 프로그램이 종료된다.
  a();
}