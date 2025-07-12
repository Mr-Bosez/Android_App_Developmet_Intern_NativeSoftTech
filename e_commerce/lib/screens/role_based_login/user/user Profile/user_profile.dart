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

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final authService = AuthService();
    final userUid=FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("users").doc(userUid).snapshots(),
                builder: (context,snapShot){
                  if(snapShot.hasData && snapShot.data!.exists){
                    final user =snapShot.data!;
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:CachedNetworkImageProvider("https://tse3.mm.bing.net/th/id/OIP.TYqtezGcQFt6N5A5b1zuEwHaH0?pid=ImgDet&w=206&h=217&c=7&dpr=1,1&o=7&rm=3",scale: 12.0)

                        ),
                        Text(user["name"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
                        Text(user["email"],style: TextStyle(color: Colors.blue,fontSize: 18),),
                      ],
                    );

                  }
                  else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          Divider(),
          
          GestureDetector(
            onTap: () {
              context.router.navigate(MyOrderRoute());
            },
            child:ListTile(
              leading: Icon(Icons.change_circle_rounded),
              title: Text("Order",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.router.navigate(PaymentRoute());
            },
            child:ListTile(
              leading: Icon(Icons.payments),
              title: Text("Payment Method",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
            ),
          ),
          GestureDetector(
            onTap: () {
            },
            child:ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
            ),
          ),
          GestureDetector(
            onTap: () {
              authService.signOut();
              context.router.navigate(LoginRoute());
              ref.invalidate(cartProvider);
              ref.invalidate(favouriteProvider);
            },
            child:ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
            ),
          ),
        ],
      ),
    );
  }


}
