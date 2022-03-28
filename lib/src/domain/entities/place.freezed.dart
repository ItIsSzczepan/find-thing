// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlaceTearOff {
  const _$PlaceTearOff();

  _Place call(
      {@Id(assignable: true) int? id,
      @Unique(onConflict: ConflictStrategy.replace) String? uid,
      required String name,
      String? fileLocation}) {
    return _Place(
      id: id,
      uid: uid,
      name: name,
      fileLocation: fileLocation,
    );
  }
}

/// @nodoc
const $Place = _$PlaceTearOff();

/// @nodoc
mixin _$Place {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  @Unique(onConflict: ConflictStrategy.replace)
  String? get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get fileLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res>;
  $Res call(
      {@Id(assignable: true) int? id,
      @Unique(onConflict: ConflictStrategy.replace) String? uid,
      String name,
      String? fileLocation});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res> implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  final Place _value;
  // ignore: unused_field
  final $Res Function(Place) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? fileLocation = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileLocation: fileLocation == freezed
          ? _value.fileLocation
          : fileLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) then) =
      __$PlaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id(assignable: true) int? id,
      @Unique(onConflict: ConflictStrategy.replace) String? uid,
      String name,
      String? fileLocation});
}

/// @nodoc
class __$PlaceCopyWithImpl<$Res> extends _$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(_Place _value, $Res Function(_Place) _then)
      : super(_value, (v) => _then(v as _Place));

  @override
  _Place get _value => super._value as _Place;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? fileLocation = freezed,
  }) {
    return _then(_Place(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileLocation: fileLocation == freezed
          ? _value.fileLocation
          : fileLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@Entity(realClass: Place)
class _$_Place implements _Place {
  _$_Place(
      {@Id(assignable: true) this.id,
      @Unique(onConflict: ConflictStrategy.replace) this.uid,
      required this.name,
      this.fileLocation});

  @override
  @Id(assignable: true)
  final int? id;
  @override
  @Unique(onConflict: ConflictStrategy.replace)
  final String? uid;
  @override
  final String name;
  @override
  final String? fileLocation;

  @override
  String toString() {
    return 'Place(id: $id, uid: $uid, name: $name, fileLocation: $fileLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Place &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.fileLocation, fileLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(fileLocation));

  @JsonKey(ignore: true)
  @override
  _$PlaceCopyWith<_Place> get copyWith =>
      __$PlaceCopyWithImpl<_Place>(this, _$identity);
}

abstract class _Place implements Place {
  factory _Place(
      {@Id(assignable: true) int? id,
      @Unique(onConflict: ConflictStrategy.replace) String? uid,
      required String name,
      String? fileLocation}) = _$_Place;

  @override
  @Id(assignable: true)
  int? get id;
  @override
  @Unique(onConflict: ConflictStrategy.replace)
  String? get uid;
  @override
  String get name;
  @override
  String? get fileLocation;
  @override
  @JsonKey(ignore: true)
  _$PlaceCopyWith<_Place> get copyWith => throw _privateConstructorUsedError;
}
