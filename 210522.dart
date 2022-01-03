import 'dart:io';

void main(){
  String str = "Let me test string";
  print("str:$str");
  print("");

  String substringStr = str.substring(3);
  print("substringStr:$substringStr");
  String substringStr2 = str.substring(4,5); //me가 아니라 m이 출력된다. 즉, 4번째만  갖고온것임.
  print("substringStr2:$substringStr2");
  print("");

  String str2 = "";
  bool isEmpty = str2.isEmpty;
  print("isEmpty:$isEmpty");
  print("");

  int strLen = str.length;
  print("strLen:$strLen");
  print("");

  bool isContains = str.contains("test");
  print("isContains:$isContains");
  bool isStartsWith = str.startsWith("Let");
  print("isStartsWith:$isStartsWith");
  bool isStartsWith2 = str.startsWith("def");
  print("isStartsWith2:$isStartsWith2");
  bool isEndsWith = str.endsWith("string");
  print("isEndsWith:$isEndsWith");
  bool isEndsWith2 = str.endsWith("abc");
  print("isEndsWith2:$isEndsWith2");
  print("");

  bool isEquals = (str == "Let me test string");
  print("isEquals:$isEquals");
  print("");

  String replacedStr = str.replaceFirst("me", "you");
  print("replacedStr:$replacedStr");
  print("");

  List strList = str.split(" ");
  print("strList:$strList");
  print("");

  String lowerStr = str.toLowerCase();
  print("lowerStr:$lowerStr");
  String upperStr = str.toUpperCase();
  print("upperStr:$upperStr");
  print("");

  String str3 = "   Let me test string   ";
  print("str2:$str3");
  String trimStr2 = str3.trim();
  print("trimStr2:$trimStr2");
  print("");
}