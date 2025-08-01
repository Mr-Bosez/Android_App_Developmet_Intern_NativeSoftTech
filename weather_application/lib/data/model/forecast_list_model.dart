import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_application/data/model/weatherModel.dart';
import 'package:weather_application/data/model/weather_main.dart';

part 'forecast_list_model.freezed.dart';
part 'forecast_list_model.g.dart';

@freezed
class ForecastListModel with _$ForecastListModel{
  @JsonSerializable(explicitToJson:true)
  const factory ForecastListModel({
    @JsonKey(name: "dt")
    required int ?unixTimeStamp,
    @JsonKey(name: "main")
    required WeatherMain? weatherMain,
    @JsonKey(name: "weather")
    required List<WeatherModel>? weatherModelList,
    required int? visibility,
    required int? pop,
    @JsonKey(name: "dt_txt")
    required String? currentTimestamp,


})=_ForecastListModel;
  factory ForecastListModel.fromJson(Map<String,dynamic>json)=>_$ForecastListModelFromJson(json);
}