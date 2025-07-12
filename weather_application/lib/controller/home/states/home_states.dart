import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_application/data/chooseLocation/country_list.dart';
import 'package:weather_application/data/chooseLocation/state_list.dart';

part 'home_states.freezed.dart';
@freezed
class HomeStates with _$HomeStates{
  const factory  HomeStates.loading()=_Loading;
  const factory HomeStates.displayCountries(CountryList countryList)=_DisplayCountries;
  const factory HomeStates.displayStates(StateList stateList)=_DisplayStates;
  const factory HomeStates.startNextScreen()=_StartNextScreen;
  const factory HomeStates.errorMessage(String? message)=_ErrorMessage;

}