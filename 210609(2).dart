class AException implements Exception {}

void a() {
  print("a");
  b();

  print("after  a");
}

void b() {
  print("b");
  throw new AException();
}

void main() {
  try {
    a(); //프로그램이 종료된다면, 15번째줄에서 종료한다.
  } on AException {
    print("AException을 처리하였으니 프로그램이 종료되지 않습니다.");
  }

  //tryParse.
  int? c;
  try {
    c = int.parse(""); //FormatExcetipn.
  } on FormatException {
    c = null;
  }

  print("c = ${c}");
}
