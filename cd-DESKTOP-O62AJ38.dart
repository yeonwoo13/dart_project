//기획
//cd 절대경로
//cd 상대경로
//cd 경로 --hard (열심히 이동하겠다.)
//그 경로로 이동시키는 프로그램을 만들겠다.

//이 cd라는 프로그램을 만들어보자.
void main(List<String> args) {
  //args는 cui에서 cd 경로 --hard라고 쳤다면....
  //cd는 프로그램이기 때문에 크게 안중요하고,
  //경로 -> args[0]
  //--hard -> args[1]


  String path = args.length > 0 ? args[0] : ""; //경로
  String option1 = args.length > 1 ? args[1] : ""; //--hard

  if (path == "") {
    return;
  }

  if (option1 == "--hard") {
    print("$path로 열심히 이동했다.");
  } else {
    print("$path로 이동했다.");
  }
}
