import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_application/controller/foreCast/states/forecast_screen_state.dart';
import 'package:weather_application/core/network/api_repository.dart';
import 'package:weather_application/core/permission/permission_utils.dart';
import 'package:weather_application/data/model/forecast_list_model.dart';
import 'package:weather_application/data/model/forecast_main_model.dart';
import 'package:weather_application/data/model/graph_point.dart';
import 'package:weather_application/utils/logger_utils.dart';

class ForecastCubit extends Cubit<ForecastScreenStates>{
  final _logger=LoggerUtils();
  final tag="ForecastCubit";
  final _apiRepository=ApiRepository();
  final _permissionUtils=PermissionUtils();
  final String?stateName;
  ForecastCubit(this.stateName):super(const ForecastScreenStates.loading()){

    if(stateName!=null && stateName!.isNotEmpty){
      fetchForecastOfState(stateName!);
    }
    else{
      fetchForecast();
    }
  }
  // lat=44.34&lon=10.99
  Future<void>fetchForecast()async{
    emit(ForecastScreenStates.loading());
    await _permissionUtils.askLocationPermission().then((LocationData ? locationData)async{
      if(locationData!=null){
        await _apiRepository.hitServerToFetchForecast(locationData.latitude?? 0.0,locationData.longitude??0.0).then((ForecastMainModel forecastMainModel){
          List<GraphPoint>pointsOnGraph=[];
          _logger.log(TAG: tag, message: "Forecast has been received");
          _logger.log(TAG: tag, message: "Latitude${locationData.latitude}");
          _logger.log(TAG: tag, message: "longitude${locationData.longitude}");

          for(int i=0;i<5;i++){
            ForecastListModel individualForeCastData=forecastMainModel.forecastList![i];
            double xPoint=(i+1).toDouble();
            double tempYPoint=individualForeCastData.weatherMain!.temp!;
            GraphPoint graphPoint=GraphPoint(x: xPoint, y: tempYPoint);
            pointsOnGraph.add(graphPoint);
          }
          emit(ForecastScreenStates.displayGraph(pointsOnGraph, forecastMainModel));
        }).onError((e,stackTrace){
          emit(ForecastScreenStates.error());
        });
      }
      else{
        emit(ForecastScreenStates.error());
      }

    });

  }




  Future<void>fetchForecastOfState(String stateName)async{
    emit(ForecastScreenStates.loading());
        await _apiRepository.hitServerToFetchForecastOfState(stateName).then((ForecastMainModel forecastMainModel){
          List<GraphPoint>pointsOnGraph=[];
          _logger.log(TAG: tag, message: "Forecast has been received");

          for(int i=0;i<5;i++){
            ForecastListModel individualForeCastData=forecastMainModel.forecastList![i];
            double xPoint=(i+1).toDouble();
            double tempYPoint=individualForeCastData.weatherMain!.temp!;
            GraphPoint graphPoint=GraphPoint(x: xPoint, y: tempYPoint);
            pointsOnGraph.add(graphPoint);
          }
          emit(ForecastScreenStates.displayGraph(pointsOnGraph, forecastMainModel));
        }).onError((e,stackTrace){
          emit(ForecastScreenStates.error());
        });




  }
}