import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/use_cases/remove_area_use_case.dart';
import 'package:find_thing/src/domain/use_cases/save_area_use_case.dart';
import 'package:find_thing/src/presentation/cubits/area_cubit/area_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../models.dart';
import 'area_cubit_test.mocks.dart';

@GenerateMocks([SaveAreaUseCase, RemoveAreaUseCase])
void main() {
  late MockSaveAreaUseCase saveAreaUseCase;
  late MockRemoveAreaUseCase removeAreaUseCase;
  late AreaCubit areaCubit;
  Area testArea = TestModels().exampleArea;

  setUp(() {
    saveAreaUseCase = MockSaveAreaUseCase();
    removeAreaUseCase = MockRemoveAreaUseCase();
    areaCubit = AreaCubit(testArea, saveAreaUseCase, removeAreaUseCase);
  });

  test("cubit should return Area on initial", () async {
    expect(areaCubit.state, testArea);
  });

  blocTest<AreaCubit, Area>(
      "cubit.move() shouldn't change position if can't save in db",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => Left(Failure(""))),
      build: () => areaCubit,
      act: (cubit) => cubit.move(x: 120.0),
      expect: () => [],
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>("cubit.move() should change position of area",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => const Right(12)),
      build: () => areaCubit,
      act: (cubit) => cubit.move(x: 150.0),
      expect: () {
        Area expectArea = testArea..x = 150.0;
        return [expectArea];
      },
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>("cubit.move() should throw a error if non arguments",
      build: () => areaCubit,
      act: (cubit) => cubit.move(),
      expect: () => [],
      errors: () => [],
      verify: (_) {
        verifyZeroInteractions(saveAreaUseCase);
      });

  blocTest<AreaCubit, Area>("cubit.size() should change size of area",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => const Right(12)),
      build: () => areaCubit,
      act: (cubit) => cubit.size(width: 150.0),
      expect: () {
        Area expectArea = testArea..width = 150.0;
        return [expectArea];
      },
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>("cubit.size() shouldn't change if can't save in db",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => Left(Failure(""))),
      build: () => areaCubit,
      act: (cubit) => cubit.size(width: 150.0),
      expect: () => [],
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>("cubit.size() should throw a error if non arguments",
      build: () => areaCubit,
      act: (cubit) => cubit.size(),
      expect: () => [],
      errors: () => [],
      verify: (_) {
        verifyZeroInteractions(saveAreaUseCase);
      });

  blocTest<AreaCubit, Area>("cubit.radius() should change radius of area",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => const Right(12)),
      build: () => areaCubit,
      act: (cubit) => cubit.radius(150.0),
      expect: () {
        Area expectArea = testArea..radius = 150.0;
        return [expectArea];
      },
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>(
      "cubit.radius() shouldn't change if can't save in db",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => Left(Failure(""))),
      build: () => areaCubit,
      act: (cubit) => cubit.radius(150.0),
      expect: () => [],
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>("cubit.content() should change content of area",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => const Right(12)),
      build: () => areaCubit,
      act: (cubit) => cubit.content("test"),
      expect: () {
        Area expectArea = testArea..content = "test";
        return [expectArea];
      },
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>(
      "cubit.content() shouldn't change if can't save in db",
      setUp: () => when(saveAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => Left(Failure(""))),
      build: () => areaCubit,
      act: (cubit) => cubit.content("test"),
      expect: () => [],
      verify: (_) {
        verify(saveAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>("cubit should remove area",
      setUp: () => when(removeAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => const Right(true)),
      build: () => areaCubit,
      act: (cubit) => cubit.remove(),
      expect: () => [],
      verify: (_) {
        verify(removeAreaUseCase(params: anyNamed('params')));
      });

  blocTest<AreaCubit, Area>("cubit shouldn't remove area if db can't do it",
      setUp: () => when(removeAreaUseCase.call(params: anyNamed("params")))
          .thenAnswer((realInvocation) async => const Right(false)),
      build: () => areaCubit,
      act: (cubit) => cubit.remove(),
      expect: () => [],
      verify: (_) {
        verify(removeAreaUseCase(params: anyNamed('params')));
      });
}
