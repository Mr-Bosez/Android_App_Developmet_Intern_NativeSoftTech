import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_main.freezed.dart';
part 'weather_main.g.dart';

@freezed
class WeatherMain with _$WeatherMain{
  @JsonSerializable(explicitToJson: true)
  const factory WeatherMain({
    required double? temp,
    @JsonKey(name: "temp_min")
    required int ? minimumTemp,
    @JsonKey(name: "temp_max")
    required int ? maximumTep,
    required int ?humidity
})=_WeatherMain;
  factory WeatherMain.fromJson(Map<String,dynamic>json)=>_$WeatherMainFromJson(json);
}