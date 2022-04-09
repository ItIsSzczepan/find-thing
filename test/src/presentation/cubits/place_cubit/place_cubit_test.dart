import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/use_cases/edit_place_use_case.dart';
import 'package:find_thing/src/domain/use_cases/get_places_use_case.dart';
import 'package:find_thing/src/domain/use_cases/remove_place_use_case.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../models.dart';
import 'place_cubit_test.mocks.dart';

@GenerateMocks([GetPlacesUseCase, EditPlaceUseCase, RemovePlaceUseCase])
void main() {
  late MockGetPlacesUseCase mockGetPlacesUseCase;
  late MockEditPlaceUseCase mockEditPlaceUseCase;
  late MockRemovePlaceUseCase mockRemovePlaceUseCase;
  late PlaceCubit placeCubit;

  setUp(() {
    mockGetPlacesUseCase = MockGetPlacesUseCase();
    mockEditPlaceUseCase = MockEditPlaceUseCase();
    mockRemovePlaceUseCase = MockRemovePlaceUseCase();

    placeCubit = PlaceCubit(
        mockGetPlacesUseCase, mockEditPlaceUseCase, mockRemovePlaceUseCase);
  });

  test("PlaceCubit on init should return stream", () {
    expect(placeCubit.state, isA<PlaceInitial>());
  });

  blocTest<PlaceCubit, PlaceCubitState>(
      "PlaceCubit should return data state after getPlaces()",
      setUp: () => when(mockGetPlacesUseCase())
          .thenAnswer((realInvocation) async => const Right(Stream.empty())),
      build: () => placeCubit,
    act: (cubit) => cubit.getPlaces(),
    expect: () => [const PlaceData(stream: Stream.empty())]
  );

  blocTest<PlaceCubit, PlaceCubitState>("PlaceCubit should edit place",
      setUp: () => when(mockEditPlaceUseCase(params: anyNamed('params')))
          .thenAnswer((realInvocation) async => const Right(true)),
      build: () => placeCubit,
      act: (cubit) => cubit.edit(TestModels().examplePlace),
      expect: () => [],
      verify: (_) {
        verify(mockEditPlaceUseCase(params: anyNamed("params")));
      });

  blocTest<PlaceCubit, PlaceCubitState>(
      "PlaceCubit should add error if can't edit place",
      setUp: () => when(mockEditPlaceUseCase(params: anyNamed('params')))
          .thenAnswer((realInvocation) async => const Right(false)),
      build: () => placeCubit,
      act: (cubit) => cubit.edit(TestModels().examplePlace),
      expect: () => [isA<PlaceFailure>()],
      verify: (_) {
        verify(mockEditPlaceUseCase(params: anyNamed("params")));
      });

  blocTest<PlaceCubit, PlaceCubitState>("PlaceCubit should remove place",
      setUp: () => when(mockRemovePlaceUseCase(params: anyNamed('params')))
          .thenAnswer((realInvocation) async => const Right(true)),
      build: () => placeCubit,
      act: (cubit) => cubit.remove(TestModels().examplePlace.id),
      expect: () => [],
      verify: (_) {
        verify(mockRemovePlaceUseCase(params: anyNamed("params")));
      });

  blocTest<PlaceCubit, PlaceCubitState>(
      "PlaceCubit should add error if can't remove place",
      setUp: () => when(mockRemovePlaceUseCase(params: anyNamed('params')))
          .thenAnswer((realInvocation) async => const Right(false)),
      build: () => placeCubit,
      act: (cubit) => cubit.remove(TestModels().examplePlace.id),
      expect: () => [isA<PlaceFailure>()],
      verify: (_) {
        verify(mockRemovePlaceUseCase(params: anyNamed("params")));
      });
}
