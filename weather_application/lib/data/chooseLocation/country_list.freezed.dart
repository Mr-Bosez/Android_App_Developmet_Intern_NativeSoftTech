// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CountryList _$CountryListFromJson(Map<String, dynamic> json) {
  return _CountryList.fromJson(json);
}

/// @nodoc
mixin _$CountryList {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<CountryData>? get countryData => throw _privateConstructorUsedError;

  /// Serializes this CountryList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CountryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryListCopyWith<CountryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryListCopyWith<$Res> {
  factory $CountryListCopyWith(
    CountryList value,
    $Res Function(CountryList) then,
  ) = _$CountryListCopyWithImpl<$Res, CountryList>;
  @useResult
  $Res call({
    String? status,
    @JsonKey(name: "data") List<CountryData>? countryData,
  });
}

/// @nodoc
class _$CountryListCopyWithImpl<$Res, $Val extends CountryList>
    implements $CountryListCopyWith<$Res> {
  _$CountryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed, Object? countryData = freezed}) {
    return _then(
      _value.copyWith(
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            countryData:
                freezed == countryData
                    ? _value.countryData
                    : countryData // ignore: cast_nullable_to_non_nullable
                        as List<CountryData>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CountryListImplCopyWith<$Res>
    implements $CountryListCopyWith<$Res> {
  factory _$$CountryListImplCopyWith(
    _$CountryListImpl value,
    $Res Function(_$CountryListImpl) then,
  ) = __$$CountryListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? status,
    @JsonKey(name: "data") List<CountryData>? countryData,
  });
}

/// @nodoc
class __$$CountryListImplCopyWithImpl<$Res>
    extends _$CountryListCopyWithImpl<$Res, _$CountryListImpl>
    implements _$$CountryListImplCopyWith<$Res> {
  __$$CountryListImplCopyWithImpl(
    _$CountryListImpl _value,
    $Res Function(_$CountryListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CountryList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed, Object? countryData = freezed}) {
    return _then(
      _$CountryListImpl(
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        countryData:
            freezed == countryData
                ? _value._countryData
                : countryData // ignore: cast_nullable_to_non_nullable
                    as List<CountryData>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CountryListImpl implements _CountryList {
  const _$CountryListImpl({
    required this.status,
    @JsonKey(name: "data") required final List<CountryData>? countryData,
  }) : _countryData = countryData;

  factory _$CountryListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryListImplFromJson(json);

  @override
  final String? status;
  final List<CountryData>? _countryData;
  @override
  @JsonKey(name: "data")
  List<CountryData>? get countryData {
    final value = _countryData;
    if (value == null) return null;
    if (_countryData is EqualUnmodifiableListView) return _countryData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CountryList(status: $status, countryData: $countryData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryListImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._countryData,
              _countryData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_countryData),
  );

  /// Create a copy of CountryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryListImplCopyWith<_$CountryListImpl> get copyWith =>
      __$$CountryListImplCopyWithImpl<_$CountryListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryListImplToJson(this);
  }
}

abstract class _CountryList implements CountryList {
  const factory _CountryList({
    required final String? status,
    @JsonKey(name: "data") required final List<CountryData>? countryData,
  }) = _$CountryListImpl;

  factory _CountryList.fromJson(Map<String, dynamic> json) =
      _$CountryListImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: "data")
  List<CountryData>? get countryData;

  /// Create a copy of CountryList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryListImplCopyWith<_$CountryListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
