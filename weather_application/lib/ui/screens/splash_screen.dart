import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/controller/splash/splash_cubit.dart';
import 'package:weather_application/controller/splash/states/splash_states.dart';
import 'package:weather_application/core/app_constants/app_constants.dart';
import 'package:weather_application/core/routing/app_router.dart';
import 'package:weather_application/ui/commonwidgets/empty_widget.dart';
import 'package:weather_application/utils/logger_utils.dart';

import '../commonwidgets/custom_loader.dart';
@RoutePage()
class SplashScreen extends StatelessWidget{
   SplashScreen({super.key});

  final  _logger=LoggerUtils();
  final String TAG='SplashScreen';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create:(BuildContext context)=> SplashCubit(),
      child: BlocConsumer<SplashCubit,SplashStates>(
          listener: (BuildContext context,SplashStates state){
            state.whenOrNull(
              startNextScreen: (){
                _logger.log(TAG: TAG, message: 'Navigating to home screen');
                context.router.replace(const OnBoardingRoute());
                // context.router.replace(const ForecastRoute());
              }
            );
          },
        builder: (BuildContext context,SplashStates state){
            return state.when(
                loading: (){
                  return CustomLoader();
                },
                displaySplashView: (){
                  return Scaffold(
                    backgroundColor: ApplicationConstants.splashScreenBGColor,
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/air_quality_logo.png'),
                          SizedBox(height: 10,),
                          Text(ApplicationConstants.kAppName,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30),)
                        ],
                      ),
                    )
                  );
                },
                startNextScreen: (){
                  return EmptyWidget();
                }
            );
        },
      ),
    );
  }
}