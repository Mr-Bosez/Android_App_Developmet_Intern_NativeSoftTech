// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) {
  return _WeatherMain.fromJson(json);
}

/// @nodoc
mixin _$WeatherMain {
  double? get temp => throw _privateConstructorUsedError;
  @JsonKey(name: "temp_min")
  int? get minimumTemp => throw _privateConstructorUsedError;
  @JsonKey(name: "temp_max")
  int? get maximumTep => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;

  /// Serializes this WeatherMain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherMain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherMainCopyWith<WeatherMain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherMainCopyWith<$Res> {
  factory $WeatherMainCopyWith(
    WeatherMain value,
    $Res Function(WeatherMain) then,
  ) = _$WeatherMainCopyWithImpl<$Res, WeatherMain>;
  @useResult
  $Res call({
    double? temp,
    @JsonKey(name: "temp_min") int? minimumTemp,
    @JsonKey(name: "temp_max") int? maximumTep,
    int? humidity,
  });
}

/// @nodoc
class _$WeatherMainCopyWithImpl<$Res, $Val extends WeatherMain>
    implements $WeatherMainCopyWith<$Res> {
  _$WeatherMainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherMain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? minimumTemp = freezed,
    Object? maximumTep = freezed,
    Object? humidity = freezed,
  }) {
    return _then(
      _value.copyWith(
            temp:
                freezed == temp
                    ? _value.temp
                    : temp // ignore: cast_nullable_to_non_nullable
                        as double?,
            minimumTemp:
                freezed == minimumTemp
                    ? _value.minimumTemp
                    : minimumTemp // ignore: cast_nullable_to_non_nullable
                        as int?,
            maximumTep:
                freezed == maximumTep
                    ? _value.maximumTep
                    : maximumTep // ignore: cast_nullable_to_non_nullable
                        as int?,
            humidity:
                freezed == humidity
                    ? _value.humidity
                    : humidity // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherMainImplCopyWith<$Res>
    implements $WeatherMainCopyWith<$Res> {
  factory _$$WeatherMainImplCopyWith(
    _$WeatherMainImpl value,
    $Res Function(_$WeatherMainImpl) then,
  ) = __$$WeatherMainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? temp,
    @JsonKey(name: "temp_min") int? minimumTemp,
    @JsonKey(name: "temp_max") int? maximumTep,
    int? humidity,
  });
}

/// @nodoc
class __$$WeatherMainImplCopyWithImpl<$Res>
    extends _$WeatherMainCopyWithImpl<$Res, _$WeatherMainImpl>
    implements _$$WeatherMainImplCopyWith<$Res> {
  __$$WeatherMainImplCopyWithImpl(
    _$WeatherMainImpl _value,
    $Res Function(_$WeatherMainImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherMain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? minimumTemp = freezed,
    Object? maximumTep = freezed,
    Object? humidity = freezed,
  }) {
    return _then(
      _$WeatherMainImpl(
        temp:
            freezed == temp
                ? _value.temp
                : temp // ignore: cast_nullable_to_non_nullable
                    as double?,
        minimumTemp:
            freezed == minimumTemp
                ? _value.minimumTemp
                : minimumTemp // ignore: cast_nullable_to_non_nullable
                    as int?,
        maximumTep:
            freezed == maximumTep
                ? _value.maximumTep
                : maximumTep // ignore: cast_nullable_to_non_nullable
                    as int?,
        humidity:
            freezed == humidity
                ? _value.humidity
                : humidity // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WeatherMainImpl implements _WeatherMain {
  const _$WeatherMainImpl({
    required this.temp,
    @JsonKey(name: "temp_min") required this.minimumTemp,
    @JsonKey(name: "temp_max") required this.maximumTep,
    required this.humidity,
  });

  factory _$WeatherMainImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherMainImplFromJson(json);

  @override
  final double? temp;
  @override
  @JsonKey(name: "temp_min")
  final int? minimumTemp;
  @override
  @JsonKey(name: "temp_max")
  final int? maximumTep;
  @override
  final int? humidity;

  @override
  String toString() {
    return 'WeatherMain(temp: $temp, minimumTemp: $minimumTemp, maximumTep: $maximumTep, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherMainImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.minimumTemp, minimumTemp) ||
                other.minimumTemp == minimumTemp) &&
            (identical(other.maximumTep, maximumTep) ||
                other.maximumTep == maximumTep) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temp, minimumTemp, maximumTep, humidity);

  /// Create a copy of WeatherMain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherMainImplCopyWith<_$WeatherMainImpl> get copyWith =>
      __$$WeatherMainImplCopyWithImpl<_$WeatherMainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherMainImplToJson(this);
  }
}

abstract class _WeatherMain implements WeatherMain {
  const factory _WeatherMain({
    required final double? temp,
    @JsonKey(name: "temp_min") required final int? minimumTemp,
    @JsonKey(name: "temp_max") required final int? maximumTep,
    required final int? humidity,
  }) = _$WeatherMainImpl;

  factory _WeatherMain.fromJson(Map<String, dynamic> json) =
      _$WeatherMainImpl.fromJson;

  @override
  double? get temp;
  @override
  @JsonKey(name: "temp_min")
  int? get minimumTemp;
  @override
  @JsonKey(name: "temp_max")
  int? get maximumTep;
  @override
  int? get humidity;

  /// Create a copy of WeatherMain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherMainImplCopyWith<_$WeatherMainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
