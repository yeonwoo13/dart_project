import 'dart:io';

String getAddress(String city, [String? district, String zipCode = '111222']) {
  String resultStr = "";

  resultStr += city + "시 ";
  if (district != null) {
    resultStr += district + "구 ";
  }
  resultStr += zipCode;

  return resultStr.trim(); //맨앞 공백과 맨 뒤에 공백 제거
}

String getAddressByNamefield(String city,
    {String? district, String zipCode = '111222'}) {
  return '$city시 ${district ?? ""}구 $zipCode';
}

void printFun(String a) { //더 좋은 형태
  print("값은 $a입니다.");
}

void main() {
  print("${getAddress('서울')}");
  print("${getAddress('서울', '강남')}");
  print("${getAddress('서울', '강남', '33333')}");

  print("${getAddressByNamefield('서울')}");
  print("${getAddressByNamefield('서울', zipCode: '343234')}");
  print("${getAddressByNamefield('서울', district: '강남')}");
  print("${getAddressByNamefield('서울', zipCode: '33333', district: '강남')}");

  Function printFunVar = (String a) {
    print("값은 $a입니다.");
  }; //변수에 함수가 들어갈 수 있다라는 개념. (가능하다)

  //printFunVar(); //입력인자가 있던 없던 그냥 불린다., 나중에 에러난다.
  printFun("b"); //에라난다. 입력인자가 없어서.

  //람다식은 함수를 1줄에 표현하고 싶은 니즈떄문에 생긴녀석.
  Function printLamdaVar = (String a) => print("값은 $a입니다.");
  Function addLamdaVar = (int a, int b) => a+b;

  int result = addLamdaVar(7,8);
  print("$result");
}