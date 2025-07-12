import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common_widgets/show_snackbar.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


Future<void>placeOrder(
  BuildContext context,
  String productId,
  Map<String,dynamic> productData,
  String selectedColor,
  String selectedSize,
  String paymentMethodId,
  String address,
  num finalPrice
)async{
  final userId=FirebaseAuth.instance.currentUser!.uid;
  final paymentRef=FirebaseFirestore.instance.collection("User Payment Method").doc(paymentMethodId);
  try{
    // using transactions for atomic operations
    await FirebaseFirestore.instance.runTransaction((transaction)async{
      // get user current payment method
      final snapshot=await transaction.get(paymentRef);
      if(!snapshot.exists){
        throw Exception("Payment method not found");
      }
      final currentBalance=snapshot['balance'] as num;
      if(currentBalance<finalPrice){
        throw Exception("Insufficient balance");
      }
      // update payment method balance
      transaction.update(paymentRef, {
        'balance':currentBalance-finalPrice,
      });
      // create order data
      final orderData={
        'userId':userId,
        'items':[
            {
              'productId':productId,
              'Quantity':1,
              'selectedColor':selectedColor,
              'selectedSize':selectedSize,
              'name':productData['name'],
              'price':productData['price']
            }
        ],
        'totalPrice':finalPrice,
        'status':'pending',
        'createdAt':FieldValue.serverTimestamp(),
        'address':address
      };

      // create new order collection

      final orderRef=FirebaseFirestore.instance.collection("Orders").doc();
      transaction.set(orderRef, orderData);
      showSnackBar(context, "Order placed successfully");
      context.router.navigate(MyOrderRoute());

    });
  }on FirebaseException catch(e){
    showSnackBar(context, "Firebase error:$e");
  } on Exception catch(exception){
    showSnackBar(context, "Error :$exception");
  }

}