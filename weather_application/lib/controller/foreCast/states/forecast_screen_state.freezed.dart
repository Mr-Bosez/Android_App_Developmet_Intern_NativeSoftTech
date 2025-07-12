// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ForecastScreenStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )
    displayGraph,
    required TResult Function() loading,
    required TResult Function() error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayGraph value) displayGraph,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayGraph value)? displayGraph,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayGraph value)? displayGraph,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastScreenStatesCopyWith<$Res> {
  factory $ForecastScreenStatesCopyWith(
    ForecastScreenStates value,
    $Res Function(ForecastScreenStates) then,
  ) = _$ForecastScreenStatesCopyWithImpl<$Res, ForecastScreenStates>;
}

/// @nodoc
class _$ForecastScreenStatesCopyWithImpl<
  $Res,
  $Val extends ForecastScreenStates
>
    implements $ForecastScreenStatesCopyWith<$Res> {
  _$ForecastScreenStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastScreenStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DisplayGraphImplCopyWith<$Res> {
  factory _$$DisplayGraphImplCopyWith(
    _$DisplayGraphImpl value,
    $Res Function(_$DisplayGraphImpl) then,
  ) = __$$DisplayGraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GraphPoint> points, ForecastMainModel forecastMainModel});

  $ForecastMainModelCopyWith<$Res> get forecastMainModel;
}

/// @nodoc
class __$$DisplayGraphImplCopyWithImpl<$Res>
    extends _$ForecastScreenStatesCopyWithImpl<$Res, _$DisplayGraphImpl>
    implements _$$DisplayGraphImplCopyWith<$Res> {
  __$$DisplayGraphImplCopyWithImpl(
    _$DisplayGraphImpl _value,
    $Res Function(_$DisplayGraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForecastScreenStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? points = null, Object? forecastMainModel = null}) {
    return _then(
      _$DisplayGraphImpl(
        null == points
            ? _value._points
            : points // ignore: cast_nullable_to_non_nullable
                as List<GraphPoint>,
        null == forecastMainModel
            ? _value.forecastMainModel
            : forecastMainModel // ignore: cast_nullable_to_non_nullable
                as ForecastMainModel,
      ),
    );
  }

  /// Create a copy of ForecastScreenStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForecastMainModelCopyWith<$Res> get forecastMainModel {
    return $ForecastMainModelCopyWith<$Res>(_value.forecastMainModel, (value) {
      return _then(_value.copyWith(forecastMainModel: value));
    });
  }
}

/// @nodoc

class _$DisplayGraphImpl implements _DisplayGraph {
  const _$DisplayGraphImpl(
    final List<GraphPoint> points,
    this.forecastMainModel,
  ) : _points = points;

  final List<GraphPoint> _points;
  @override
  List<GraphPoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final ForecastMainModel forecastMainModel;

  @override
  String toString() {
    return 'ForecastScreenStates.displayGraph(points: $points, forecastMainModel: $forecastMainModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayGraphImpl &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.forecastMainModel, forecastMainModel) ||
                other.forecastMainModel == forecastMainModel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_points),
    forecastMainModel,
  );

  /// Create a copy of ForecastScreenStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayGraphImplCopyWith<_$DisplayGraphImpl> get copyWith =>
      __$$DisplayGraphImplCopyWithImpl<_$DisplayGraphImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )
    displayGraph,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return displayGraph(points, forecastMainModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return displayGraph?.call(points, forecastMainModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (displayGraph != null) {
      return displayGraph(points, forecastMainModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayGraph value) displayGraph,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return displayGraph(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayGraph value)? displayGraph,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return displayGraph?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayGraph value)? displayGraph,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (displayGraph != null) {
      return displayGraph(this);
    }
    return orElse();
  }
}

abstract class _DisplayGraph implements ForecastScreenStates {
  const factory _DisplayGraph(
    final List<GraphPoint> points,
    final ForecastMainModel forecastMainModel,
  ) = _$DisplayGraphImpl;

  List<GraphPoint> get points;
  ForecastMainModel get forecastMainModel;

  /// Create a copy of ForecastScreenStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayGraphImplCopyWith<_$DisplayGraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ForecastScreenStatesCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForecastScreenStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ForecastScreenStates.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )
    displayGraph,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayGraph value) displayGraph,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayGraph value)? displayGraph,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayGraph value)? displayGraph,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ForecastScreenStates {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ForecastScreenStatesCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForecastScreenStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'ForecastScreenStates.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )
    displayGraph,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      List<GraphPoint> points,
      ForecastMainModel forecastMainModel,
    )?
    displayGraph,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayGraph value) displayGraph,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayGraph value)? displayGraph,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayGraph value)? displayGraph,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ForecastScreenStates {
  const factory _Error() = _$ErrorImpl;
}
