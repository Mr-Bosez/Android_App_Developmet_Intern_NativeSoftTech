import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/core/provider/favourite_provider.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:e_commerce/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
@RoutePage()
class AdminScreen extends ConsumerStatefulWidget {
  const AdminScreen({super.key});

  @override
  ConsumerState<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends ConsumerState<AdminScreen> {
  final _authService=AuthService();
  String? selectedCategory;
  List<String>categories=[];
  final CollectionReference items=FirebaseFirestore.instance.collection("items");
  final String uid=FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    fetchCategory();
    super.initState();

  }
  Future<void>fetchCategory()async{
    QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("category").get();
    setState(() {
      categories=snapshot.docs.map((doc)=>doc["name"] as String).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
          child:Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Your uploaded items",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Spacer(),
                    Stack(
                      children: [
                        IconButton(onPressed: (){
                          context.router.navigate(OrderRoute());
                        }, icon: Icon(Icons.receipt_long)),
                        Positioned(
                          top: 6,
                          right: 8,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection("Orders").snapshots(),
                            builder: (context,AsyncSnapshot<QuerySnapshot> snapShot){
                              if(snapShot.connectionState==ConnectionState.waiting){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              if(snapShot.hasError){
                                return Text("Error at loading data");
                              }
                              final orderCount=snapShot.data!.docs.length;
                              return CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 9,
                                child: Center(child: Text(orderCount.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        _authService.signOut();
                        context.router.navigate(LoginRoute());
                        ref.invalidate(cartProvider);
                        ref.invalidate(favouriteProvider);
                      },
                      child: Icon(Icons.exit_to_app),
                    ),
                    DropdownButton<String>(
                        items: categories.map((String category){
                          return DropdownMenuItem(
                              value: category,
                              child:Text(category),
                          );
                        }).toList(),
                        icon: Icon(Icons.tune),
                        underline: SizedBox(),
                        onChanged: (String ?newValue){
                          setState(() {
                            selectedCategory=newValue;
                          });
                        }
                    )
                  ],
                ),
                // Fetch the uploaded items from the firebase
                Expanded(
                    child: StreamBuilder(
                        stream: items.where("uploadedBy",isEqualTo: uid).where("category",isEqualTo:selectedCategory).snapshots(),
                        builder: (context,AsyncSnapshot<QuerySnapshot> snapShot){
                          if(snapShot.hasError){
                            return Center(
                              child: Text("Error at loading items"),
                            );
                          }
                          final documents =snapShot.data?.docs ?? [];
                          if(documents.isEmpty) return Center(child: Text("No items found"),);
                          return ListView.builder(
                            itemCount: documents.length,
                              itemBuilder: (context, index){
                                final items=documents[index].data() as Map<String,dynamic>;
                                return Padding(
                                    padding:EdgeInsets.only(bottom: 10),
                                  child: Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(10),
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(imageUrl: items["image"],height: 60,width: 60,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                                      ),
                                      title: Text(items["name"]??"N/A",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      subtitle: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(items["price"]!=null ? "\$${items["price"]}.00":"N/A",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize:15,letterSpacing: -1),),
                                              SizedBox(width: 5,),
                                              Text(items["category"]??"N/A"),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                );

                              }
                          );
                        }
                    )
                )
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          onPressed: (){
          context.router.navigate(AddItemsRoute());
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
