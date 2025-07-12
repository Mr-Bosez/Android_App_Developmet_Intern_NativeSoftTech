import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/controller/onBoarding/firebase_utils.dart';
import 'package:weather_application/controller/onBoarding/states/on_boarding_states.dart';
import 'package:weather_application/core/app_constants/app_constants.dart';
import 'package:weather_application/utils/logger_utils.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>{
  final _firebaseUtils=FireBaseUtils();
  final _Logger=LoggerUtils();
  final tag="FirebaseUtils";
  OnBoardingCubit():super(const OnBoardingStates.displayOnBoardView()){
    init();
  }

  Future<void>init()async {
    
    await _firebaseUtils.initializeUser().then((User?currentUserDetails) async {
      if (currentUserDetails != null) {
        emit(const OnBoardingStates.userSignInResponse(true, null, ApplicationConstants.kUserAlreadyLoggedIn));
        _Logger.log(TAG: tag,message: "User details in first step $currentUserDetails");
      }
      else {
        emit(const OnBoardingStates.displayOnBoardView());
      }
    }).onError((error, stackTrace) {
      _Logger.log(
          TAG: tag, message: "Error $error with stackTrace $stackTrace");
    });
  }



  // Future<void> startSigningIn() async{
  //   await _firebaseUtils.initializeUser().then((User?currentUserDetails) async {
  //     if (currentUserDetails != null) {
  //       _Logger.log(TAG: tag, message: "User details in first step $currentUserDetails");
  //       emit(OnBoardingStates.userSignInResponse(true, null, ApplicationConstants.kUserAlreadyLoggedIn));
  //     }
  //     else {
  //       User? userDetails = await _firebaseUtils.signInToApp();
  //       _Logger.log(TAG: tag, message: "User details in second step $userDetails");
  //       emit(OnBoardingStates.userSignInResponse(true, null, ApplicationConstants.kUserAlreadyLoggedIn));
  //     }
  //   }).onError((error, stackTrace) {
  //     _Logger.log(TAG: tag, message: "Error $error with stackTrace $stackTrace");
  //     emit(OnBoardingStates.userSignInResponse(false, error.toString(), null));
  //   });
  // }

  Future<void> startSigningIn() async {
    try {
      User? userDetails = await _firebaseUtils.signInToApp();
      _Logger.log(TAG: tag, message: "User details after sign-in: $userDetails");
      emit(OnBoardingStates.userSignInResponse(true, null, ApplicationConstants.kUserAlreadyLoggedIn));
    } catch (error, stackTrace) {
      _Logger.log(TAG: tag, message: "Error $error with stackTrace $stackTrace");
      emit(OnBoardingStates.userSignInResponse(false, error.toString(), null));
    }
  }

}