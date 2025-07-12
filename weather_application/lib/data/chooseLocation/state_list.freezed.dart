// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StateList _$StateListFromJson(Map<String, dynamic> json) {
  return _StateList.fromJson(json);
}

/// @nodoc
mixin _$StateList {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<StateData>? get stateData => throw _privateConstructorUsedError;

  /// Serializes this StateList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StateList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StateListCopyWith<StateList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateListCopyWith<$Res> {
  factory $StateListCopyWith(StateList value, $Res Function(StateList) then) =
      _$StateListCopyWithImpl<$Res, StateList>;
  @useResult
  $Res call({
    String? status,
    @JsonKey(name: "data") List<StateData>? stateData,
  });
}

/// @nodoc
class _$StateListCopyWithImpl<$Res, $Val extends StateList>
    implements $StateListCopyWith<$Res> {
  _$StateListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StateList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed, Object? stateData = freezed}) {
    return _then(
      _value.copyWith(
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            stateData:
                freezed == stateData
                    ? _value.stateData
                    : stateData // ignore: cast_nullable_to_non_nullable
                        as List<StateData>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StateListImplCopyWith<$Res>
    implements $StateListCopyWith<$Res> {
  factory _$$StateListImplCopyWith(
    _$StateListImpl value,
    $Res Function(_$StateListImpl) then,
  ) = __$$StateListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? status,
    @JsonKey(name: "data") List<StateData>? stateData,
  });
}

/// @nodoc
class __$$StateListImplCopyWithImpl<$Res>
    extends _$StateListCopyWithImpl<$Res, _$StateListImpl>
    implements _$$StateListImplCopyWith<$Res> {
  __$$StateListImplCopyWithImpl(
    _$StateListImpl _value,
    $Res Function(_$StateListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StateList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed, Object? stateData = freezed}) {
    return _then(
      _$StateListImpl(
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        stateData:
            freezed == stateData
                ? _value._stateData
                : stateData // ignore: cast_nullable_to_non_nullable
                    as List<StateData>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StateListImpl implements _StateList {
  const _$StateListImpl({
    required this.status,
    @JsonKey(name: "data") required final List<StateData>? stateData,
  }) : _stateData = stateData;

  factory _$StateListImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateListImplFromJson(json);

  @override
  final String? status;
  final List<StateData>? _stateData;
  @override
  @JsonKey(name: "data")
  List<StateData>? get stateData {
    final value = _stateData;
    if (value == null) return null;
    if (_stateData is EqualUnmodifiableListView) return _stateData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StateList(status: $status, stateData: $stateData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateListImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._stateData,
              _stateData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_stateData),
  );

  /// Create a copy of StateList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateListImplCopyWith<_$StateListImpl> get copyWith =>
      __$$StateListImplCopyWithImpl<_$StateListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateListImplToJson(this);
  }
}

abstract class _StateList implements StateList {
  const factory _StateList({
    required final String? status,
    @JsonKey(name: "data") required final List<StateData>? stateData,
  }) = _$StateListImpl;

  factory _StateList.fromJson(Map<String, dynamic> json) =
      _$StateListImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: "data")
  List<StateData>? get stateData;

  /// Create a copy of StateList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateListImplCopyWith<_$StateListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
