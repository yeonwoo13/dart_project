import 'dart:io';

void main(){
  String str = 'Let me test string';
  print("str:$str");
  print("");

  String substringStr = str.substring(0,2);
  print("substring:$substringStr");
  String substringStr1 = str.substring(3);
  print("substring2:$substringStr1");
  print("");

  String str2 = stdin.readLineSync()??"";
  bool isEmpty = str2.isEmpty;
  print("isEmpty:$isEmpty");
  print("");
  int strLen = str2.length;
  print("strLen:$strLen");
  print("");

  bool isContains = str2.contains("1");
  print("isContains:$isContains");
  bool isStartsWith=str2.startsWith("1");
  print("isStartsWith:$isStartsWith");
  bool isStartsWith2=str2.startsWith("3");
  print("isStartsWith2:$isStartsWith2");
  bool isEndswith=str2.endsWith("23");
  print("isEndsWith:$isEndswith");
  bool isEndswith2=str2.endsWith("1");
  print("isEndsWith2:$isEndswith2");
  print("");

  bool isEquals = (str2=="123");
  print("isEquals:$isEquals");
  print("");

  List strList = str2.split(" ");
  /*for(var element in strList){
    print("iselement:$element");
  }*/

  for(int i=0;i<strList.length;i++){
    print("$i번째element:${strList[i]}");
  }

  String replacedStr = str2.replaceFirst("me", "you");
  print("replacedStr:$replacedStr");
  print("");

  String replacedallStr = str2.replaceAll("me", "you");
  print("replacedAll:$replacedallStr");
  print("");

  String lowerStr = str2.toLowerCase();
  print("lowerStr:$lowerStr");
  String upperStr = str2.toUpperCase();
  print("upperStr:$upperStr");
  print("");

  String trimStr2 = str2.trim();
  print("trimStr2:$trimStr2");
  print("");
}