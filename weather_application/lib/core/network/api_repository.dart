//5

import 'package:weather_application/core/app_constants/app_constants.dart';
import 'package:weather_application/core/network/dio_utils.dart';
import 'package:weather_application/data/chooseLocation/country_list.dart';
import 'package:weather_application/data/chooseLocation/state_list.dart';
import 'package:weather_application/data/model/forecast_main_model.dart';
import 'package:weather_application/utils/logger_utils.dart';

import 'custom_network_exception.dart';

class ApiRepository{
  final _logger=LoggerUtils();
  final _tag='ApiRepository';
  Future<CountryList> hitServerToFetchCountries() async{
    try{
      final apiResponse=await DioUtils.initDio()?.get('countries?key=${ApplicationConstants.apiKey}');
      _logger.log(TAG: _tag, message: 'Status code : ${apiResponse?.statusCode}');
      CountryList countryList=CountryList.fromJson(apiResponse?.data);
      // _logger.log(TAG: _tag, message: 'Status  : $countryList');
      return Future.value(countryList);


    }
    catch(exception){
      var networkException=exception as CustomNetworkException;
      _logger.log(TAG: _tag, message: networkException.errorMessage ?? '');
      return Future.error(networkException);
    }
    


  }


  Future<StateList> hitServerToFetchStates(String countyName) async{
    try{
      final apiResponse=await DioUtils.initDio()?.get('states?country=$countyName&key=${ApplicationConstants.apiKey}');
      _logger.log(TAG: _tag, message: 'Status code : ${apiResponse?.statusCode}');
      StateList stateList=StateList.fromJson(apiResponse?.data);
      return Future.value(stateList);



    }
    catch(exception){
      var networkException=exception as CustomNetworkException;
      _logger.log(TAG: _tag, message: networkException.errorMessage ?? '');
      return Future.error(networkException);
    }



  }


  Future<ForecastMainModel> hitServerToFetchForecast(double latitude,double longitude) async{
    try{
      final apiResponse=await DioUtils.createOpenWeatherDioInstance()?.get("data/2.5/forecast?lat=$latitude&lon=$longitude&appid=${ApplicationConstants.kWeatherForecastAPI}");
      _logger.log(TAG: _tag, message: 'Status code : ${apiResponse?.statusCode}');
      ForecastMainModel forecastMainModel=ForecastMainModel.fromJson(apiResponse?.data);
      return Future.value(forecastMainModel);



    }
    catch(exception){
      var networkException=exception as CustomNetworkException;
      _logger.log(TAG: _tag, message: networkException.errorMessage ?? '');
      return Future.error(networkException);
    }



  }
  
  Future<ForecastMainModel>hitServerToFetchForecastOfState(String stateName)async{
    try{
      final apiResponse=await DioUtils.createOpenWeatherDioInstance()?.get("data/2.5/forecast?q=$stateName&appid=${ApplicationConstants.kWeatherForecastAPI}");
      _logger.log(TAG: _tag, message: 'Status code : ${apiResponse?.statusCode}');
      ForecastMainModel forecastMainModel=ForecastMainModel.fromJson(apiResponse?.data);
      return Future.value(forecastMainModel);
      
    }
    catch(exception){
      var networkException=exception as CustomNetworkException;
      _logger.log(TAG: _tag, message: networkException.errorMessage?? '');
      return Future.error(networkException);
    }
  }
  
}