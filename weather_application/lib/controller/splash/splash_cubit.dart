import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/controller/splash/states/splash_states.dart';
import 'package:weather_application/core/app_constants/app_constants.dart';

class SplashCubit extends Cubit<SplashStates>{
  SplashCubit() : super(const SplashStates.displaySplashView()){
    init();
  }

  Future<void> init() async{
    emit(SplashStates.displaySplashView());
    await Future.delayed(Duration(seconds: ApplicationConstants.kSplashDuration),(){
      emit(SplashStates.startNextScreen());
    });
  }

}