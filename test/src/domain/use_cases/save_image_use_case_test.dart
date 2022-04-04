import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/params.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:find_thing/src/domain/use_cases/save_image_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_image_use_case_test.mocks.dart';

String saveImageNull({required Image? image, required String? uid}) {
  return uid!;
}

@GenerateMocks([FileRepository, DatabaseRepository])
void main() {
  late MockFileRepository _fileRepository;
  late MockDatabaseRepository _databaseRepository;
  late SaveImageUseCase useCase;

  setUp(() {
    _fileRepository = MockFileRepository();
    _databaseRepository = MockDatabaseRepository();
    useCase = SaveImageUseCase(_fileRepository, _databaseRepository);
  });

  test("file and database repositories should get the same uid", () async {
    String testFileUid = "", testDBUid = "";

    // save image mock
    when(_fileRepository.saveImage(
            image: anyNamed('image'), uid: anyNamed('uid')))
        .thenAnswer((realInvocation) async {
      testFileUid = realInvocation.namedArguments[const Symbol('uid')];
      return testFileUid;
    });
    // create new place mock
    when(_databaseRepository.createNewPlace(name: anyNamed('name'))).thenAnswer(
        (realInvocation) async => Place(
            name: realInvocation.namedArguments[const Symbol('name')],
            id: 1,
            uid: "123123123"));
    // save place mock
    when(_databaseRepository.savePlace(any)).thenAnswer((realInvocation) async {
      testDBUid = realInvocation.positionalArguments[0].uid;
      return realInvocation.positionalArguments[0].id;
    });

    final result = await useCase(
        params: SaveImageParams(
            image: await createTestImage(), name: "test_image"));

    expect(result, const Right(true));
    expect(testFileUid, testDBUid);
    verifyNever(_databaseRepository.removePlace(any));
  });

  test("should return failure when new place can't be created", () async {
    when(_databaseRepository.createNewPlace(name: anyNamed('name')))
        .thenThrow(Exception("Can't save data"));
    when(_databaseRepository.removePlace(any))
        .thenThrow(Exception("Can't remove data that doesn't exist in db"));

    final result = await useCase(
        params: SaveImageParams(
            image: await createTestImage(), name: "test_image"));

    expect(result, Left(Failure("Exception: Can't save data")));
    verifyNever(_databaseRepository.removePlace(any));
  });

  test("should return failure when can't save image", () async {
    reset(_databaseRepository);
    // create new place mock
    when(_databaseRepository.createNewPlace(name: anyNamed('name'))).thenAnswer(
        (realInvocation) async => Place(
            name: realInvocation.namedArguments[const Symbol('name')],
            id: 1,
            uid: "123123123"));
    // save image mock
    when(_fileRepository.saveImage(
            image: anyNamed('image'), uid: anyNamed('uid')))
        .thenThrow(const StdoutException("can't save image"));
    // remove place mock
    when(_databaseRepository.removePlace(any))
        .thenAnswer((realInvocation)async => true);

    final result = await useCase(
        params: SaveImageParams(
            image: await createTestImage(), name: "test_image"));

    expect(result, Left(Failure("StdoutException: can't save image")));
    verify(_databaseRepository.removePlace(any)).called(1);
  });

  test("should return failure when can't place in db again", ()async{
    reset(_databaseRepository);
    // create new place mock
    when(_databaseRepository.createNewPlace(name: anyNamed('name'))).thenAnswer(
            (realInvocation) async => Place(
            name: realInvocation.namedArguments[const Symbol('name')],
            id: 1,
            uid: "123123123"));
    // save image mock
    when(_fileRepository.saveImage(
        image: anyNamed('image'), uid: anyNamed('uid')))
        .thenAnswer((realInvocation) async => realInvocation.namedArguments[const Symbol('uid')]);
    // save place mock
    when(_databaseRepository.savePlace(any)).thenThrow(Exception("Can't save data to db"));
    // remove place mock
    when(_databaseRepository.removePlace(any))
        .thenAnswer((realInvocation)async => true);

    final result = await useCase(
        params: SaveImageParams(
            image: await createTestImage(), name: "test_image"));

    expect(result, Left(Failure("Exception: Can't save data to db")));
    verify(_databaseRepository.removePlace(any)).called(1);
  });
}
