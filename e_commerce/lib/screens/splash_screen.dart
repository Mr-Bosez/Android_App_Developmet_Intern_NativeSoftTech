import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth()async {
    await Future.delayed(Duration(seconds: 3));
    final user =FirebaseAuth.instance.currentUser;
    final FirebaseFirestore _fireStore=FirebaseFirestore.instance;

    if(!mounted)return;
    try{
      DocumentSnapshot doc=await _fireStore.collection('users').doc(user!.uid).get();
      final role=doc['role'];
      if(!mounted)return;
      if(role=='Admin'){
        context.router.replace(AdminRoute());
      }
      else{
        context.router.replace(AppMainRoute());
      }
    }
    catch(exception){
      context.router.replace(LoginRoute());
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[200],
      body: Center(
        child:Image.asset("assets/images/logo.png",filterQuality: FilterQuality.high,)
      ),
    );
  }
}
