import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
@RoutePage()
class OrderDetailScreen extends StatelessWidget {
  final String orderId;
  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Order detail"),
        centerTitle: true,
        forceMaterialTransparency: false,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection("Orders").doc(orderId).get(),
          builder: (context,snapShot){
            if(!snapShot.hasData){
              return Center(child: Text("No orders",style: TextStyle(color: Colors.red),),);
            }
            if(snapShot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            final orders=snapShot.data!;
            var items=orders['items'] as List;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder:(context,int index){
                  var item=items[index];
                  return Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name:${item['name']}",style: TextStyle(fontSize: 16),),
                          Text("Quantity:${item['Quantity']}, SelectedColor : ${item['selectedColor']} , SelectedSize : ${item['selectedSize']}",style: TextStyle(fontSize: 16),),
                          Text("Price : \$${item['price']}, Status:${orders['status']}",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                  );
                }
            );
          }
      ),
    );
  }
}
