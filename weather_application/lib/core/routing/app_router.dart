import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/screens/forecast_screen.dart';
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/on_boarding_screen.dart';
import '../../ui/screens/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter{
  @override
  List<AutoRoute>get routes=>[
    AutoRoute(page: SplashRoute.page,initial: true,path: '/splash'),
    AutoRoute(page: HomeRoute.page,path: '/home'),
    AutoRoute(page: OnBoardingRoute.page,path: '/onBoarding'),
    AutoRoute(page: ForecastRoute.page,path: '/forecast'),
  ];
}