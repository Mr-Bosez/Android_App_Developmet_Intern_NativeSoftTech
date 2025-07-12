// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CountryList countryList) displayCountries,
    required TResult Function(StateList stateList) displayStates,
    required TResult Function() startNextScreen,
    required TResult Function(String? message) errorMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CountryList countryList)? displayCountries,
    TResult? Function(StateList stateList)? displayStates,
    TResult? Function()? startNextScreen,
    TResult? Function(String? message)? errorMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CountryList countryList)? displayCountries,
    TResult Function(StateList stateList)? displayStates,
    TResult Function()? startNextScreen,
    TResult Function(String? message)? errorMessage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_DisplayCountries value) displayCountries,
    required TResult Function(_DisplayStates value) displayStates,
    required TResult Function(_StartNextScreen value) startNextScreen,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_DisplayCountries value)? displayCountries,
    TResult? Function(_DisplayStates value)? displayStates,
    TResult? Function(_StartNextScreen value)? startNextScreen,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_DisplayCountries value)? displayCountries,
    TResult Function(_DisplayStates value)? displayStates,
    TResult Function(_StartNextScreen value)? startNextScreen,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStatesCopyWith<$Res> {
  factory $HomeStatesCopyWith(
    HomeStates value,
    $Res Function(HomeStates) then,
  ) = _$HomeStatesCopyWithImpl<$Res, HomeStates>;
}

/// @nodoc
class _$HomeStatesCopyWithImpl<$Res, $Val extends HomeStates>
    implements $HomeStatesCopyWith<$Res> {
  _$HomeStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
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
    extends _$HomeStatesCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeStates.loading()';
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
    required TResult Function() loading,
    required TResult Function(CountryList countryList) displayCountries,
    required TResult Function(StateList stateList) displayStates,
    required TResult Function() startNextScreen,
    required TResult Function(String? message) errorMessage,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CountryList countryList)? displayCountries,
    TResult? Function(StateList stateList)? displayStates,
    TResult? Function()? startNextScreen,
    TResult? Function(String? message)? errorMessage,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CountryList countryList)? displayCountries,
    TResult Function(StateList stateList)? displayStates,
    TResult Function()? startNextScreen,
    TResult Function(String? message)? errorMessage,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_DisplayCountries value) displayCountries,
    required TResult Function(_DisplayStates value) displayStates,
    required TResult Function(_StartNextScreen value) startNextScreen,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_DisplayCountries value)? displayCountries,
    TResult? Function(_DisplayStates value)? displayStates,
    TResult? Function(_StartNextScreen value)? startNextScreen,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_DisplayCountries value)? displayCountries,
    TResult Function(_DisplayStates value)? displayStates,
    TResult Function(_StartNextScreen value)? startNextScreen,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeStates {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$DisplayCountriesImplCopyWith<$Res> {
  factory _$$DisplayCountriesImplCopyWith(
    _$DisplayCountriesImpl value,
    $Res Function(_$DisplayCountriesImpl) then,
  ) = __$$DisplayCountriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CountryList countryList});

  $CountryListCopyWith<$Res> get countryList;
}

/// @nodoc
class __$$DisplayCountriesImplCopyWithImpl<$Res>
    extends _$HomeStatesCopyWithImpl<$Res, _$DisplayCountriesImpl>
    implements _$$DisplayCountriesImplCopyWith<$Res> {
  __$$DisplayCountriesImplCopyWithImpl(
    _$DisplayCountriesImpl _value,
    $Res Function(_$DisplayCountriesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? countryList = null}) {
    return _then(
      _$DisplayCountriesImpl(
        null == countryList
            ? _value.countryList
            : countryList // ignore: cast_nullable_to_non_nullable
                as CountryList,
      ),
    );
  }

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryListCopyWith<$Res> get countryList {
    return $CountryListCopyWith<$Res>(_value.countryList, (value) {
      return _then(_value.copyWith(countryList: value));
    });
  }
}

/// @nodoc

class _$DisplayCountriesImpl implements _DisplayCountries {
  const _$DisplayCountriesImpl(this.countryList);

  @override
  final CountryList countryList;

