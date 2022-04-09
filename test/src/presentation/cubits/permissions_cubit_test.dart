import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models.dart';
import 'permissions_cubit_test.mocks.dart';

@GenerateMocks([CheckAndAskPermissionUseCase])
void main() {
  late PermissionCubit cubit;
  late MockCheckAndAskPermissionUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockCheckAndAskPermissionUseCase();
    cubit = PermissionCubit(mockUseCase);
  });

  test("cubit should contain initial state at beginning", () {
    expect(cubit.state, const PermissionCubitState.initial());
  });

  blocTest<PermissionCubit, PermissionCubitState>(
      "cubit should return PermissionStatus after checking it",
      setUp: () => when(mockUseCase.call(params: anyNamed('params')))
          .thenAnswer((_) async => const Right(PermissionStatus.granted)),
      build: () => cubit,
      act: (cubit) => cubit.checkFile(),
      expect: () => [
            const PermissionCubitState.data(
                permissions: {Permissions.file: PermissionStatus.granted})
          ]);

  blocTest<PermissionCubit, PermissionCubitState>(
      "cubit should return PermissionStatus even if its not granted",
      setUp: () => when(mockUseCase.call(params: anyNamed('params')))
          .thenAnswer((_) async => const Right(PermissionStatus.denied)),
      build: () => cubit,
      act: (cubit) => cubit.checkFile(),
      expect: () => [
            const PermissionCubitState.data(
                permissions: {Permissions.file: PermissionStatus.denied})
          ]);

  blocTest<PermissionCubit, PermissionCubitState>(
      "cubit should return FailureState if any error will appear",
      setUp: () => when(mockUseCase.call(params: anyNamed('params')))
          .thenAnswer((_) async => Left(TestModels().exampleFailure)),
      build: () => cubit,
      act: (cubit) => cubit.checkFile(),
      expect: () =>
          [PermissionCubitState.failure(failure: TestModels().exampleFailure)]);
}
