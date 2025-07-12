// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherMainImpl _$$WeatherMainImplFromJson(Map<String, dynamic> json) =>
    _$WeatherMainImpl(
      temp: (json['temp'] as num?)?.toDouble(),
      minimumTemp: (json['temp_min'] as num?)?.toInt(),
      maximumTep: (json['temp_max'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WeatherMainImplToJson(_$WeatherMainImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.minimumTemp,
      'temp_max': instance.maximumTep,
      'humidity': instance.humidity,
    };
