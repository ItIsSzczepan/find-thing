// Mocks generated by Mockito 5.1.0 from annotations
// in find_thing/test/src/domain/use_cases/remove_area_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:find_thing/src/domain/entities/area.dart' as _i5;
import 'package:find_thing/src/domain/entities/place.dart' as _i2;
import 'package:find_thing/src/domain/repositories/database_repository.dart'
    as _i3;
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

class _FakePlace_0 extends _i1.Fake implements _i2.Place {}

/// A class which mocks [DatabaseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseRepository extends _i1.Mock
    implements _i3.DatabaseRepository {
  MockDatabaseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Place> createNewPlace({String? name}) =>
      (super.noSuchMethod(Invocation.method(#createNewPlace, [], {#name: name}),
              returnValue: Future<_i2.Place>.value(_FakePlace_0()))
          as _i4.Future<_i2.Place>);
  @override
  _i4.Future<int> savePlace(_i2.Place? place) =>
      (super.noSuchMethod(Invocation.method(#savePlace, [place]),
          returnValue: Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<bool> removePlace(int? id) =>
      (super.noSuchMethod(Invocation.method(#removePlace, [id]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<_i4.Stream<dynamic>> getPlacesStream() =>
      (super.noSuchMethod(Invocation.method(#getPlacesStream, []),
              returnValue:
                  Future<_i4.Stream<dynamic>>.value(Stream<dynamic>.empty()))
          as _i4.Future<_i4.Stream<dynamic>>);
  @override
  _i4.Future<int> saveArea(_i5.Area? area) =>
      (super.noSuchMethod(Invocation.method(#saveArea, [area]),
          returnValue: Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<bool> removeArea(int? id) =>
      (super.noSuchMethod(Invocation.method(#removeArea, [id]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
