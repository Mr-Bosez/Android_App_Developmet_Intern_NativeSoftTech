// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastMainModelImpl _$$ForecastMainModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForecastMainModelImpl(
  cod: json['cod'] as String?,
  message: (json['message'] as num?)?.toInt(),
  cnt: (json['cnt'] as num?)?.toInt(),
  forecastList:
      (json['list'] as List<dynamic>?)
          ?.map((e) => ForecastListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  city:
      json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ForecastMainModelImplToJson(
  _$ForecastMainModelImpl instance,
) => <String, dynamic>{
  'cod': instance.cod,
  'message': instance.message,
  'cnt': instance.cnt,
  'list': instance.forecastList?.map((e) => e.toJson()).toList(),
  'city': instance.city?.toJson(),
};
