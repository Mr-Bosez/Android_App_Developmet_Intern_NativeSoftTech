//4

import 'package:dio/dio.dart';
import 'package:weather_application/core/network/app_interceptor.dart';
import 'package:weather_application/utils/logger_utils.dart';

class DioUtils {
  static final DioUtils _instance=DioUtils._init();
  static DioUtils get instance=>_instance;
  DioUtils._init(); // Singleton

  static Dio ? coreDio=DioUtils.initDio();
  static Dio ? coreDioForecast=DioUtils.createOpenWeatherDioInstance();

  // static Dio? _coreDio;
  // static Dio? _coreDioForecast;
  //
  // static Dio? get coreDio => _coreDio ??= initDio();
  // static Dio? get coreDioForecast => _coreDioForecast ??= createOpenWeatherDioInstance();


  static Dio? initDio(){
    final _logger=LoggerUtils();
    final _TAG='DioUtils';
    final baseOptions=BaseOptions(
      baseUrl: 'https://api.airvisual.com/v2/',
    );

    final logInterceptor=LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: (object){
        _logger.log(TAG: _TAG, message: object.toString());
      }
    );

    coreDio=Dio(baseOptions)..interceptors.addAll([
      AppInterceptor(),
      logInterceptor,
    ]);
    return coreDio;
  }



  static Dio? createOpenWeatherDioInstance(){
    final _logger=LoggerUtils();
    final _TAG="DioUtils";
    coreDioForecast=Dio();
    final baseOptions=BaseOptions(
      baseUrl: "http://api.openweathermap.org/"
    );

    final logInterceptor=LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: (obj){
        _logger.log(TAG: _TAG, message: obj.toString());
      }

    );
    coreDioForecast=Dio(baseOptions)..interceptors.addAll([
      AppInterceptor(),
      logInterceptor,
    ]);
    return coreDioForecast;

  }

}