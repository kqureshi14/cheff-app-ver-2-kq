// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_settings_screen_m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountSettingsScreenState {
  String get selectedDateFormat => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedDateFormat) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String selectedDateFormat)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedDateFormat)? initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSettingsScreenStateCopyWith<AccountSettingsScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSettingsScreenStateCopyWith<$Res> {
  factory $AccountSettingsScreenStateCopyWith(AccountSettingsScreenState value,
          $Res Function(AccountSettingsScreenState) then) =
      _$AccountSettingsScreenStateCopyWithImpl<$Res>;
  $Res call({String selectedDateFormat});
}

/// @nodoc
class _$AccountSettingsScreenStateCopyWithImpl<$Res>
    implements $AccountSettingsScreenStateCopyWith<$Res> {
  _$AccountSettingsScreenStateCopyWithImpl(this._value, this._then);

  final AccountSettingsScreenState _value;
  // ignore: unused_field
  final $Res Function(AccountSettingsScreenState) _then;

  @override
  $Res call({
    Object? selectedDateFormat = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDateFormat: selectedDateFormat == freezed
          ? _value.selectedDateFormat
          : selectedDateFormat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$InitializedCopyWith<$Res>
    implements $AccountSettingsScreenStateCopyWith<$Res> {
  factory _$$InitializedCopyWith(
          _$Initialized value, $Res Function(_$Initialized) then) =
      __$$InitializedCopyWithImpl<$Res>;
  @override
  $Res call({String selectedDateFormat});
}

/// @nodoc
class __$$InitializedCopyWithImpl<$Res>
    extends _$AccountSettingsScreenStateCopyWithImpl<$Res>
    implements _$$InitializedCopyWith<$Res> {
  __$$InitializedCopyWithImpl(
      _$Initialized _value, $Res Function(_$Initialized) _then)
      : super(_value, (v) => _then(v as _$Initialized));

  @override
  _$Initialized get _value => super._value as _$Initialized;

  @override
  $Res call({
    Object? selectedDateFormat = freezed,
  }) {
    return _then(_$Initialized(
      selectedDateFormat: selectedDateFormat == freezed
          ? _value.selectedDateFormat
          : selectedDateFormat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Initialized implements Initialized {
  const _$Initialized({this.selectedDateFormat = 'dd/MM/yyyy'});

  @override
  @JsonKey()
  final String selectedDateFormat;

  @override
  String toString() {
    return 'AccountSettingsScreenState.initialized(selectedDateFormat: $selectedDateFormat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialized &&
            const DeepCollectionEquality()
                .equals(other.selectedDateFormat, selectedDateFormat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedDateFormat));

  @JsonKey(ignore: true)
  @override
  _$$InitializedCopyWith<_$Initialized> get copyWith =>
      __$$InitializedCopyWithImpl<_$Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedDateFormat) initialized,
  }) {
    return initialized(selectedDateFormat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String selectedDateFormat)? initialized,
  }) {
    return initialized?.call(selectedDateFormat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedDateFormat)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(selectedDateFormat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class Initialized implements AccountSettingsScreenState {
  const factory Initialized({final String selectedDateFormat}) = _$Initialized;

  @override
  String get selectedDateFormat;
  @override
  @JsonKey(ignore: true)
  _$$InitializedCopyWith<_$Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}
