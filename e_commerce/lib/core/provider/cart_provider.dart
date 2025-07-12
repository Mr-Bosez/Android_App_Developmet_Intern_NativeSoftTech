import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/role_based_login/user/user_activity/model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider<CartProvider>((ref)=>CartProvider());
class CartProvider extends ChangeNotifier{
  List<CartModel>_carts=[];
  List<CartModel> get carts=> _carts;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  void reset(){
    _carts=[];
    notifyListeners();
  }
  // constructor to initially load all the cart items
  CartProvider(){
    loadCardItems();
  }

  final userID=FirebaseAuth.instance.currentUser?.uid;
  set carts(List<CartModel>carts){
    _carts=carts;
    notifyListeners();
  }

  // add items to cart

  Future<void> addCart(String productId,Map<String,dynamic> productData,String selectedColor,String selectedSize) async{
    int index=_carts.indexWhere((elements)=>elements.productID==productId) ;
    if(index != -1){
      // items exist ,update the quantity and sizes
      var existingItem=_carts[index];
      _carts[index]=CartModel(
          productID: productId,
          productData: productData,
          quantity: existingItem.quantity+1,// increase quantity
          selectedColor: selectedColor,
          selectedSize: selectedSize);
      await _updateCartInFirebase(productId,_carts[index].quantity);
    }else{
      // items doesn't exist add new entry
      _carts.add(
        CartModel(
            productID: productId,
            productData: productData,
            quantity: 1,
            selectedColor: selectedColor,
            selectedSize: selectedSize)
      );
      await _firestore.collection("usercart").doc(productId).set({
        'productData':productData,
        'Quantity': 1,
        'selectedColor':selectedColor,
        'selectedSize':selectedSize,
        'uid':userID
      });
    }
    notifyListeners();
  }

  // updates the cartItems in firestore
  Future<void>_updateCartInFirebase(String productId,int quantity)async{
    try{
      await _firestore.collection("usercart").doc(productId).update({"Quantity": quantity});
    }catch(exception){
      print(exception);
    }
  }

  // increase the quantity
  Future<void>addQuantity(String productId)async{
    int index=_carts.indexWhere((element)=>element.productID==productId);
    _carts[index].quantity +=1;
    await _updateCartInFirebase(productId, _carts[index].quantity);
    notifyListeners();
  }

  // decrease the quantity
  Future<void>decreaseQuantity(String productId)async{
    int index=_carts.indexWhere((element)=>element.productID==productId);
    _carts[index].quantity -=1;
    if(_carts[index].quantity<=0){
      _carts.removeAt(index);
      await _firestore.collection("usercart").doc(productId).delete();
    }else{
      await _updateCartInFirebase(productId, _carts[index].quantity);
    }

    notifyListeners();
  }

  // check product exist in the cart
  bool productExist(String productId){
    return _carts.any((element)=>element.productID==productId);
  }

  // cal the cart value
  double totalCart(){
    double total=0;
    for(var i=0;i<_carts.length;i++){
      final finalPrice=num.parse((_carts[i].productData["price"]*(1-_carts[i].productData["discountPercentage"]/100)).toStringAsFixed(2));
      total+=_carts[i].quantity*(finalPrice);
    }
    return total;
  }

  //load cart items from firestore and display in the screen
  Future<void>loadCardItems()async{
    try{
      QuerySnapshot querySnapshot=await _firestore.collection("usercart").where("uid",isEqualTo: userID).get();
      _carts=querySnapshot.docs.map((doc){
        final data=doc.data() as Map<String,dynamic>;
        return CartModel(
            productID: doc.id,
            productData: data['productData'],
            quantity: data['Quantity'],
            selectedColor: data['selectedColor'],
            selectedSize: data['selectedSize']
        );
      }).toList();
    }catch(e){
      print(e.toString());
    }
    notifyListeners();
  }

  // to delete the product items for cart
  Future<void>deleteCartItem(String productId)async{
    int index=_carts.indexWhere((element)=>element.productID==productId);
    if(index!=-1){
      _carts.removeAt(index);// remove from local storage
      await _firestore.collection("usercart").doc(productId).delete();
      notifyListeners();
    }
  }

  // to save the ordered details to firestore
  Future<void>saveOrder(String userId,BuildContext context,paymentMethodId,finalPrice,address)async{
    if(_carts.isEmpty) return;
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
          'userId':userID,
          'items':_carts.map((cartItem){
            return{
              'productId':cartItem.productID,
              'Quantity':cartItem.quantity,
              'selectedColor':cartItem.selectedColor,
              'selectedSize':cartItem.selectedSize,
              'name':cartItem.productData['name'],
              'price':cartItem.productData['price']
            };
          }).toList(),
          'totalPrice':finalPrice,
          'status':'pending',
          'createdAt':FieldValue.serverTimestamp(),
          'address':address
        };

        // create new order collection

        final orderRef=_firestore.collection("Orders").doc();
        transaction.set(orderRef, orderData);

      });
    }catch(exception){
      Future.error(exception);
    }
  }
}