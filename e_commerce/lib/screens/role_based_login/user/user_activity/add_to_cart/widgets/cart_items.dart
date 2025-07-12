import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/screens/role_based_login/user/user_activity/model/cart_model.dart';
import 'package:e_commerce/utils/colors_conversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItems extends ConsumerWidget {
  final CartModel cart;
  const CartItems({super.key, required this.cart});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state=ref.watch(cartProvider);
    final size=MediaQuery.of(context).size;
    final finalPrice=num.parse((cart.productData['price']*(1-cart.productData['discountPercentage']/100)).toStringAsFixed(2));
    return Container(
      height: 100,
      width: size.width/1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
          blurRadius: 5,
          spreadRadius: 4,
          color: Colors.grey,)
        ]

      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(imageUrl: cart.productData['image'],height: 100,width: 100,fit: BoxFit.cover,)),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(cart.productData['name'],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                    Row(
                      children: [
                        Text("Color : "),
                        CircleAvatar(backgroundColor: getColorFromName(cart.selectedColor),radius: 12,),
                        SizedBox(width: 10,),
                        Text("Size : ${cart.selectedSize}",),
                      ],
                    ),
                    SizedBox(height: 22,),
                    Row(
                      children: [
                        Text("\$$finalPrice",style: TextStyle(color: Colors.pink,fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: -1),),
                        SizedBox(width: 80,),
                        GestureDetector(
                          onTap: (){
                            if(cart.quantity>=1){
                              state.decreaseQuantity(cart.productID);
                            }
                          },
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
                            child: Icon(Icons.remove,color: Colors.white,size: 20,),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(cart.quantity.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: (){
                            state.addQuantity(cart.productID);
                          },
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
