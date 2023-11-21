class Coffee {
  final String images;
  final String title;
  final String subTitle;
  final String price;
  final String rating;

  Coffee({
    required this.images,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.rating,
  });
}

List<Coffee> coffee = [
  Coffee(
    images: 'assets/products/cappuccino.jpeg',
    title: "Cappuccino",
    subTitle: "With Oat Milk",
    price: "229",
    rating: "4.7",
  ),
  Coffee(
    images: 'assets/products/espresso.jpeg',
    title: "Espresso",
    subTitle: "With Chocolate",
    price: "269",
    rating: "4.5",
  ),
  Coffee(
    images: 'assets/products/latte.png',
    title: "Latte",
    subTitle: "With Cream",
    price: "329",
    rating: "4.1",
  ),
  Coffee(
    images: 'assets/products/flatWhite.png',
    title: "Flat White",
    subTitle: "With Cream",
    price: "299",
    rating: "3.9",
  ),
  Coffee(
    images: 'assets/products/cream.png',
    title: "Cappuccino",
    subTitle: "With Cream",
    price: "279",
    rating: "4.3",
  ),
  Coffee(
    images: 'assets/products/chocolate.png',
    title: "Cappuccino",
    subTitle: "With Chocolate",
    price: "299",
    rating: "4.6",
  ),
  Coffee(
    images: 'assets/products/caffeMocha.png',
    title: "Caffe Mocha",
    subTitle: "With Oat Milk",
    price: "279",
    rating: "4.4",
  ),
];
