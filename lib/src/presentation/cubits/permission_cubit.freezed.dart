// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'permission_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PermissionCubitStateTearOff {
  const _$PermissionCubitStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Data data({required Map<Permissions, PermissionStatus> permissions}) {
    return Data(
      permissions: permissions,
    );
  }

  FailureState failure({required Failure failure}) {
    return FailureState(
      failure: failure,
    );
  }
}

/// @nodoc
const $PermissionCubitState = _$PermissionCubitStateTearOff();

/// @nodoc
mixin _$PermissionCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<Permissions, PermissionStatus> permissions)
        data,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCubitStateCopyWith<$Res> {
  factory $PermissionCubitStateCopyWith(PermissionCubitState value,
          $Res Function(PermissionCubitState) then) =
      _$PermissionCubitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PermissionCubitStateCopyWithImpl<$Res>
    implements $PermissionCubitStateCopyWith<$Res> {
  _$PermissionCubitStateCopyWithImpl(this._value, this._then);

  final PermissionCubitState _value;
  // ignore: unused_field
  final $Res Function(PermissionCubitState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$PermissionCubitStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'PermissionCubitState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<Permissions, PermissionStatus> permissions)
        data,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements PermissionCubitState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({Map<Permissions, PermissionStatus> permissions});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$PermissionCubitStateCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object? permissions = freezed,
  }) {
    return _then(Data(
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<Permissions, PermissionStatus>,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data({required this.permissions});

  @override
  final Map<Permissions, PermissionStatus> permissions;

  @override
  String toString() {
    return 'PermissionCubitState.data(permissions: $permissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data &&
            const DeepCollectionEquality()
                .equals(other.permissions, permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(permissions));

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<Permissions, PermissionStatus> permissions)
        data,
    required TResult Function(Failure failure) failure,
  }) {
    return data(permissions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
  }) {
    return data?.call(permissions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(permissions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(FailureState value) failure,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements PermissionCubitState {
  const factory Data(
      {required Map<Permissions, PermissionStatus> permissions}) = _$Data;

  Map<Permissions, PermissionStatus> get permissions;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureStateCopyWith<$Res> {
  factory $FailureStateCopyWith(
          FailureState value, $Res Function(FailureState) then) =
      _$FailureStateCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$FailureStateCopyWithImpl<$Res>
    extends _$PermissionCubitStateCopyWithImpl<$Res>
    implements $FailureStateCopyWith<$Res> {
  _$FailureStateCopyWithImpl(
      FailureState _value, $Res Function(FailureState) _then)
      : super(_value, (v) => _then(v as FailureState));

  @override
  FailureState get _value => super._value as FailureState;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(FailureState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$FailureState implements FailureState {
  const _$FailureState({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PermissionCubitState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailureState &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $FailureStateCopyWith<FailureState> get copyWith =>
      _$FailureStateCopyWithImpl<FailureState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<Permissions, PermissionStatus> permissions)
        data,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<Permissions, PermissionStatus> permissions)? data,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureState implements PermissionCubitState {
  const factory FailureState({required Failure failure}) = _$FailureState;

  Failure get failure;
  @JsonKey(ignore: true)
  $FailureStateCopyWith<FailureState> get copyWith =>
      throw _privateConstructorUsedError;
}
