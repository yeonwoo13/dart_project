void main(){
  Set set  = {};
  set.add("a");
  set.addAll({"b","c"});
  print(set);
  set.remove("a");
  print(set);

  //문장, 반복문, 조건문이 있음.
  //얘네들은 ;를 안씀.
  //if(){}
  //for(){}

  if(set.contains("a")){
    print("T");
  }
  else {
   print("F");
  }

  set.clear();
  print(set);

  set.addAll({"a","b","c","d"});
  print(set);
  
  print(set.first);
  print(set.last);

  if(set.isEmpty){
    print("Empty");
  }
  else{
    print("isNotEmpty");
  }
}