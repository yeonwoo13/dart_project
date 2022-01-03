import 'dart:io';

class ReadUtil { //이게내 자산이야,이게 늘어나면, 코드 생산력.
  static String getString(String info, [String defaultVal = ""]) {
    String input;
    while (true) {
      print(info);

      //값을 입력 한다.
      input = stdin.readLineSync() ?? defaultVal;

      //값을 잘입력 받았으면(빈 문자열이 아니면) 탈출한다.
      if (input != "") break;

      print("방금 입력한 것은 빈 문자열입니다.");
    }

    return input;
  }

  static int getInt(String info, [int defaultVal = -1]) {
    return int.tryParse(getString(info, defaultVal.toString())) ?? defaultVal;
  }
}