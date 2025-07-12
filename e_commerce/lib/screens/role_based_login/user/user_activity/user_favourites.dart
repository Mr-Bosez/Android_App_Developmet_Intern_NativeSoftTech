import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/provider/favourite_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../router/app_router.dart';
@RoutePage()
class UserFavouriteScreen extends ConsumerStatefulWidget {
  const UserFavouriteScreen({super.key});

  @override
  ConsumerState<UserFavouriteScreen> createState() => UserFavouriteScreenState();
}

class UserFavouriteScreenState extends ConsumerState<UserFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final notifier=ref.read(favouriteProvider.notifier);
    final currentUser=FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("UserFavourite").where("userId",isEqualTo: currentUser).snapshots(),
                  builder: (context,snapShot){
                    if(snapShot.hasError){
                      return Center(child: Text(snapShot.error.toString()),);
                    }
                    else if(!snapShot.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    final favouriteDocs=snapShot.data!.docs;
                    if(favouriteDocs.isEmpty){
                      return Center(child: Text("No favourites yet"),);
                    }
                    return FutureBuilder<List<DocumentSnapshot>>(
                        future: Future.wait(favouriteDocs.map((doc)=>FirebaseFirestore.instance.collection("items").doc(doc.id).get())),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: CircularProgressIndicator(),);
                          }
                          final favouriteItems=snapshot.data!.where((doc)=>doc.exists).toList();
                          if(favouriteItems.isEmpty){
                            return Center(child: CircularProgressIndicator(),);
                          }
                          return ListView.builder(
                            itemCount: favouriteItems.length,
                              itemBuilder: (context,index){
                              final favouriteItem=favouriteItems[index];
                              return GestureDetector(
                                onTap: (){
                                  context.router.navigate(ItemDetailRoute(productItem: favouriteItem));
                                },
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(image: CachedNetworkImageProvider(favouriteItem['image']),fit: BoxFit.cover)
                                              ),
                                            ),
                                            SizedBox(width: 18,),
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(favouriteItem["name"],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                                    Text("${favouriteItem['category']} Fashion"),
                                                    Text("\$${favouriteItem['price']}.00",style: TextStyle(color: Colors.pink,fontSize: 16,fontWeight: FontWeight.w600),),
                                                  ],
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 50,
                                        right: 35,
                                        child: GestureDetector(
                                          onTap: (){
                                            notifier.toggleFavourite(favouriteItem);
                                          },
                                          child: Icon(Icons.delete,color: Colors.red,),
                                        )
                                    )
                                  ],
                                ),
                              );
                              }
                          );
                        }
                    );
                  }
              ),
    );
  }
}