  @override
  String toString() {
    return 'HomeStates.displayCountries(countryList: $countryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayCountriesImpl &&
            (identical(other.countryList, countryList) ||
                other.countryList == countryList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryList);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayCountriesImplCopyWith<_$DisplayCountriesImpl> get copyWith =>
      __$$DisplayCountriesImplCopyWithImpl<_$DisplayCountriesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CountryList countryList) displayCountries,
    required TResult Function(StateList stateList) displayStates,
    required TResult Function() startNextScreen,
    required TResult Function(String? message) errorMessage,
  }) {
    return displayCountries(countryList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CountryList countryList)? displayCountries,
    TResult? Function(StateList stateList)? displayStates,
    TResult? Function()? startNextScreen,
    TResult? Function(String? message)? errorMessage,
  }) {
    return displayCountries?.call(countryList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CountryList countryList)? displayCountries,
    TResult Function(StateList stateList)? displayStates,
    TResult Function()? startNextScreen,
    TResult Function(String? message)? errorMessage,
    required TResult orElse(),
  }) {
    if (displayCountries != null) {
      return displayCountries(countryList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_DisplayCountries value) displayCountries,
    required TResult Function(_DisplayStates value) displayStates,
    required TResult Function(_StartNextScreen value) startNextScreen,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return displayCountries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_DisplayCountries value)? displayCountries,
    TResult? Function(_DisplayStates value)? displayStates,
    TResult? Function(_StartNextScreen value)? startNextScreen,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return displayCountries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_DisplayCountries value)? displayCountries,
    TResult Function(_DisplayStates value)? displayStates,
    TResult Function(_StartNextScreen value)? startNextScreen,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (displayCountries != null) {
      return displayCountries(this);
    }
    return orElse();
  }
}

abstract class _DisplayCountries implements HomeStates {
  const factory _DisplayCountries(final CountryList countryList) =
      _$DisplayCountriesImpl;

  CountryList get countryList;

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayCountriesImplCopyWith<_$DisplayCountriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisplayStatesImplCopyWith<$Res> {
  factory _$$DisplayStatesImplCopyWith(
    _$DisplayStatesImpl value,
    $Res Function(_$DisplayStatesImpl) then,
  ) = __$$DisplayStatesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StateList stateList});

  $StateListCopyWith<$Res> get stateList;
}

/// @nodoc
class __$$DisplayStatesImplCopyWithImpl<$Res>
    extends _$HomeStatesCopyWithImpl<$Res, _$DisplayStatesImpl>
    implements _$$DisplayStatesImplCopyWith<$Res> {
  __$$DisplayStatesImplCopyWithImpl(
    _$DisplayStatesImpl _value,
    $Res Function(_$DisplayStatesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stateList = null}) {
    return _then(
      _$DisplayStatesImpl(
        null == stateList
            ? _value.stateList
            : stateList // ignore: cast_nullable_to_non_nullable
                as StateList,
      ),
    );
  }

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StateListCopyWith<$Res> get stateList {
    return $StateListCopyWith<$Res>(_value.stateList, (value) {
      return _then(_value.copyWith(stateList: value));
    });
  }
}

/// @nodoc

class _$DisplayStatesImpl implements _DisplayStates {
  const _$DisplayStatesImpl(this.stateList);

  @override
  final StateList stateList;

  @override
  String toString() {
    return 'HomeStates.displayStates(stateList: $stateList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayStatesImpl &&
            (identical(other.stateList, stateList) ||
                other.stateList == stateList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateList);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayStatesImplCopyWith<_$DisplayStatesImpl> get copyWith =>
      __$$DisplayStatesImplCopyWithImpl<_$DisplayStatesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CountryList countryList) displayCountries,
    required TResult Function(StateList stateList) displayStates,
    required TResult Function() startNextScreen,
    required TResult Function(String? message) errorMessage,
  }) {
    return displayStates(stateList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CountryList countryList)? displayCountries,
    TResult? Function(StateList stateList)? displayStates,
    TResult? Function()? startNextScreen,
    TResult? Function(String? message)? errorMessage,
  }) {
    return displayStates?.call(stateList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CountryList countryList)? displayCountries,
    TResult Function(StateList stateList)? displayStates,
    TResult Function()? startNextScreen,
    TResult Function(String? message)? errorMessage,
    required TResult orElse(),
  }) {
    if (displayStates != null) {
      return displayStates(stateList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_DisplayCountries value) displayCountries,
    required TResult Function(_DisplayStates value) displayStates,
    required TResult Function(_StartNextScreen value) startNextScreen,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return displayStates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_DisplayCountries value)? displayCountries,
    TResult? Function(_DisplayStates value)? displayStates,
    TResult? Function(_StartNextScreen value)? startNextScreen,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return displayStates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_DisplayCountries value)? displayCountries,
    TResult Function(_DisplayStates value)? displayStates,
    TResult Function(_StartNextScreen value)? startNextScreen,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (displayStates != null) {
      return displayStates(this);
    }
    return orElse();
  }
}

abstract class _DisplayStates implements HomeStates {
  const factory _DisplayStates(final StateList stateList) = _$DisplayStatesImpl;

