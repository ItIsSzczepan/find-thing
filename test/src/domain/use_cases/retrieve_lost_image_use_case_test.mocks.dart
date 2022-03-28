// Mocks generated by Mockito 5.1.0 from annotations
// in find_thing/test/src/domain/use_cases/retrieve_lost_image_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:ui' as _i7;

import 'package:dartz/dartz.dart' as _i2;
import 'package:find_thing/src/core/failure.dart' as _i5;
import 'package:find_thing/src/domain/repositories/file_repository.dart' as _i3;
import 'package:image_picker/image_picker.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [FileRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileRepository extends _i1.Mock implements _i3.FileRepository {
  MockFileRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.XFile>> pickImage(
          _i6.ImageSource? imageSource) =>
      (super.noSuchMethod(Invocation.method(#pickImage, [imageSource]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.XFile>>.value(
                  _FakeEither_0<_i5.Failure, _i6.XFile>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.XFile>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.XFile>> retrieveLostImage() =>
      (super.noSuchMethod(Invocation.method(#retrieveLostImage, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.XFile>>.value(
                  _FakeEither_0<_i5.Failure, _i6.XFile>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.XFile>>);
  @override
  dynamic saveImage({_i7.Image? image, String? uid}) => super.noSuchMethod(
      Invocation.method(#saveImage, [], {#image: image, #uid: uid}));
}
