import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_application/data/model/forecast_list_model.dart';

import 'city_model.dart';

part 'forecast_main_model.freezed.dart';
part 'forecast_main_model.g.dart';

@freezed
class ForecastMainModel with _$ForecastMainModel{
  @JsonSerializable(explicitToJson:true)
  const factory ForecastMainModel({
    required String?cod,
    required int ?message,
    required int ?cnt,
    @JsonKey(name: "list")
    required List<ForecastListModel> ? forecastList,
    @JsonKey(name: "city")
    required CityModel? city,

})=_ForecastMainModel;
  factory ForecastMainModel.fromJson(Map<String,dynamic>json)=>_$ForecastMainModelFromJson(json);
}