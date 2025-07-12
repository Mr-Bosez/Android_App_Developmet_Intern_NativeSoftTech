class CartModel{
  final String productID;
  final Map<String,dynamic> productData; //stores the product details as map
  late  int quantity;
  final String selectedColor;
  final String selectedSize;

  CartModel({required this.productID, required this.productData, required this.quantity, required this.selectedColor, required this.selectedSize});
}