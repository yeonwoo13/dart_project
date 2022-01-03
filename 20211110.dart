import 'dart:io';
//
// void main() {
//   Future<String?> refreshTokenFuture = getRefreshToken();
//   refreshTokenFuture.then((value) {
//     print("return value: ${value}");
//   });
//
//   print("a");
// }
//
// Future<String?> getRefreshToken() {
//   return Future((){
//     sleep(Duration(seconds: 5)); //서버에 작업 요청한것처럼 5분뒤에 token 리턴하도록 만들었음.
//     return "token";
//   });
// }


void main() async {
  //호출쪽에서 await를 쓸 수 있다.
  //await를 쓰면, 작업이 끝날때까지 기다려요. 그래서 then을 쓸필요가 없다.
  //Future도 안오고, 그 내용물을 받을 수 있다.

  //await를 쓰려면, 그거를 호출하는 쪽의 함수가 async함수여야 한다.
  String? refreshToken = await getRefreshToken2();
  print("refreshToken : $refreshToken");
}


//정의쪽에서 async를 쓴다.
Future<String?> getRefreshToken2() async {
  //sleep만 안하면 됨.
  //위에서 FUture 안에 넣은거랑 똑같다.
  return "token";
}