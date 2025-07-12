import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weatherModel.freezed.dart';
part 'weatherModel.g.dart';

@freezed
class WeatherModel with _$WeatherModel{
  @JsonSerializable(explicitToJson:true)
  const factory WeatherModel({
    required int ? id,
    @JsonKey(name: "main")
    required String?weatherType,
    required String ?description,
    required String ? icon,

})=_WeatherModel;
  factory WeatherModel.fromJson(Map<String,dynamic>json)=>_$WeatherModelFromJson(json);
}