  StateList get stateList;

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayStatesImplCopyWith<_$DisplayStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartNextScreenImplCopyWith<$Res> {
  factory _$$StartNextScreenImplCopyWith(
    _$StartNextScreenImpl value,
    $Res Function(_$StartNextScreenImpl) then,
  ) = __$$StartNextScreenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartNextScreenImplCopyWithImpl<$Res>
    extends _$HomeStatesCopyWithImpl<$Res, _$StartNextScreenImpl>
    implements _$$StartNextScreenImplCopyWith<$Res> {
  __$$StartNextScreenImplCopyWithImpl(
    _$StartNextScreenImpl _value,
    $Res Function(_$StartNextScreenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartNextScreenImpl implements _StartNextScreen {
  const _$StartNextScreenImpl();

  @override
  String toString() {
    return 'HomeStates.startNextScreen()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartNextScreenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CountryList countryList) displayCountries,
    required TResult Function(StateList stateList) displayStates,
    required TResult Function() startNextScreen,
    required TResult Function(String? message) errorMessage,
  }) {
    return startNextScreen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CountryList countryList)? displayCountries,
    TResult? Function(StateList stateList)? displayStates,
    TResult? Function()? startNextScreen,
    TResult? Function(String? message)? errorMessage,
  }) {
    return startNextScreen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CountryList countryList)? displayCountries,
    TResult Function(StateList stateList)? displayStates,
    TResult Function()? startNextScreen,
    TResult Function(String? message)? errorMessage,
    required TResult orElse(),
  }) {
    if (startNextScreen != null) {
      return startNextScreen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_DisplayCountries value) displayCountries,
    required TResult Function(_DisplayStates value) displayStates,
    required TResult Function(_StartNextScreen value) startNextScreen,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return startNextScreen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_DisplayCountries value)? displayCountries,
    TResult? Function(_DisplayStates value)? displayStates,
    TResult? Function(_StartNextScreen value)? startNextScreen,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return startNextScreen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_DisplayCountries value)? displayCountries,
    TResult Function(_DisplayStates value)? displayStates,
    TResult Function(_StartNextScreen value)? startNextScreen,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (startNextScreen != null) {
      return startNextScreen(this);
    }
    return orElse();
  }
}

abstract class _StartNextScreen implements HomeStates {
  const factory _StartNextScreen() = _$StartNextScreenImpl;
}

/// @nodoc
abstract class _$$ErrorMessageImplCopyWith<$Res> {
  factory _$$ErrorMessageImplCopyWith(
    _$ErrorMessageImpl value,
    $Res Function(_$ErrorMessageImpl) then,
  ) = __$$ErrorMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorMessageImplCopyWithImpl<$Res>
    extends _$HomeStatesCopyWithImpl<$Res, _$ErrorMessageImpl>
    implements _$$ErrorMessageImplCopyWith<$Res> {
  __$$ErrorMessageImplCopyWithImpl(
    _$ErrorMessageImpl _value,
    $Res Function(_$ErrorMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed}) {
    return _then(
      _$ErrorMessageImpl(
        freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

class _$ErrorMessageImpl implements _ErrorMessage {
  const _$ErrorMessageImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'HomeStates.errorMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      __$$ErrorMessageImplCopyWithImpl<_$ErrorMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CountryList countryList) displayCountries,
    required TResult Function(StateList stateList) displayStates,
    required TResult Function() startNextScreen,
    required TResult Function(String? message) errorMessage,
  }) {
    return errorMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CountryList countryList)? displayCountries,
    TResult? Function(StateList stateList)? displayStates,
    TResult? Function()? startNextScreen,
    TResult? Function(String? message)? errorMessage,
  }) {
    return errorMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CountryList countryList)? displayCountries,
    TResult Function(StateList stateList)? displayStates,
    TResult Function()? startNextScreen,
    TResult Function(String? message)? errorMessage,
    required TResult orElse(),
  }) {
    if (errorMessage != null) {
      return errorMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_DisplayCountries value) displayCountries,
    required TResult Function(_DisplayStates value) displayStates,
    required TResult Function(_StartNextScreen value) startNextScreen,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return errorMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_DisplayCountries value)? displayCountries,
    TResult? Function(_DisplayStates value)? displayStates,
    TResult? Function(_StartNextScreen value)? startNextScreen,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return errorMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_DisplayCountries value)? displayCountries,
    TResult Function(_DisplayStates value)? displayStates,
    TResult Function(_StartNextScreen value)? startNextScreen,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (errorMessage != null) {
      return errorMessage(this);
    }
    return orElse();
  }
}

abstract class _ErrorMessage implements HomeStates {
  const factory _ErrorMessage(final String? message) = _$ErrorMessageImpl;

  String? get message;

  /// Create a copy of HomeStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
