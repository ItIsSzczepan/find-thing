// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImageCubitStateTearOff {
  const _$ImageCubitStateTearOff();

  ImageInitial initial() {
    return const ImageInitial();
  }

  ImageEmpty empty() {
    return const ImageEmpty();
  }

  ImagePicked picked(XFile file) {
    return ImagePicked(
      file,
    );
  }

  ImageFailure failure({required Failure failure}) {
    return ImageFailure(
      failure: failure,
    );
  }
}

/// @nodoc
const $ImageCubitState = _$ImageCubitStateTearOff();

/// @nodoc
mixin _$ImageCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(XFile file) picked,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageEmpty value) empty,
    required TResult Function(ImagePicked value) picked,
    required TResult Function(ImageFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCubitStateCopyWith<$Res> {
  factory $ImageCubitStateCopyWith(
          ImageCubitState value, $Res Function(ImageCubitState) then) =
      _$ImageCubitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageCubitStateCopyWithImpl<$Res>
    implements $ImageCubitStateCopyWith<$Res> {
  _$ImageCubitStateCopyWithImpl(this._value, this._then);

  final ImageCubitState _value;
  // ignore: unused_field
  final $Res Function(ImageCubitState) _then;
}

/// @nodoc
abstract class $ImageInitialCopyWith<$Res> {
  factory $ImageInitialCopyWith(
          ImageInitial value, $Res Function(ImageInitial) then) =
      _$ImageInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageInitialCopyWithImpl<$Res>
    extends _$ImageCubitStateCopyWithImpl<$Res>
    implements $ImageInitialCopyWith<$Res> {
  _$ImageInitialCopyWithImpl(
      ImageInitial _value, $Res Function(ImageInitial) _then)
      : super(_value, (v) => _then(v as ImageInitial));

  @override
  ImageInitial get _value => super._value as ImageInitial;
}

/// @nodoc

class _$ImageInitial implements ImageInitial {
  const _$ImageInitial();

  @override
  String toString() {
    return 'ImageCubitState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ImageInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(XFile file) picked,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
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
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageEmpty value) empty,
    required TResult Function(ImagePicked value) picked,
    required TResult Function(ImageFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ImageInitial implements ImageCubitState {
  const factory ImageInitial() = _$ImageInitial;
}

/// @nodoc
abstract class $ImageEmptyCopyWith<$Res> {
  factory $ImageEmptyCopyWith(
          ImageEmpty value, $Res Function(ImageEmpty) then) =
      _$ImageEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageEmptyCopyWithImpl<$Res> extends _$ImageCubitStateCopyWithImpl<$Res>
    implements $ImageEmptyCopyWith<$Res> {
  _$ImageEmptyCopyWithImpl(ImageEmpty _value, $Res Function(ImageEmpty) _then)
      : super(_value, (v) => _then(v as ImageEmpty));

  @override
  ImageEmpty get _value => super._value as ImageEmpty;
}

/// @nodoc

class _$ImageEmpty implements ImageEmpty {
  const _$ImageEmpty();

  @override
  String toString() {
    return 'ImageCubitState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ImageEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(XFile file) picked,
    required TResult Function(Failure failure) failure,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageEmpty value) empty,
    required TResult Function(ImagePicked value) picked,
    required TResult Function(ImageFailure value) failure,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ImageEmpty implements ImageCubitState {
  const factory ImageEmpty() = _$ImageEmpty;
}

/// @nodoc
abstract class $ImagePickedCopyWith<$Res> {
  factory $ImagePickedCopyWith(
          ImagePicked value, $Res Function(ImagePicked) then) =
      _$ImagePickedCopyWithImpl<$Res>;
  $Res call({XFile file});
}

/// @nodoc
class _$ImagePickedCopyWithImpl<$Res>
    extends _$ImageCubitStateCopyWithImpl<$Res>
    implements $ImagePickedCopyWith<$Res> {
  _$ImagePickedCopyWithImpl(
      ImagePicked _value, $Res Function(ImagePicked) _then)
      : super(_value, (v) => _then(v as ImagePicked));

  @override
  ImagePicked get _value => super._value as ImagePicked;

  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(ImagePicked(
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$ImagePicked implements ImagePicked {
  const _$ImagePicked(this.file);

  @override
  final XFile file;

  @override
  String toString() {
    return 'ImageCubitState.picked(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImagePicked &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  $ImagePickedCopyWith<ImagePicked> get copyWith =>
      _$ImagePickedCopyWithImpl<ImagePicked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(XFile file) picked,
    required TResult Function(Failure failure) failure,
  }) {
    return picked(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
  }) {
    return picked?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageEmpty value) empty,
    required TResult Function(ImagePicked value) picked,
    required TResult Function(ImageFailure value) failure,
  }) {
    return picked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
  }) {
    return picked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(this);
    }
    return orElse();
  }
}

abstract class ImagePicked implements ImageCubitState {
  const factory ImagePicked(XFile file) = _$ImagePicked;

  XFile get file;
  @JsonKey(ignore: true)
  $ImagePickedCopyWith<ImagePicked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageFailureCopyWith<$Res> {
  factory $ImageFailureCopyWith(
          ImageFailure value, $Res Function(ImageFailure) then) =
      _$ImageFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$ImageFailureCopyWithImpl<$Res>
    extends _$ImageCubitStateCopyWithImpl<$Res>
    implements $ImageFailureCopyWith<$Res> {
  _$ImageFailureCopyWithImpl(
      ImageFailure _value, $Res Function(ImageFailure) _then)
      : super(_value, (v) => _then(v as ImageFailure));

  @override
  ImageFailure get _value => super._value as ImageFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(ImageFailure(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ImageFailure implements ImageFailure {
  const _$ImageFailure({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ImageCubitState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $ImageFailureCopyWith<ImageFailure> get copyWith =>
      _$ImageFailureCopyWithImpl<ImageFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(XFile file) picked,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
    TResult Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(XFile file)? picked,
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
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageEmpty value) empty,
    required TResult Function(ImagePicked value) picked,
    required TResult Function(ImageFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageEmpty value)? empty,
    TResult Function(ImagePicked value)? picked,
    TResult Function(ImageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ImageFailure implements ImageCubitState {
  const factory ImageFailure({required Failure failure}) = _$ImageFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  $ImageFailureCopyWith<ImageFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
