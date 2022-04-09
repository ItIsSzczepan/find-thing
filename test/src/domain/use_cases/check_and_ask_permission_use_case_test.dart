import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/repositories/permission_repository.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart' as permission_lib;

import 'check_and_ask_permission_use_case_test.mocks.dart';

@GenerateMocks([PermissionRepository])
void main() {
  late CheckAndAskPermissionUseCase usecase;
  late MockPermissionRepository mockRepository;

  setUp(() {
    mockRepository = MockPermissionRepository();
    usecase = CheckAndAskPermissionUseCase(mockRepository);
    reset(mockRepository);
  });

  test("usecase should return status of permission if granted", () async {
    when(mockRepository.check(any)).thenAnswer(
        (realInvocation) async => permission_lib.PermissionStatus.granted);

    final result = await usecase(params: Permissions.file);

    expect(result, const Right(permission_lib.PermissionStatus.granted));
    verify(mockRepository.check(any));
  });

  test("usecase should return status of permission if not granted", () async {
    when(mockRepository.check(any)).thenAnswer(
        (realInvocation) async => permission_lib.PermissionStatus.denied);

    final result = await usecase(params: Permissions.file);

    expect(result, const Right(permission_lib.PermissionStatus.denied));
    verify(mockRepository.check(any));
  });

  test("usecase should return Failure if something throw error", () async {
    Exception testException = Exception("testException");
    when(mockRepository.check(any)).thenThrow(testException);

    final result = await usecase(params: Permissions.file);

    expect(result, Left(Failure(testException.toString())));
    verify(mockRepository.check(any));
  });
}
