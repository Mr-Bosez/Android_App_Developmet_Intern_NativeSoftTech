// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get placeName => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get countryName => throw _privateConstructorUsedError;
  int? get population => throw _privateConstructorUsedError;
  int? get timezone => throw _privateConstructorUsedError;
  int? get sunrise => throw _privateConstructorUsedError;
  int? get sunset => throw _privateConstructorUsedError;

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res, CityModel>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: "name") String? placeName,
    @JsonKey(name: "country") String? countryName,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  });
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res, $Val extends CityModel>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? placeName = freezed,
    Object? countryName = freezed,
    Object? population = freezed,
    Object? timezone = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            placeName:
                freezed == placeName
                    ? _value.placeName
                    : placeName // ignore: cast_nullable_to_non_nullable
                        as String?,
            countryName:
                freezed == countryName
                    ? _value.countryName
                    : countryName // ignore: cast_nullable_to_non_nullable
                        as String?,
            population:
                freezed == population
                    ? _value.population
                    : population // ignore: cast_nullable_to_non_nullable
                        as int?,
            timezone:
                freezed == timezone
                    ? _value.timezone
                    : timezone // ignore: cast_nullable_to_non_nullable
                        as int?,
            sunrise:
                freezed == sunrise
                    ? _value.sunrise
                    : sunrise // ignore: cast_nullable_to_non_nullable
                        as int?,
            sunset:
                freezed == sunset
                    ? _value.sunset
                    : sunset // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CityModelImplCopyWith<$Res>
    implements $CityModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
    _$CityModelImpl value,
    $Res Function(_$CityModelImpl) then,
  ) = __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: "name") String? placeName,
    @JsonKey(name: "country") String? countryName,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  });
}

/// @nodoc
class __$$CityModelImplCopyWithImpl<$Res>
    extends _$CityModelCopyWithImpl<$Res, _$CityModelImpl>
    implements _$$CityModelImplCopyWith<$Res> {
  __$$CityModelImplCopyWithImpl(
    _$CityModelImpl _value,
    $Res Function(_$CityModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? placeName = freezed,
    Object? countryName = freezed,
    Object? population = freezed,
    Object? timezone = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
  }) {
    return _then(
      _$CityModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        placeName:
            freezed == placeName
                ? _value.placeName
                : placeName // ignore: cast_nullable_to_non_nullable
                    as String?,
        countryName:
            freezed == countryName
                ? _value.countryName
                : countryName // ignore: cast_nullable_to_non_nullable
                    as String?,
        population:
            freezed == population
                ? _value.population
                : population // ignore: cast_nullable_to_non_nullable
                    as int?,
        timezone:
            freezed == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                    as int?,
        sunrise:
            freezed == sunrise
                ? _value.sunrise
                : sunrise // ignore: cast_nullable_to_non_nullable
                    as int?,
        sunset:
            freezed == sunset
                ? _value.sunset
                : sunset // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CityModelImpl implements _CityModel {
  const _$CityModelImpl({
    required this.id,
    @JsonKey(name: "name") required this.placeName,
    @JsonKey(name: "country") required this.countryName,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? placeName;
  @override
  @JsonKey(name: "country")
  final String? countryName;
  @override
  final int? population;
  @override
  final int? timezone;
  @override
  final int? sunrise;
  @override
  final int? sunset;

  @override
  String toString() {
    return 'CityModel(id: $id, placeName: $placeName, countryName: $countryName, population: $population, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.population, population) ||
                other.population == population) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    placeName,
    countryName,
    population,
    timezone,
    sunrise,
    sunset,
  );

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      __$$CityModelImplCopyWithImpl<_$CityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityModelImplToJson(this);
  }
}

abstract class _CityModel implements CityModel {
  const factory _CityModel({
    required final int? id,
    @JsonKey(name: "name") required final String? placeName,
    @JsonKey(name: "country") required final String? countryName,
    required final int? population,
    required final int? timezone,
    required final int? sunrise,
    required final int? sunset,
  }) = _$CityModelImpl;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get placeName;
  @override
  @JsonKey(name: "country")
  String? get countryName;
  @override
  int? get population;
  @override
  int? get timezone;
  @override
  int? get sunrise;
  @override
  int? get sunset;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
