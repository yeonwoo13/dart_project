void multiple2(List list) {
  //뭘 모르는데??~?~?~?
  // for(eleme)
}

void main() {
  //조건문?
  //if

  //if가 1개의 문장이면, 만약에 실행되는곳이 3개다라면, 그 중에 1개만 실행된다. 반드시.
  // if(bool1){
  //   //bool1이 참일때 실행되는곳.
  // }
  // else if(bool2) {
  //   //bool1이 거짓이고, bool2가 참일때 실행되는곳.
  // }
  // else if(bool3) {
  //   //bool1, bool2가 거짓이고, bool3가 참일때 실행되는곳.
  // }
  // else {
  //   //위에가 다 아니면 실행되는 곳.
  // }

  //scroe라는 변수에 95가 있따.
  //score가 \60보다 크면 B라고 출력하고,
  //score가 80보다 크면 A라고 출력하기.
  int score = 95;
  // if(score>80){
  //   print("A");
  // }
  // else if(score>60){
  //   print("B");
  // }

  // if(score>80){
  //   print("A");
  // }
  //
  // if(score>60){
  //   print("B");
  // }

  //반복문?
  //for : 숫자를 반복하는 것.
  //10부터 50까지 수를 누적해서, 아래에 a를 쓰는 프로그램 만듥.
  int sum = 0;
  for (int number = 10; number <= 50; number++) {
    //sum= sum+i;
    sum += number;
  }
  print(sum);

  // int a = 0;
  // int b = ++a;
  // int c = a++;

  //10부터 50까지 수에서 짝수만 누적하는 프로그램 만들기
  //if를 쓰면 안됨.
  for (int i = 10; i <= 50; i += 2) {
    print(i);
  }

  //for를이용해서 list를 반복할거임.
  List list = ['a', 'b', 'c','d','e'];
  for (int index = 0; index < list.length; index++) {
    var element = list[index];
    print("list의 $index 요소는 ${element}");
  }

  //for-in : 컬렉션을 반복하는것.
  int index = 0;
  for(String element in list){
    print("list의 $index 요소는 ${element}");

    index++;
  }

  Set set = {'a', 'b', 'c','d','e'};
  index = 0;
  for(String element in set){
    print("set의 $index 요소는 ${element}");

    index++;
  }

  //Map~?? 다름........
  Map map = {'a':'a', 'b':'b'};



  //while : 무한루프 만들때 쓰는것
  //반복문의 발전순서
  //while이있었고, for이 생겻고, for-in이 생김

  //1,2,3,4,5 수를 갖는 리스트가 있음.

  //List list = [1, 2, 3, 4, 5];

  //2,4,6,8,10 수를 갖는 리스트로 만드는 함수를 만들어서 사용해라.
  multiple2(list);
  //그리고 출력

  //변수;->변수의값;

  // int a = 1;
  // int b = a;
  // b = 3;
  // print(a); //a?
  // print(b); //b?
  // //=>int, double, String, bool, null 리터럴은 대입할 때 값이 복사된다.
  //
  //
  // List list = [];
  // List list2 = list;
  // list2.add(1);
  // list2.add(2);
  // print(list); //list ?
  // print(list2); //list2?
  // //=>컬렉션(List,Set,Map) 리터럴은 대입할 때 주소가 복사된다.

  //변수 어떻게 만들어요?
  //int a;

  //값 복사 예제
  int result = 0;
  result = add(3, 5, result);

  print(result); //result?

  //주소 복사 예제
  List resultList = [];
  addInList(3, 5, resultList);

  print(resultList); //resultList?

  //바
}

int add(int a, int b, int result) {
  result = a + b;
  return result;
}

void addInList(int a, int b, List resultList) {
  resultList.add(a + b);
}
