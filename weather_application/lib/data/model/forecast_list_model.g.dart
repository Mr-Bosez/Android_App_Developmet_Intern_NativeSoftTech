// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastListModelImpl _$$ForecastListModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForecastListModelImpl(
  unixTimeStamp: (json['dt'] as num?)?.toInt(),
  weatherMain:
      json['main'] == null
          ? null
          : WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
  weatherModelList:
      (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  visibility: (json['visibility'] as num?)?.toInt(),
  pop: (json['pop'] as num?)?.toInt(),
  currentTimestamp: json['dt_txt'] as String?,
);

Map<String, dynamic> _$$ForecastListModelImplToJson(
  _$ForecastListModelImpl instance,
) => <String, dynamic>{
  'dt': instance.unixTimeStamp,
  'main': instance.weatherMain?.toJson(),
  'weather': instance.weatherModelList?.map((e) => e.toJson()).toList(),
  'visibility': instance.visibility,
  'pop': instance.pop,
  'dt_txt': instance.currentTimestamp,
};
