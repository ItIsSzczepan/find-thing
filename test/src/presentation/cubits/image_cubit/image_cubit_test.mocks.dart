// Mocks generated by Mockito 5.1.0 from annotations
// in find_thing/test/src/presentation/cubits/image_cubit/image_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:find_thing/src/core/failure.dart' as _i5;
import 'package:find_thing/src/core/params.dart' as _i8;
import 'package:find_thing/src/domain/use_cases/retrieve_lost_image_use_case.dart'
    as _i7;
import 'package:find_thing/src/domain/use_cases/save_place_use_case.dart'
    as _i9;
import 'package:find_thing/src/domain/use_cases/user_pick_image_use_case.dart'
    as _i3;
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

/// A class which mocks [UserPickImageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserPickImageUseCase extends _i1.Mock
    implements _i3.UserPickImageUseCase {
  MockUserPickImageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.XFile?>> call(
          {_i6.ImageSource? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.XFile?>>.value(
                  _FakeEither_0<_i5.Failure, _i6.XFile?>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.XFile?>>);
}

/// A class which mocks [RetrieveLostImageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRetrieveLostImageUseCase extends _i1.Mock
    implements _i7.RetrieveLostImageUseCase {
  MockRetrieveLostImageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.XFile?>> call({_i8.Params? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.XFile?>>.value(
                  _FakeEither_0<_i5.Failure, _i6.XFile?>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.XFile?>>);
}

/// A class which mocks [SavePlaceUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSavePlaceUseCase extends _i1.Mock implements _i9.SavePlaceUseCase {
  MockSavePlaceUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> call(
          {_i8.SaveImageParams? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>()))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}