import 'package:flutter/material.dart';

class AppModel {
  final int id;
  final String name, image, description, category;
  final double rating;
  final int price, review;
  final List<Color> fcolor;
  final List<String> size;
  final bool isCheck;

  AppModel({
    required this.id,
    required this.fcolor,
    required this.size,
    required this.isCheck,
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
    required this.price,
    required this.review,
  });
}
String des="Discover our latest dress collection, where timeless elegance meets modern design. From flowing maxi dresses and chic wrap styles to lace-trimmed evening gowns and puff-sleeve daywear, each piece is crafted to elevate your wardrobe. Embrace effortless sophistication with soft fabrics, bold prints, and silhouettes designed to flatter every body type.";

List<AppModel> productItems = [
  //men
  AppModel(
    id: 1,
    fcolor: [Colors.white, Colors.black, Colors.blue],
    size: ["M","S","XL","XXL"],
    isCheck: true,
    name: "CB-COLEBROOK Men's Casual Button Down Shirts Long Sleeve Linen Shirt Fashion Textured Beach Summer Shirts",
    image: "assets/images/dress collection/men_col.jpg",
    description: des,
    category: "Men",
    rating: 4.9,
    price: 498,
    review: 250,
  ),
  AppModel(
    id: 2,
    fcolor: [Colors.white, Colors.black, Colors.red],
    size: ["M","S","XL","XXL"],
    isCheck: true,
    name: "TAGDO Men's Regular Fit Casual Shirt",
    image: "assets/images/dress collection/men2.jpg",
    description: des,
    category: "Men",
    rating: 4.9,
    price: 498,
    review: 250,
  ),
  AppModel(
    id: 3,
    fcolor: [Colors.white, Colors.black, Colors.red],
    size: ["M","S","XL","XXL"],
    isCheck: false,
    name: "Lymio Casual Regular Fit Shirt for Men|| Regular Fit Shirt for Men|| Men Stylish Regular Fit Shirt (Rib-Regular Fit Shirt)",
    image: "assets/images/dress collection/men3.jpg",
    description:des ,
    category: "Men",
    rating: 4.9,
    price: 498,
    review: 250,
  ),
  // women
  AppModel(
    id: 4,
    fcolor: [Colors.white, Colors.black, Colors.red],
    size: ["M","S","XL","XXL"],
    isCheck: true,
    name: "Rajnandini Women's Pure Cotton Straight Fit Straight Cambric Jaipuri Printed Kurti",
    image: "assets/images/dress collection/wm1.jpg",
    description: des,
    category: "Women",
    rating: 4.9,
    price: 799,
    review: 250,
  ),
  AppModel(
    id: 5,
    fcolor: [Colors.orange, Colors.black, Colors.red],
    size: ["M","S","XL","XXL"],
    isCheck: true,
    name: "Satrani Women's Satin Silk Hot Fixing Saree with Unstitched Blouse Piece",
    image: "assets/images/dress collection/wn2.jpg",
    description:des,
    category: "Women",
    rating: 4.9,
    price: 2999,
    review: 250,
  ),
  AppModel(
    id: 6,
    fcolor: [Colors.white, Colors.black, Colors.red],
    size: ["M","S","XL","XXL"],
    isCheck: false,
    name: "Glory Sarees Women's Banarasi Artificial Silk Saree With Blouse Piece",
    image: "assets/images/dress collection/wn3.jpg",
    description: des,
    category: "Women",
    rating: 4.9,
    price: 2999,
    review: 250,
  ),

  // kids
  AppModel(
    id: 7,
    fcolor: [Colors.white, Colors.black, Colors.blue],
    size: ["M","S","XL","XXL"],
    isCheck: true,
    name: "Hopscotch Boy's Cotton Printed Top And Pant Set",
    image: "assets/images/dress collection/kd1.jpg",
    description: des,
    category: "Kids",
    rating: 4.9,
    price: 2999,
    review: 250,
  ),
  AppModel(
    id: 8,
    fcolor: [Colors.white, Colors.black, Colors.grey],
    size: ["M","S","XL","XXL"],
    isCheck: true,
    name: "BUMZEE Grey & White Boys Shirt Waistcoat & Pant Set with Applique Bow",
    image: "assets/images/dress collection/kd2.jpg",
    description: des,
    category: "Kids",
    rating: 4.9,
    price: 2999,
    review: 250,
  ),
  AppModel(
    id: 9,
    fcolor: [Colors.white, Colors.black, Colors.greenAccent],
    size: ["M","S"],
    isCheck: false,
    name: "Hopscotch Boys Cotton Blend Checkered Pant Set In Green Color For Ages 2.5-3 Years",
    image: "assets/images/dress collection/kd3.jpg",
    description: des,
    category: "Kids",
    rating: 4.9,
    price: 822,
    review: 250,
  ),
];
