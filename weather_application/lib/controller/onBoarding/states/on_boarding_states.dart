import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_states.freezed.dart';

@freezed
class OnBoardingStates with _$OnBoardingStates{
  const factory OnBoardingStates.displayOnBoardView()=_DisplayOnBoardPageView;
  const factory OnBoardingStates.loading()=_DisplayLoading;
  const factory OnBoardingStates.userSignInResponse(bool isSuccess,String ?errorMessage,String? successMessage)=_UserSignInResponse;
}
