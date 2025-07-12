import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
@RoutePage()
class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId=FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Total Order"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Orders").where('userId',isEqualTo:userId).snapshots(),
          builder: (context,snapShot){
            if(!snapShot.hasData){
              return Center(child: Text("No orders",style: TextStyle(color: Colors.red),),);
            }
            if(snapShot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            final orders=snapShot.data!.docs.reversed.toList();
            return ListView.builder(
              itemCount: orders.length,
                itemBuilder:(context,int index){
                var order=orders[index];
                  return ListTile(
                    title: Text("Order ID :${order.id}"),
                    subtitle: Text("Total Amount : \$${order['totalPrice']}"),
                    onTap: (){
                      context.router.navigate(OrderDetailRoute(orderId: order.id));
                    },
                  );
                }
            );
          }
      ),
    );
  }
}
