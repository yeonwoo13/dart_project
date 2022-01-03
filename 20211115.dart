import 'dart:io';

// void main(){
//   Future refreshTokenFuture = getRefreshToken();
//   refreshTokenFuture.then((value) {
//     //getRefreshToken가 완료되면, 이 함수를 호출해주세요라고 제춣한거다.
//     print("b");
//
//     //코드를 지정할 수 있게 됨.
//   });
//
//   print("a");
// }
//
// //생성자를 부르면 어떻게 됨?
// //인스턴스가 만들어진다.
// //생성자의 출력은 새로운 인스턴스.
//
// Future<String?> getRefreshToken(){
//   return Future((){
//     sleep(Duration(seconds: 5));
//     return "token";
//   });
// }

//10초뒤에 응답이 오는 것처럼 Future를 만들어라. 응답은 {"result":"비밀번호가틀렸습니다"}
//응답이 오면, 그 응답을 출력해보아라.

//i love you.
//iLoveYou.


//1. Future를 만들어라.
Future< Map<String,String> > getFailMessage(){
  return Future((){
    sleep(Duration(seconds: 10));
    return {"result":"비밀번호가틀렸습니다"};
  });
}


//2. 그리고 그 Future를 사용해라.
void main(){
  Future<Map<String,String>> failMessageFuture = getFailMessage();
  failMessageFuture.then((Map<String,String> map){
    //서버에서 응답이 왔따?? O

    //비밀번호가틀렸습니다를 끄집어낸다.
    String? result = map["result"];
    //String?인 이유 : map에 key가 없을 수도 있어서.

    //그것을 출력한다
    print(result);
  });

  print("a");
}