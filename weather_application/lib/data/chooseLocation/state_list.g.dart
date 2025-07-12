// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StateListImpl _$$StateListImplFromJson(Map<String, dynamic> json) =>
    _$StateListImpl(
      status: json['status'] as String?,
      stateData:
          (json['data'] as List<dynamic>?)
              ?.map((e) => StateData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$StateListImplToJson(_$StateListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.stateData?.map((e) => e.toJson()).toList(),
    };
