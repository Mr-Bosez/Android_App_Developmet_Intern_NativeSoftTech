import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CuratedWidget extends ConsumerWidget {
  final DocumentSnapshot<Object?> ecommerceItems;
  final Size size;
  const CuratedWidget({super.key, required this.ecommerceItems, required this.size});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state=ref.watch(favouriteProvider);
    final notifier=ref.read(favouriteProvider.notifier);
    return Container(
      height: size.height*0.47,
      width: size.width*0.5,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,blurRadius: 8,spreadRadius:0,offset: Offset(3, 4)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children:[
              Hero(
                  tag: ecommerceItems.id,
                  transitionOnUserGestures: true,
                  child: SizedBox(
                      width: size.width*0.5,
                      height: size.height*0.35,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(image: CachedNetworkImageProvider(ecommerceItems["image"]),fit: BoxFit.cover,)))
              ),
              Positioned(
                top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: (){
                      notifier.toggleFavourite(ecommerceItems);
                    },
                      child: CircleAvatar(
                        backgroundColor: state.isExist(ecommerceItems)?Colors.white:Colors.black,
                          radius: 18,
                          child: Icon(
                            state.isExist(ecommerceItems)?
                            Icons.favorite:
                            Icons.favorite_border_rounded,
                            color:state.isExist(ecommerceItems)?Colors.red:Colors.white,)))
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6,top: 6),
            child: Row(
              children: [
                Text("SN",style: TextStyle(color: Colors.black38,fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(width: 4,),
                Icon(Icons.star,color: Colors.amberAccent,size: 18,),
                Text(("${Random().nextInt(3)+2}.${Random().nextInt(10)}").toString(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                SizedBox(width: 5,),
                Text("(${Random().nextInt(500)+1})",style: TextStyle(color: Colors.black26,fontSize: 12,fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6,top: 6),
            child: Text(ecommerceItems["name"],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          ecommerceItems["isDiscounted"]?
          Padding(
            padding: EdgeInsets.only(left: 6,top: 6),
            child: Row(
              children: [
                Text(
                  "\$${(ecommerceItems["price"]*(1-ecommerceItems["discountPercentage"]/100)).toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2,),
                Text(
                  "\$${ecommerceItems["price"]}.00",
                  style: TextStyle(
                    decoration: TextDecoration
                        .lineThrough,
                    decorationColor:
                    Colors.black38,
                  ),
                ),

              ],
            ),
          ) :
          Padding(
            padding: EdgeInsets.only(left: 6,top: 6),
            child: Row(
              children: [
                Text(
                  "\$${ecommerceItems["price"]}.00",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
