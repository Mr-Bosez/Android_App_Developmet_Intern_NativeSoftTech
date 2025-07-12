import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common_widgets/cart_order_count.dart';
import 'package:e_commerce/common_widgets/show_snackbar.dart';
import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/core/provider/favourite_provider.dart';
import 'package:e_commerce/screens/role_based_login/user/controller/place_order_controller.dart';
import 'package:e_commerce/screens/role_based_login/user/size_and_color.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/payment_method_list.dart';

@RoutePage()
class ItemDetailScreen extends ConsumerStatefulWidget {
  final DocumentSnapshot<Object?> productItem;

  const ItemDetailScreen({super.key, required this.productItem});

  @override
  ConsumerState<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends ConsumerState<ItemDetailScreen> {
  late DocumentSnapshot product;
  int currentIndex = 0;
  int? selectedColorIndex;
  int? selectedSizeIndex;
  final TextEditingController _addressController=TextEditingController();
  String ? selectedPaymentMethodId;
  double?selectedPaymentMethodBalance;

  @override
  void initState() {
    super.initState();
    product = widget.productItem;
  }

  @override
  Widget build(BuildContext context) {
    final state=ref.watch(favouriteProvider);
    final notifier=ref.read(favouriteProvider.notifier);
    final finalPrice=num.parse(((product["price"] * (1 - product["discountPercentage"] / 100))).toStringAsFixed(2)); // important

    final ct=ref.watch(cartProvider);               // cart provider

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor2,
      appBar: AppBar(
        title: Text("Detailed Product"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child:CartOrderCount()
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 100),
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: size.height * 0.55,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      transitionOnUserGestures: true,
                      tag: product.id,
                      child: CachedNetworkImage(
                        imageUrl: product["image"],
                        height: size.height * 0.45,
                        width: size.width * 0.80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          margin: EdgeInsets.only(right: 4),
                          duration: Duration(microseconds: 6),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.circle,
                            color: index == currentIndex
                                ? Colors.black
                                : Colors.black26,
                          ),
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "SN",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.amberAccent, size: 18),
                    Text(
                      ("${Random().nextInt(3) + 2}.${Random().nextInt(10)}")
                          .toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(${Random().nextInt(500) + 1})",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        notifier.toggleFavourite(product);
                      },
                        child:Icon(state.isExist(product)?Icons.favorite:Icons.favorite_border_rounded, size: 25,color: state.isExist(product)?Colors.red:Colors.black26,)),
                  ],
                ),
                SizedBox(
                  width: size.width,
                  child: Text(
                    product["name"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                product["isDiscounted"]
                    ? Padding(
                        padding: EdgeInsets.only(left: 0, top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\$${(product["price"] * (1 - product["discountPercentage"] / 100)).toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "\$${product["price"]}.00",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 0, top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\$${product["price"]}.00",
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 10),
                Text(
                  "A dress is a timeless, one-piece garment that combines both a top and a skirt into a single item of clothing. Designed for elegance and versatility, dresses can vary widely in style, length, fabric, and fit. From casual daywear to formal evening attire, dresses offer a flattering silhouette and are a staple in every woman’s wardrobe.",
                  // product['description'],
                  style: TextStyle(color: Colors.black45, fontSize: 15),
                ),
                SizedBox(height: 5),
                SizeAndColor(
                  colors: product["color"],
                  sizes: product["size"],
                  onColorSelected: (index){
                    setState(() {
                      selectedColorIndex=index;
                    });

                  },
                  onSizeSelected: (index){
                    setState(() {
                      selectedSizeIndex=index;
                    });
                  },
                  selectedColorIndex: selectedColorIndex,
                  selectedSizeIndex: selectedSizeIndex,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  final productId=product.id;
                  final productData=product.data() as Map<String,dynamic>;
                  final selectedColor=product['color'][selectedColorIndex];
                  final selectedSize=product['size'][selectedSizeIndex];
                  ct.addCart(productId, productData, selectedColor, selectedSize); // call the addToCart fun i provider
                  // notify the user prdt added to cart
                  showSnackBar(context, "${product['name']} added to cart!");
                },
                icon: Icon(Iconsax.shopping_bag, color: Colors.black, size: 20),
                label: Text(
                  "ADD TO CART",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () async{
                  final productId=product.id;
                  final productData=product.data() as Map<String,dynamic>;
                  final selectedColor=product['color'][selectedColorIndex];
                  final selectedSize=product['size'][selectedSizeIndex];
                  // Buy now logic
                  setState(() {

                  });
                  _showOrderConfirmDialog(context, ct, productId, productData, selectedColor, selectedSize, finalPrice+40);
                },
                icon: Icon(Iconsax.bag_tick, color: Colors.white, size: 20),
                label: Text(
                  "BUY NOW",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showOrderConfirmDialog(
      BuildContext context,
      CartProvider cp,
      String productId,
      Map<String,dynamic> productData,
      String selectedColor,
      String selectedSize,
      finalPrice
      ){
    String ?addressError;
    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(builder: (context,setDialogState){
            return AlertDialog(
              title: Text("Confirm your order !"),
              content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Name:${productData['name']} "),
                    Text("Quantity:1"),
                    Text("SelectedColor:$selectedColor"),
                    Text("SelectedSize:$selectedSize"),
                    // Text("Total payable price : \$${(cp.totalCart()+40).toStringAsFixed(2)}"),
                    Text("Total payable price : \$ $finalPrice"),
                    // payment methods
                    SizedBox(height:10),
                    Text("Select Payment Method",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                    // require a payment method
                    PaymentMethodList(selectedPaymentMethodId: selectedPaymentMethodId, selectedPaymentMethodBalance: selectedPaymentMethodBalance, finalAmount: cp.totalCart()+40,
                        onPaymentMethodSelected: (p0,p1){
                          setDialogState((){
                            selectedPaymentMethodId=p0;
                            selectedPaymentMethodBalance=p1;
                          });
                        }),
                    // to add address
                    Text("Add Your delivery Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter your address",errorText: addressError),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){
                          context.router.pop();
                        }, child: Text("Cancel")),


                        TextButton(onPressed: (){
                          if(selectedPaymentMethodId==null) {
                            showSnackBar(context, "Please select a payment Method");
                          } else if(selectedPaymentMethodBalance! < finalPrice){
                            showSnackBar(context, "Insufficient balance in the selected card");
                          }
                          else if(_addressController.text.length<8){
                            setDialogState((){
                              addressError="Give the appropriate address";
                            });
                          }else{
                            placeOrder(context, productId, productData, selectedColor, selectedSize, selectedPaymentMethodId!, _addressController.text, finalPrice);
                          }
                        }, child: Text("Confirm")),

                      ],
                    )

                  ],
                ),
              ),
            );
          });
        }
    );
  }


}
