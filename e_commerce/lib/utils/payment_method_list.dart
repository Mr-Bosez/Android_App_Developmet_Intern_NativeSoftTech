import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaymentMethodList extends StatefulWidget {
  final String? selectedPaymentMethodId;
  final double? selectedPaymentMethodBalance;
  final double?finalAmount;
  final Function(String?,double?)onPaymentMethodSelected;

  const PaymentMethodList({super.key,required this.selectedPaymentMethodId, required this.selectedPaymentMethodBalance,required  this.finalAmount, required this.onPaymentMethodSelected});

  @override
  State<PaymentMethodList> createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  @override
  Widget build(BuildContext context) {
    final userId=FirebaseAuth.instance.currentUser!.uid;
    return SizedBox(
      width: double.maxFinite,
      height: 150,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("User Payment Method").where('userId',isEqualTo: userId).snapshots(),
          builder: (context,snapShot){
            if(snapShot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(!snapShot.hasData){
              return Center(
                child: Column(
                  children: [
                    Text("No Payment Methods Available"),
                    InkWell(
                      onTap: (){
                        context.router.navigate(PaymentAddMethodRoute());
                      },
                        child: Text("Click Here To Add",style: TextStyle(color: Colors.blueAccent),)
                    )
                  ],
                ),
              );
            }
            final paymentMethod=snapShot.data!.docs;
            return ListView.builder(
              itemCount: paymentMethod.length,
                itemBuilder: (context,int index){
                  final method=paymentMethod[index];
                  return Material(
                    color: widget.selectedPaymentMethodId==method.id?Colors.blue[50]:Colors.transparent,
                    child: ListTile(
                      leading:CachedNetworkImage(imageUrl: method['image'],height: 50,width: 50,),
                      title: Text(method['paymentSystem']),
                      subtitle: availableBalance(method['balance'], widget.finalAmount),
                      selected: widget.selectedPaymentMethodId==method.id,
                      onTap: (){
                        widget.onPaymentMethodSelected(
                          method.id,
                          (method['balance']as num).toDouble()
                        );
                      },
                    ),
                  );
                }
            );

          }
      ),
    );
  }
   availableBalance(balance,finalAmount){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(balance>finalAmount)Text("Active",style: TextStyle(color:Colors.green),),
        if(balance<finalAmount) Text("Insufficient Balance",style: TextStyle(color: Colors.red),)
      ],
    );
  }
}
