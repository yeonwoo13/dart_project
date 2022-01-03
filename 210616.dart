void main(){
  List<String> list = ["a","b"]; //배열의 리터럴.
  list[1] = "c"; //인덱스 연산자. ->

  Set<int> set = {1,2,3,1};
  Map<String,String> map={"apple":"사과","orange":"오렌지"};
  map["apple"] = "풋사과";

  print(set);

  print(map["apple"]);
  //for-in 에서 var와 dynamic의 차이
 /* for (var e in list) {
    print(e.toUpperCase()); //이유는, 에디터가 e가 String인지 안다.
  }

  //dynamic을 안쓰는게 좋다. 에디터가 해당 변수를 이해하지 못해서, 나에게 좋은 추천 잘 못함.
  //dynamic은 항상 이런 특성이 있어서, var를 써라.
  for (dynamic e in list) {
    print(e.toUpp가 없다); //이유는, 에디터가 e가 String인지 모른다.
  }*/

  for (var e in set){
    print(e);
  }

  for (var entry in map.entries){//entry -> key:value
    entry.key;
    entry.value;
  }
}