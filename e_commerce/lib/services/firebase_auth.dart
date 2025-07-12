import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;  //firebase authentication instance
  final FirebaseFirestore _firestore=FirebaseFirestore.instance; //firestore instance

  // function to handle user signup

  Future<String?>signUp({required String name,required String email, required String password, required String role})async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      // save addtional info to firestore
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        'name':name.trim(),
        'email':email.trim(),
        'role':role.trim()
      });
       return null;
    }
    catch(exception){
      return exception.toString();
    }
  }


  // function to handle user signIn

  Future<String?> signIn({required String email, required String password}) async{
    try{
      UserCredential userCredential=await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      //fetching users role from firestore to determine the access level
      DocumentSnapshot userDoc=await _firestore.collection('users').doc(userCredential.user!.uid).get();
      return userDoc['role']; // return the user role (admin / user)
    }
    catch(exception){
      return Future.value(exception.toString());
    }

  }

  // function to signout user

  Future<void>signOut()async{
    await _auth.signOut();
  }

}