import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/controller/onBoarding/on_boarding_cubit.dart';
import 'package:weather_application/controller/onBoarding/states/on_boarding_states.dart';
import 'package:weather_application/core/app_constants/app_constants.dart';
import 'package:weather_application/core/routing/app_router.dart';
import 'package:weather_application/ui/commonwidgets/custom_loader.dart';
import 'package:weather_application/ui/commonwidgets/display_error.dart';
import 'package:weather_application/ui/commonwidgets/google_sign_in_button.dart';
import 'package:weather_application/utils/logger_utils.dart';
@RoutePage()
class OnBoardingScreen extends StatelessWidget{

  final _logger=LoggerUtils();
  final  tag="OnBoardingScreen";

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context)=>OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit,OnBoardingStates>(
          listener: (BuildContext context,OnBoardingStates states){
            states.whenOrNull(
              userSignInResponse: (bool isSuccess,String ?errorMessage,String? successMessage){
                if(isSuccess){
                  context.router.replace(HomeRoute());
                }
              }
            );
          },
        builder: (BuildContext context,OnBoardingStates states){
          final _onBoardingCubit=context.read<OnBoardingCubit>();
          return states.when(
              displayOnBoardView: (){
                return Scaffold(
                  body: Center(
                    child: Image.asset("assets/images/air_quality_logo.png",width: 250,height: 250,),
                  ),
                  bottomNavigationBar: GoogleSignInButton(
                    onButtonPress: () async{
                      await _onBoardingCubit.startSigningIn();
                    },
                  ),
                );
              },
              loading: (){
                return CustomLoader();
              },
              userSignInResponse: (bool isSuccess,String ?errorMessage,String? successMessage){
                if(isSuccess){
                  return CustomLoader();
                }
                else{
                  return DisplayError(
                    errorText: errorMessage?? ApplicationConstants.kWentWrongMessage,
                  );
                }

              });
        },
      ),
    );
  }
}