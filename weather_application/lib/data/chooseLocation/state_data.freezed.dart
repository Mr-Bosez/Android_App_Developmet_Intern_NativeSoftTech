// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StateData _$StateDataFromJson(Map<String, dynamic> json) {
  return _StateData.fromJson(json);
}

/// @nodoc
mixin _$StateData {
  @JsonKey(name: "state")
  String? get stateName => throw _privateConstructorUsedError;

  /// Serializes this StateData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StateDataCopyWith<StateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateDataCopyWith<$Res> {
  factory $StateDataCopyWith(StateData value, $Res Function(StateData) then) =
      _$StateDataCopyWithImpl<$Res, StateData>;
  @useResult
  $Res call({@JsonKey(name: "state") String? stateName});
}

/// @nodoc
class _$StateDataCopyWithImpl<$Res, $Val extends StateData>
    implements $StateDataCopyWith<$Res> {
  _$StateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stateName = freezed}) {
    return _then(
      _value.copyWith(
            stateName:
                freezed == stateName
                    ? _value.stateName
                    : stateName // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StateDataImplCopyWith<$Res>
    implements $StateDataCopyWith<$Res> {
  factory _$$StateDataImplCopyWith(
    _$StateDataImpl value,
    $Res Function(_$StateDataImpl) then,
  ) = __$$StateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "state") String? stateName});
}

/// @nodoc
class __$$StateDataImplCopyWithImpl<$Res>
    extends _$StateDataCopyWithImpl<$Res, _$StateDataImpl>
    implements _$$StateDataImplCopyWith<$Res> {
  __$$StateDataImplCopyWithImpl(
    _$StateDataImpl _value,
    $Res Function(_$StateDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stateName = freezed}) {
    return _then(
      _$StateDataImpl(
        stateName:
            freezed == stateName
                ? _value.stateName
                : stateName // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StateDataImpl implements _StateData {
  const _$StateDataImpl({@JsonKey(name: "state") required this.stateName});

  factory _$StateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateDataImplFromJson(json);

  @override
  @JsonKey(name: "state")
  final String? stateName;

  @override
  String toString() {
    return 'StateData(stateName: $stateName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateDataImpl &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stateName);

  /// Create a copy of StateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateDataImplCopyWith<_$StateDataImpl> get copyWith =>
      __$$StateDataImplCopyWithImpl<_$StateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateDataImplToJson(this);
  }
}

abstract class _StateData implements StateData {
  const factory _StateData({
    @JsonKey(name: "state") required final String? stateName,
  }) = _$StateDataImpl;

  factory _StateData.fromJson(Map<String, dynamic> json) =
      _$StateDataImpl.fromJson;

  @override
  @JsonKey(name: "state")
  String? get stateName;

  /// Create a copy of StateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateDataImplCopyWith<_$StateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
