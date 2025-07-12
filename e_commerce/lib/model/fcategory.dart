class Fcategory {
  final String name;
  final String imageUrl;
  Fcategory({required this.name,required this.imageUrl});
}

List<Fcategory> fCategory=[
  Fcategory(name: "Men", imageUrl: "assets/images/men.jpg"),
  Fcategory(name: "Women", imageUrl: "assets/images/women.jpg"),
  Fcategory(name: "Kids", imageUrl: "assets/images/kids.jpg"),
  Fcategory(name: "Teen", imageUrl: "assets/images/teens.jpg"),
  Fcategory(name: "Baby", imageUrl: "assets/images/baby1.jpg"),
];

List<String>filterCategory=[
  "Filter",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];