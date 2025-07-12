import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/controller/home/states/home_states.dart';
import 'package:weather_application/core/app_constants/app_constants.dart';
import 'package:weather_application/core/network/api_repository.dart';
import 'package:weather_application/core/network/custom_network_exception.dart';
import 'package:weather_application/data/chooseLocation/state_list.dart';

import '../../data/chooseLocation/country_list.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(const HomeStates.loading()){
    _getCountries();
  }
  final _apiRepository=ApiRepository();



  Future<void>_getCountries() async{
    await _apiRepository.hitServerToFetchCountries().then((CountryList countryList){
      emit(HomeStates.displayCountries(countryList));
    }).onError((error,stackTrace){
      if(error is CustomNetworkException){
        CustomNetworkException customNetworkException=error;
        emit(HomeStates.errorMessage(customNetworkException.errorMessage));
      }
      else{
        emit(HomeStates.errorMessage(ApplicationConstants.k404Message));
      }

    });
  }

  Future<void>getCountriesAgain()async {
    _getCountries();
  }

  Future<void>getStates(String countryName) async{
    emit(HomeStates.loading());
    await _apiRepository.hitServerToFetchStates(countryName).then((StateList stateList){
      emit(HomeStates.displayStates(stateList));
    }).onError((error,stackTrace){
      if(error is CustomNetworkException){
        CustomNetworkException customNetworkException=error;
        emit(HomeStates.errorMessage(customNetworkException.errorMessage));
      }
      else{
        emit(HomeStates.errorMessage(ApplicationConstants.k404Message));
      }
    });
  }

}