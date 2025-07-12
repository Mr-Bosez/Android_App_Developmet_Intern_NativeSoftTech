// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ForecastScreen]
class ForecastRoute extends PageRouteInfo<ForecastRouteArgs> {
  ForecastRoute({Key? key, String? stateName, List<PageRouteInfo>? children})
    : super(
        ForecastRoute.name,
        args: ForecastRouteArgs(key: key, stateName: stateName),
        initialChildren: children,
      );

  static const String name = 'ForecastRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForecastRouteArgs>(
        orElse: () => const ForecastRouteArgs(),
      );
      return ForecastScreen(key: args.key, stateName: args.stateName);
    },
  );
}

class ForecastRouteArgs {
  const ForecastRouteArgs({this.key, this.stateName});

  final Key? key;

  final String? stateName;

  @override
  String toString() {
    return 'ForecastRouteArgs{key: $key, stateName: $stateName}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return OnBoardingScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        SplashRoute.name,
        args: SplashRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return SplashScreen(key: args.key);
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}
