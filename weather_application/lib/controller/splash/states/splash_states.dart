import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_states.freezed.dart';
@freezed
class SplashStates with _$SplashStates{
  const factory SplashStates.loading() = _Loading;
  const factory SplashStates.displaySplashView()=_DisplaySplashView;
  const factory SplashStates.startNextScreen()=_StartNextScreen;
}