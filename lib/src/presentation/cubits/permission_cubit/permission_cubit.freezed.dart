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

  PermissionInitial initial() {
    return const PermissionInitial();
  }

  PermissionData data(
      {required Map<Permissions, PermissionStatus> permissions}) {
    return PermissionData(
      permissions: permissions,
    );
  }

  PermissionFailure failure({required Failure failure}) {
    return PermissionFailure(
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
    required TResult Function(PermissionInitial value) initial,
    required TResult Function(PermissionData value) data,
    required TResult Function(PermissionFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
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
abstract class $PermissionInitialCopyWith<$Res> {
  factory $PermissionInitialCopyWith(
          PermissionInitial value, $Res Function(PermissionInitial) then) =
      _$PermissionInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$PermissionInitialCopyWithImpl<$Res>
    extends _$PermissionCubitStateCopyWithImpl<$Res>
    implements $PermissionInitialCopyWith<$Res> {
  _$PermissionInitialCopyWithImpl(
      PermissionInitial _value, $Res Function(PermissionInitial) _then)
      : super(_value, (v) => _then(v as PermissionInitial));

  @override
  PermissionInitial get _value => super._value as PermissionInitial;
}

/// @nodoc

class _$PermissionInitial implements PermissionInitial {
  const _$PermissionInitial();

  @override
  String toString() {
    return 'PermissionCubitState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PermissionInitial);
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
    required TResult Function(PermissionInitial value) initial,
    required TResult Function(PermissionData value) data,
    required TResult Function(PermissionFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PermissionInitial implements PermissionCubitState {
  const factory PermissionInitial() = _$PermissionInitial;
}

/// @nodoc
abstract class $PermissionDataCopyWith<$Res> {
  factory $PermissionDataCopyWith(
          PermissionData value, $Res Function(PermissionData) then) =
      _$PermissionDataCopyWithImpl<$Res>;
  $Res call({Map<Permissions, PermissionStatus> permissions});
}

/// @nodoc
class _$PermissionDataCopyWithImpl<$Res>
    extends _$PermissionCubitStateCopyWithImpl<$Res>
    implements $PermissionDataCopyWith<$Res> {
  _$PermissionDataCopyWithImpl(
      PermissionData _value, $Res Function(PermissionData) _then)
      : super(_value, (v) => _then(v as PermissionData));

  @override
  PermissionData get _value => super._value as PermissionData;

  @override
  $Res call({
    Object? permissions = freezed,
  }) {
    return _then(PermissionData(
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<Permissions, PermissionStatus>,
    ));
  }
}

/// @nodoc

class _$PermissionData implements PermissionData {
  const _$PermissionData({required this.permissions});

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
            other is PermissionData &&
            const DeepCollectionEquality()
                .equals(other.permissions, permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(permissions));

  @JsonKey(ignore: true)
  @override
  $PermissionDataCopyWith<PermissionData> get copyWith =>
      _$PermissionDataCopyWithImpl<PermissionData>(this, _$identity);

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
    required TResult Function(PermissionInitial value) initial,
    required TResult Function(PermissionData value) data,
    required TResult Function(PermissionFailure value) failure,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PermissionData implements PermissionCubitState {
  const factory PermissionData(
          {required Map<Permissions, PermissionStatus> permissions}) =
      _$PermissionData;

  Map<Permissions, PermissionStatus> get permissions;
  @JsonKey(ignore: true)
  $PermissionDataCopyWith<PermissionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionFailureCopyWith<$Res> {
  factory $PermissionFailureCopyWith(
          PermissionFailure value, $Res Function(PermissionFailure) then) =
      _$PermissionFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$PermissionFailureCopyWithImpl<$Res>
    extends _$PermissionCubitStateCopyWithImpl<$Res>
    implements $PermissionFailureCopyWith<$Res> {
  _$PermissionFailureCopyWithImpl(
      PermissionFailure _value, $Res Function(PermissionFailure) _then)
      : super(_value, (v) => _then(v as PermissionFailure));

  @override
  PermissionFailure get _value => super._value as PermissionFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(PermissionFailure(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$PermissionFailure implements PermissionFailure {
  const _$PermissionFailure({required this.failure});

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
            other is PermissionFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $PermissionFailureCopyWith<PermissionFailure> get copyWith =>
      _$PermissionFailureCopyWithImpl<PermissionFailure>(this, _$identity);

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
    required TResult Function(PermissionInitial value) initial,
    required TResult Function(PermissionData value) data,
    required TResult Function(PermissionFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitial value)? initial,
    TResult Function(PermissionData value)? data,
    TResult Function(PermissionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PermissionFailure implements PermissionCubitState {
  const factory PermissionFailure({required Failure failure}) =
      _$PermissionFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  $PermissionFailureCopyWith<PermissionFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
