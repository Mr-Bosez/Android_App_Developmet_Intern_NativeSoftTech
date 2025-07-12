import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common_widgets/banner.dart';
import 'package:e_commerce/common_widgets/cart_order_count.dart';
import 'package:e_commerce/common_widgets/curated_widget.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_auth.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  final authService=AuthService();
  // for category collections
  final CollectionReference categoriesItem=FirebaseFirestore.instance.collection("category");
  // for product Items
  final CollectionReference items=FirebaseFirestore.instance.collection("items");

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 7,),
            Padding(
                padding:EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/logo.png",width: 100,height: 120,),
                  CartOrderCount()
                ],
              ),
            ),
            // SizedBox(height: 5,),
            MyBanner(),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shop By Category",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.black),),
                  Text("See All",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black38),),
                ],
              ),
            ),
            StreamBuilder(
              stream: categoriesItem.snapshots(),  //.snapshots() → Tells Firestore: “Start listening to changes in this collection and send me updates when they happen.”
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if(streamSnapshot.connectionState==ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                else if(streamSnapshot.hasError){
                  return Text("Error : ${streamSnapshot.error}");
                }
                else if(streamSnapshot.hasData){
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(streamSnapshot.data!.docs.length, (int index){
                        return InkWell(
                          onTap: (){
                            // final selectedCategory=fCategory[index].name.toLowerCase();
                            // final filteredItems=productItems.where((items)=>items.category.toLowerCase()==selectedCategory).toList();
                            context.router.navigate(
                                CategoryItemsRoute(
                                    selectedCategory: streamSnapshot.data!.docs[index]["name"]
                                )
                            );
                          },
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:EdgeInsets.symmetric(horizontal: 20),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  backgroundImage: CachedNetworkImageProvider(streamSnapshot.data!.docs[index]["image"]),
                                ),
                              ),
                              Text(streamSnapshot.data!.docs[index]["name"],style: TextStyle(fontWeight: FontWeight.w400),)
                            ],
                          ),
                        );
                      }
                      ),
                    ),
                  );
                }
                else{
                  return Text("No category found");
                }

              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("Curated For You",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.black),),
                  Text("See All",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black38),),
                ],
              ),
            ),
            StreamBuilder(
              stream: items.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot>streamSnapShot) {
                if(streamSnapShot.hasError){
                  return Text("Error : ${streamSnapShot.error}");
                }
                else if(streamSnapShot.hasData){
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 50),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:List.generate(streamSnapShot.data!.docs.length, (int index){
                        final item=streamSnapShot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: InkWell(
                            onTap: (){
                              context.router.navigate(ItemDetailRoute(productItem: item));
                            },
                            child:CuratedWidget(size: size, ecommerceItems: item) ,
                          ),
                        );
                      }),
                    ),
                  );
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }

              }
            ),


          ],
        ),
      ),
    );
  }
}
