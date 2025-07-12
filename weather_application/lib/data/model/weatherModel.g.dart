// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      id: (json['id'] as num?)?.toInt(),
      weatherType: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.weatherType,
      'description': instance.description,
      'icon': instance.icon,
    };
