// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlaceCubitStateTearOff {
  const _$PlaceCubitStateTearOff();

  PlaceInitial initial() {
    return const PlaceInitial();
  }

  PlaceData data({required Stream<dynamic> stream}) {
    return PlaceData(
      stream: stream,
    );
  }

  PlaceFailure failure({required Failure failure}) {
    return PlaceFailure(
      failure: failure,
    );
  }
}

/// @nodoc
const $PlaceCubitState = _$PlaceCubitStateTearOff();

/// @nodoc
mixin _$PlaceCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Stream<dynamic> stream) data,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
    TResult Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceInitial value) initial,
    required TResult Function(PlaceData value) data,
    required TResult Function(PlaceFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCubitStateCopyWith<$Res> {
  factory $PlaceCubitStateCopyWith(
          PlaceCubitState value, $Res Function(PlaceCubitState) then) =
      _$PlaceCubitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaceCubitStateCopyWithImpl<$Res>
    implements $PlaceCubitStateCopyWith<$Res> {
  _$PlaceCubitStateCopyWithImpl(this._value, this._then);

  final PlaceCubitState _value;
  // ignore: unused_field
  final $Res Function(PlaceCubitState) _then;
}

/// @nodoc
abstract class $PlaceInitialCopyWith<$Res> {
  factory $PlaceInitialCopyWith(
          PlaceInitial value, $Res Function(PlaceInitial) then) =
      _$PlaceInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaceInitialCopyWithImpl<$Res>
    extends _$PlaceCubitStateCopyWithImpl<$Res>
    implements $PlaceInitialCopyWith<$Res> {
  _$PlaceInitialCopyWithImpl(
      PlaceInitial _value, $Res Function(PlaceInitial) _then)
      : super(_value, (v) => _then(v as PlaceInitial));

  @override
  PlaceInitial get _value => super._value as PlaceInitial;
}

/// @nodoc

class _$PlaceInitial implements PlaceInitial {
  const _$PlaceInitial();

  @override
  String toString() {
    return 'PlaceCubitState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlaceInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Stream<dynamic> stream) data,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
    TResult Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
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
    required TResult Function(PlaceInitial value) initial,
    required TResult Function(PlaceData value) data,
    required TResult Function(PlaceFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PlaceInitial implements PlaceCubitState {
  const factory PlaceInitial() = _$PlaceInitial;
}

/// @nodoc
abstract class $PlaceDataCopyWith<$Res> {
  factory $PlaceDataCopyWith(PlaceData value, $Res Function(PlaceData) then) =
      _$PlaceDataCopyWithImpl<$Res>;
  $Res call({Stream<dynamic> stream});
}

/// @nodoc
class _$PlaceDataCopyWithImpl<$Res> extends _$PlaceCubitStateCopyWithImpl<$Res>
    implements $PlaceDataCopyWith<$Res> {
  _$PlaceDataCopyWithImpl(PlaceData _value, $Res Function(PlaceData) _then)
      : super(_value, (v) => _then(v as PlaceData));

  @override
  PlaceData get _value => super._value as PlaceData;

  @override
  $Res call({
    Object? stream = freezed,
  }) {
    return _then(PlaceData(
      stream: stream == freezed
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<dynamic>,
    ));
  }
}

/// @nodoc

class _$PlaceData implements PlaceData {
  const _$PlaceData({required this.stream});

  @override
  final Stream<dynamic> stream;

  @override
  String toString() {
    return 'PlaceCubitState.data(stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceData &&
            const DeepCollectionEquality().equals(other.stream, stream));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(stream));

  @JsonKey(ignore: true)
  @override
  $PlaceDataCopyWith<PlaceData> get copyWith =>
      _$PlaceDataCopyWithImpl<PlaceData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Stream<dynamic> stream) data,
    required TResult Function(Failure failure) failure,
  }) {
    return data(stream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
    TResult Function(Failure failure)? failure,
  }) {
    return data?.call(stream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(stream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceInitial value) initial,
    required TResult Function(PlaceData value) data,
    required TResult Function(PlaceFailure value) failure,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PlaceData implements PlaceCubitState {
  const factory PlaceData({required Stream<dynamic> stream}) = _$PlaceData;

  Stream<dynamic> get stream;
  @JsonKey(ignore: true)
  $PlaceDataCopyWith<PlaceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceFailureCopyWith<$Res> {
  factory $PlaceFailureCopyWith(
          PlaceFailure value, $Res Function(PlaceFailure) then) =
      _$PlaceFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$PlaceFailureCopyWithImpl<$Res>
    extends _$PlaceCubitStateCopyWithImpl<$Res>
    implements $PlaceFailureCopyWith<$Res> {
  _$PlaceFailureCopyWithImpl(
      PlaceFailure _value, $Res Function(PlaceFailure) _then)
      : super(_value, (v) => _then(v as PlaceFailure));

  @override
  PlaceFailure get _value => super._value as PlaceFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(PlaceFailure(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$PlaceFailure implements PlaceFailure {
  const _$PlaceFailure({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PlaceCubitState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $PlaceFailureCopyWith<PlaceFailure> get copyWith =>
      _$PlaceFailureCopyWithImpl<PlaceFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Stream<dynamic> stream) data,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
    TResult Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<dynamic> stream)? data,
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
    required TResult Function(PlaceInitial value) initial,
    required TResult Function(PlaceData value) data,
    required TResult Function(PlaceFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceInitial value)? initial,
    TResult Function(PlaceData value)? data,
    TResult Function(PlaceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PlaceFailure implements PlaceCubitState {
  const factory PlaceFailure({required Failure failure}) = _$PlaceFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  $PlaceFailureCopyWith<PlaceFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
