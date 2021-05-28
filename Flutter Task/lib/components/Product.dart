class Product {
  String image, title, description;
  int id;
  bool isselected;
  Product({
    this.id,
    this.image,
    this.title,
    this.description,
    this.isselected,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Fruits & Vegetables",
      description: dummyText,
      image: "assets/images/veg.png",
      isselected: false),
  Product(
    id: 2,
    title: "Cooking oil & Ghee",
    isselected: false,
    description: dummyText,
    image: "assets/images/oilpic.png",
  ),
  Product(
    id: 3,
    title: "Meat & Fish",
    isselected: false,
    description: dummyText,
    image: "assets/images/images.png",
  ),
  Product(
    id: 4,
    title: "Bekery & Snacks",
    isselected: false,
    description: dummyText,
    image: "assets/images/snack.png",
  ),
  Product(
    id: 5,
    title: "Dairy",
    isselected: false,
    description: dummyText,
    image: "assets/images/dairy.png",
  ),
  Product(
    id: 6,
    title: "Beverages",
    isselected: false,
    description: dummyText,
    image: "assets/images/drink.png",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";

String dummyText1 = "Lorem Ipsum is not simply random text";

class Category {
  String image, title, description, subtitle;
  bool isselected;
  Category({
    this.subtitle,
    this.image,
    this.title,
    this.description,
    this.isselected,
  });
}

List<Category> category = [
  Category(
      subtitle: dummyText1,
      title: "Mini Mart Grocery",
      description: dummyText,
      image: "assets/images/veg.png",
      isselected: false),
  Category(
    subtitle: dummyText1,
    title: "Veggies Corner",
    isselected: false,
    description: dummyText,
    image: "assets/images/oilpic.png",
  ),
  Category(
    subtitle: dummyText1,
    title: "Hyper Supermarket",
    isselected: false,
    description: dummyText,
    image: "assets/images/images.png",
  ),
  Category(
    subtitle: dummyText1,
    title: "Jimmy's Supermarket",
    isselected: false,
    description: dummyText,
    image: "assets/images/snack.png",
  ),
  Category(
    subtitle: dummyText1,
    title: "Ideal Chicken Corner",
    isselected: false,
    description: dummyText,
    image: "assets/images/dairy.png",
  ),
  Category(
    subtitle: dummyText1,
    title: "Martin's Store",
    isselected: false,
    description: dummyText,
    image: "assets/images/drink.png",
  ),
];
