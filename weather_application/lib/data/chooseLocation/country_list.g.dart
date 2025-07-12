// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryListImpl _$$CountryListImplFromJson(Map<String, dynamic> json) =>
    _$CountryListImpl(
      status: json['status'] as String?,
      countryData:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CountryData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$CountryListImplToJson(_$CountryListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.countryData?.map((e) => e.toJson()).toList(),
    };
