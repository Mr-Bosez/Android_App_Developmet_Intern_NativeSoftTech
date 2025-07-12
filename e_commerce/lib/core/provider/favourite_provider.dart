import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteProvider =ChangeNotifierProvider<FavouriteProvider>((ref)=>FavouriteProvider());

class FavouriteProvider extends ChangeNotifier{
  List<String>_favouriteIds=[];
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  List<String>get favourites=>_favouriteIds;

  void reset(){
    _favouriteIds=[];
    notifyListeners();
  }

  final userId=FirebaseAuth.instance.currentUser?.uid;

  FavouriteProvider(){}

  //toggle favourite states
  void toggleFavourite(DocumentSnapshot product)async{
    String productId=product.id;
    if(_favouriteIds.contains(productId)){
      _favouriteIds.remove(productId);
      await _removeFavourite(productId);
    }
    else{
      _favouriteIds.add(productId);
      await _addFavourite(productId);
    }
    notifyListeners();
  }

  // check if a prd is favourite
  bool isExist(DocumentSnapshot product){
    return _favouriteIds.contains(product.id);
  }

  // add favourites to firestore
  Future<void> _addFavourite(String productId) async  {
    try{
      await _firestore.collection("UserFavourite").doc(productId).set({"isFavourite":true,"userId":userId});
    }
    catch(exception){
      throw (exception.toString());
    }
  }

  // remove the iem from favourite
  Future<void> _removeFavourite(String productId) async{
    try{
      await _firestore.collection("UserFavourite").doc(productId).delete();
    }
    catch(exception){
      throw (exception.toString());
    }
  }
  // to keep and load favourite items
  Future<void>loadFavouriteProduct()async{
    try{
      QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("UserFavourite").where("userId",isEqualTo: userId).get();
      _favouriteIds=snapshot.docs.map((doc)=>doc.id).toList();

    }
    catch(exception){
      throw exception.toString();
    }
    notifyListeners();
  }

}