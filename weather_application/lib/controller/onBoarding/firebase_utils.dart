import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/logger_utils.dart';

class FireBaseUtils{
  final _logger=LoggerUtils();
  final tag="FireBaseUtils";

  //step-1 Initialize the firebase authentication
  Future<User?>initializeUser() async{
    try{
      // FirebaseApp fireBaseApp =await Firebase.initializeApp();
      User? currentUser= FirebaseAuth.instance.currentUser;
      if(currentUser!=null){
        return Future.value(currentUser);
      }
      else{
        // user has not logged in
        return Future.value(null);
      }

    }
    catch(exception){
      _logger.log(TAG: tag, message: "Exception in initializing $exception");
      return Future.error("Exception in initializing $exception");
    }
  }


  //step -2 if step 1 fails then show user the google sign in make user to sign into app
  Future<User?>signInToApp() async{
    User?currentUser;
    try{
      FirebaseAuth auth =FirebaseAuth.instance;
      final GoogleSignIn googleSignIn=GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();// shows the list of accounts
      if(googleSignInAccount!=null){
        final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
        AuthCredential credential=GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
        );
        final userCredentials=await auth.signInWithCredential(credential);
        User?currentUser=userCredentials.user;
        if(currentUser!=null){
          return Future.value(currentUser);
        }
        else{
          return Future.error("Failed to login to Gmail Account");

        }

      }
      else{
        return Future.error("No Gmail ids are configured in this device");
      }


    }
    catch(exception){
      _logger.log(TAG: tag, message: "Exception in signing in $exception");
      return Future.error("Exception in signing in $exception");
    }
  }

}