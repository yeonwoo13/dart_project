//물건 클래스 만들기.
//속성은 이름, 가격, 종류
//메소드는 없어요.
//메소드라는건, 클래스가 주어가 되야함. 물건이 의지가 있나? 물건이 뭘할 수 는없어.

//1. 기본 생성자. 2. 이름 부여된 생성자. 3. 초기화 리스트, 4. 리다이렉팅 생성자.
//4가지를 다 만들어보기.

class Product {
  String name;
  int price;
  String type;

  Product(this.name, this.price, this.type);

  Product.initNameAndPrice(String name, int price)
      : this(name, price, 'general');
}

void main() {
  Product product1 = new Product('펜', 500, '학용품');
  Product product2 = new Product.initNameAndPrice('지우개', 1000);
}
