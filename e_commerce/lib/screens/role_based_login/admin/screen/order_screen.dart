import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../router/app_router.dart';
@RoutePage()
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Total order"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Orders").snapshots(),
          builder: (context,snapShot){
            if(!snapShot.hasData|| snapShot.data!.docs.isEmpty){
              return Center(child: Text("No orders yet",style: TextStyle(color: Colors.red),),);
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
                    title: Text("Order ID :${order.id} \nTotal Amount : \$${order['totalPrice']}"),
                    subtitle: Text("Delivery Address:${order['address']}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    onTap: (){
                      context.router.navigate(OrderDetailsRoute(orderId: order.id));
                    },
                  );
                }
            );
          }
      ),
    );
  }
}


@RoutePage()
class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

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
                        Text("ProductId:${item['productId']}",style: TextStyle(fontSize: 16),),
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

