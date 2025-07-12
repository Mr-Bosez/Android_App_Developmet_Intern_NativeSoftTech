// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_main_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForecastMainModel _$ForecastMainModelFromJson(Map<String, dynamic> json) {
  return _ForecastMainModel.fromJson(json);
}

/// @nodoc
mixin _$ForecastMainModel {
  String? get cod => throw _privateConstructorUsedError;
  int? get message => throw _privateConstructorUsedError;
  int? get cnt => throw _privateConstructorUsedError;
  @JsonKey(name: "list")
  List<ForecastListModel>? get forecastList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  CityModel? get city => throw _privateConstructorUsedError;

  /// Serializes this ForecastMainModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForecastMainModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastMainModelCopyWith<ForecastMainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastMainModelCopyWith<$Res> {
  factory $ForecastMainModelCopyWith(
    ForecastMainModel value,
    $Res Function(ForecastMainModel) then,
  ) = _$ForecastMainModelCopyWithImpl<$Res, ForecastMainModel>;
  @useResult
  $Res call({
    String? cod,
    int? message,
    int? cnt,
    @JsonKey(name: "list") List<ForecastListModel>? forecastList,
    @JsonKey(name: "city") CityModel? city,
  });

  $CityModelCopyWith<$Res>? get city;
}

/// @nodoc
class _$ForecastMainModelCopyWithImpl<$Res, $Val extends ForecastMainModel>
    implements $ForecastMainModelCopyWith<$Res> {
  _$ForecastMainModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastMainModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? message = freezed,
    Object? cnt = freezed,
    Object? forecastList = freezed,
    Object? city = freezed,
  }) {
    return _then(
      _value.copyWith(
            cod:
                freezed == cod
                    ? _value.cod
                    : cod // ignore: cast_nullable_to_non_nullable
                        as String?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as int?,
            cnt:
                freezed == cnt
                    ? _value.cnt
                    : cnt // ignore: cast_nullable_to_non_nullable
                        as int?,
            forecastList:
                freezed == forecastList
                    ? _value.forecastList
                    : forecastList // ignore: cast_nullable_to_non_nullable
                        as List<ForecastListModel>?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as CityModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ForecastMainModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityModelCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityModelCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastMainModelImplCopyWith<$Res>
    implements $ForecastMainModelCopyWith<$Res> {
  factory _$$ForecastMainModelImplCopyWith(
    _$ForecastMainModelImpl value,
    $Res Function(_$ForecastMainModelImpl) then,
  ) = __$$ForecastMainModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? cod,
    int? message,
    int? cnt,
    @JsonKey(name: "list") List<ForecastListModel>? forecastList,
    @JsonKey(name: "city") CityModel? city,
  });

  @override
  $CityModelCopyWith<$Res>? get city;
}

/// @nodoc
class __$$ForecastMainModelImplCopyWithImpl<$Res>
    extends _$ForecastMainModelCopyWithImpl<$Res, _$ForecastMainModelImpl>
    implements _$$ForecastMainModelImplCopyWith<$Res> {
  __$$ForecastMainModelImplCopyWithImpl(
    _$ForecastMainModelImpl _value,
    $Res Function(_$ForecastMainModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForecastMainModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? message = freezed,
    Object? cnt = freezed,
    Object? forecastList = freezed,
    Object? city = freezed,
  }) {
    return _then(
      _$ForecastMainModelImpl(
        cod:
            freezed == cod
                ? _value.cod
                : cod // ignore: cast_nullable_to_non_nullable
                    as String?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as int?,
        cnt:
            freezed == cnt
                ? _value.cnt
                : cnt // ignore: cast_nullable_to_non_nullable
                    as int?,
        forecastList:
            freezed == forecastList
                ? _value._forecastList
                : forecastList // ignore: cast_nullable_to_non_nullable
                    as List<ForecastListModel>?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as CityModel?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ForecastMainModelImpl implements _ForecastMainModel {
  const _$ForecastMainModelImpl({
    required this.cod,
    required this.message,
    required this.cnt,
    @JsonKey(name: "list") required final List<ForecastListModel>? forecastList,
    @JsonKey(name: "city") required this.city,
  }) : _forecastList = forecastList;

  factory _$ForecastMainModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastMainModelImplFromJson(json);

  @override
  final String? cod;
  @override
  final int? message;
  @override
  final int? cnt;
  final List<ForecastListModel>? _forecastList;
  @override
  @JsonKey(name: "list")
  List<ForecastListModel>? get forecastList {
    final value = _forecastList;
    if (value == null) return null;
    if (_forecastList is EqualUnmodifiableListView) return _forecastList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "city")
  final CityModel? city;

  @override
  String toString() {
    return 'ForecastMainModel(cod: $cod, message: $message, cnt: $cnt, forecastList: $forecastList, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastMainModelImpl &&
            (identical(other.cod, cod) || other.cod == cod) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cnt, cnt) || other.cnt == cnt) &&
            const DeepCollectionEquality().equals(
              other._forecastList,
              _forecastList,
            ) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cod,
    message,
    cnt,
    const DeepCollectionEquality().hash(_forecastList),
    city,
  );

  /// Create a copy of ForecastMainModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastMainModelImplCopyWith<_$ForecastMainModelImpl> get copyWith =>
      __$$ForecastMainModelImplCopyWithImpl<_$ForecastMainModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastMainModelImplToJson(this);
  }
}

abstract class _ForecastMainModel implements ForecastMainModel {
  const factory _ForecastMainModel({
    required final String? cod,
    required final int? message,
    required final int? cnt,
    @JsonKey(name: "list") required final List<ForecastListModel>? forecastList,
    @JsonKey(name: "city") required final CityModel? city,
  }) = _$ForecastMainModelImpl;

  factory _ForecastMainModel.fromJson(Map<String, dynamic> json) =
      _$ForecastMainModelImpl.fromJson;

  @override
  String? get cod;
  @override
  int? get message;
  @override
  int? get cnt;
  @override
  @JsonKey(name: "list")
  List<ForecastListModel>? get forecastList;
  @override
  @JsonKey(name: "city")
  CityModel? get city;

  /// Create a copy of ForecastMainModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastMainModelImplCopyWith<_$ForecastMainModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
