import 'dart:io';

enum NumberInput{
  PLUS,MINUS,MULTIPLY,DIVISION,EXIT
}

int getNumber(String infoStr){
  print(infoStr);
  String input = stdin.readLineSync()??"";
  int number = int.tryParse(input)??-1;
  return number;
}

void selectOperator(String operatorInfo, num result) {
  print("$operatorInfo를 선택하셨습니다.");
  print("결과는 $result 입니다.");
}

Function sumA=(int a, int b)=> a+b;
Function sum1=(int a, int b, int c){
  return a+b+c;
};

Function sumB=(int a, int b)=> a-b;
Function sum2=(int a, int b, int c)=> a-b-c;

Function sumC=(int a, int b)=> a*b;
Function sum3=(int a, int b, int c)=> a*b*c;

Function sumD=(int a, int b)=> a/b;
Function sum4=(int a, int b, int c)=> a/b/c;

void main(){
  while(true) {
    print("[1.더하기 2.빼기 3.곱하기 4.나누기 5.종료]");

    String? menu = stdin.readLineSync();
    int menuNum = int.parse(menu??"-1");

    if(!(1<=menuNum&& menuNum<=5)) continue;

    assert(!(menuNum <= 0 || menuNum > 5));

    NumberInput numberInput = NumberInput.values[menuNum-1];

    if(numberInput==NumberInput.PLUS){
      print("더하기를 선택하셨습니다.");

      int plusWay=getNumber("[1.2개항 더하기 2.3개항 더하기]");
      if(plusWay==1) selectOperator("2개항 더하기", sumA(getNumber('첫번째 항 : '),getNumber('두번째 항 : ')));
      else if(plusWay==2) selectOperator("3개항 더하기", sum1(getNumber('첫번째 항 : '),getNumber('두번째 항 : '),getNumber('세번째 항 : ')));
    }
    else if(numberInput==NumberInput.MINUS){
      print("빼기를 선택하셨습니다.");

      int minusWay=getNumber("[1.2개항 빼기 2.3개항 빼기]");
      if(minusWay==1) selectOperator("2개항 빼기", sumB(getNumber('첫번째 항 : '),getNumber('두번째 항 : ')));
      else if(minusWay==2) selectOperator("3개항 빼기", sum2(getNumber('첫번째 항 : '),getNumber('두번째 항 : '),getNumber('세번째 항 : ')));
    }
    else if(numberInput==NumberInput.MULTIPLY) {
      print("곱하기를 선택하셨습니다.");

      int multiplyWay=getNumber("[1.2개항 곱하기 2.3개항 곱하기]");
      if(multiplyWay==1) selectOperator("2개항 곱하기", sumC(getNumber('첫번째 항 : '),getNumber('두번째 항 : ')));
      else if(multiplyWay==2) selectOperator("3개항 곱하기", sum3(getNumber('첫번째 항 : '),getNumber('두번째 항 : '),getNumber('세번째 항 : ')));
    }
    else if(numberInput==NumberInput.DIVISION){
      int divisionWay=getNumber("[1.2개항 나누기 2.3개항 나누기]");
      if(divisionWay==1) selectOperator("2개항 나누기", sumD(getNumber('첫번째 항 : '),getNumber('두번째 항 : ')));
      else if(divisionWay==2) selectOperator("3개항 나누기", sum4(getNumber('첫번째 항 : '),getNumber('두번째 항 : '),getNumber('세번째 항 : ')));
    }
    else if(numberInput==NumberInput.EXIT){
      print("종료를 선택하여 프로그램이 종료됩니다.");

      break;
    }
  }
}


